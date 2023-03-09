# Update Chassis Info to Central Database

## Process Flow

![image](https://gitlab.fii-corp.com/swd-hou/hou_cimsv2/-/blob/quan/Chassis_CR/21.drawio.png)

## Low Level Design:

1. __STX Wuxi__

    a. FTP/SFTP access to SFTP Server ```10.12.134.46```

    b. Go to the directory ```CHASSIS_UPLOAD```

    c. Upload file in ```.xls``` format

2.	__GDL__

  a.	Schedule/Run `Airflow DAGs`

  b.	`Airflow` scheduler triggers the task instances and calls `CIMS App API` in `10.12.134.68`

  c.	`CIMS App` is getting called and run its methods:

      i.	Execute database function ```fn_GetLuNamebyValue``` to get control values from ```10.12.134.40```:

      ```Python
        path_to_download = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_UPLOAD' , ''))
        path_to_read 	   = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_IN' , ''))
        path_to_write 	 = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_OUT' , ''))
        path_to_fail 	   = db_obj.get_control_values(db_conn, ('CHASSIS_CENTRAL_DB_FAIL' , ''))

        stored_procedure = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP' , ''))
        server_transtype = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SFTP_SERVER_TRANSTYPE' , ''))
        valid_transtype  = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_VALIDATE_TRANSTYPE' , ''))
        save_transtype 	 = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_DATA_TRANSTYPE' , ''))
        log_transtype 	 = db_obj.get_control_values(db_conn, ('CHASSIS_UPLOAD_SP_LOG_TRANSTYPE' , ''))
      ```

      ```
        /CHASSIS_UPLOAD/
        /CHASSIS_IN/
        /CHASSIS_OUT/
        /CHASISS_FAIL/
        Exec [dbo].[chassis_info_upload_sp] ?
        SFTP_SERVER_CONFIG
        SAVE_CHASSIS
        SAVE_LOG
        VALIDATE_FILE
      ```
        
		  ii.	Execute the stored procedure with transtype ```SFTP_SERVER_CONFIG``` to get the token and keys, decrypt in the backend and connect to SFTP server ```10.12.134.46```
      
		  iii. Using the control values, call ```FTP/SFTP``` access method to access to ```10.12.134.46``` and go to directory ```/CHASSIS_UPLOAD/```
      
		  iv.	Loop through every file in the directory:
      
        -	Execute stored procedure ```chassis_info_upload_sp``` with transtype ```VALIDATE_FILE``` to validate file

        -	If file is in correct format: add to file set
      
        -	If file is not in correct format: save log, move to file to ```/CHASSIS_FAIL/```, and check the next file

        -	If there is no more file in ```/CHASSIS_UPLOAD/```: end the task

      v.	Method to process file is called:
      
        -	Move file to ```/CHASSIS_IN/```

        -	Loop until there is no values left in the file:

          -	Read file by lines and split instaces by delimiters

          -	Parse the value as the parameter of stored procedure ```chassis_info_upload_sp``` and execute the SP with transtype ```SAVE_CHASSIS```

		    -	If there  is no values to read in the file, move the file to ```/CHASSIS_OUT/```



