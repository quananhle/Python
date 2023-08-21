## [1173. Immediate Food Delivery I](https://leetcode.com/problems/immediate-food-delivery-i)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

```MySQL
Create table If Not Exists Accounts (account_id int, income int)
Truncate table Accounts
insert into Accounts (account_id, income) values ('3', '108939')
insert into Accounts (account_id, income) values ('2', '12747')
insert into Accounts (account_id, income) values ('8', '87709')
insert into Accounts (account_id, income) values ('6', '91796')
```

```Python
data = [[3, 108939], [2, 12747], [8, 87709], [6, 91796]]
Accounts = pd.DataFrame(data, columns=['account_id', 'income']).astype({'account_id':'Int64', 'income':'Int64'})
```

![image](https://github.com/quananhle/Python/assets/35042430/40b17b99-949f-4f36-9180-40dedf04e7ae)

---

![image](https://github.com/quananhle/Python/assets/35042430/0becdf92-8105-4623-a602-8e2450e5bf6c)

---

```Python

```

```MySQL

```
