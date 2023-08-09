## [1527. Patients With a Condition](https://leetcode.com/problems/patients-with-a-condition)

```Tag```: ```SQL``` ```Pandas``` ```Regular Expression```

#### Difficulty: Easy

```MySQL
Create table If Not Exists Patients (patient_id int, patient_name varchar(30), conditions varchar(100))
Truncate table Patients
insert into Patients (patient_id, patient_name, conditions) values ('1', 'Daniel', 'YFEV COUGH')
insert into Patients (patient_id, patient_name, conditions) values ('2', 'Alice', '')
insert into Patients (patient_id, patient_name, conditions) values ('3', 'Bob', 'DIAB100 MYOP')
insert into Patients (patient_id, patient_name, conditions) values ('4', 'George', 'ACNE DIAB100')
insert into Patients (patient_id, patient_name, conditions) values ('5', 'Alain', 'DIAB201')
```

```Python
data = [[1, 'Daniel', 'YFEV COUGH'], [2, 'Alice', ''], [3, 'Bob', 'DIAB100 MYOP'], [4, 'George', 'ACNE DIAB100'], [5, 'Alain', 'DIAB201']]
Patients = pd.DataFrame(data, columns=['patient_id', 'patient_name', 'conditions']).astype({'patient_id':'int64', 'patient_name':'object', 'conditions':'object'})
```

![image](https://github.com/quananhle/Python/assets/35042430/7e7e2f01-bbc8-4918-9b7a-e13d2a223e55)

---

![image](https://github.com/quananhle/Python/assets/35042430/cbe1a671-e097-416b-8863-0b5a8ccb9576)

---

### Regular Expression

```Python
import pandas as pd

def find_patients(patients: pd.DataFrame) -> pd.DataFrame:
    df = patients[patients["conditions"].str.contains(r"\bDIAB1", regex=True)]
    return df
```
