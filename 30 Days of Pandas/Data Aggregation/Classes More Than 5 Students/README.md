## [596. Classes More Than 5 Students](https://leetcode.com/problems/classes-more-than-5-students)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

![image](https://github.com/quananhle/Python/assets/35042430/e527c52f-65ca-4aa2-b19e-ec94b35a95ef)

```SQL
Create table If Not Exists orders (order_number int, customer_number int)
Truncate table orders
insert into orders (order_number, customer_number) values ('1', '1')
insert into orders (order_number, customer_number) values ('2', '2')
insert into orders (order_number, customer_number) values ('3', '3')
insert into orders (order_number, customer_number) values ('4', '3')
```

```Python
data = [[1, 1], [2, 2], [3, 3], [4, 3]]
orders = pd.DataFrame(data, columns=['order_number', 'customer_number']).astype({'order_number':'Int64', 'customer_number':'Int64'})
```

![image](https://github.com/quananhle/Python/assets/35042430/e24b10cd-993a-4389-a20e-4abd3ff78915)

---

![image](https://github.com/quananhle/Python/assets/35042430/b0b809ac-375a-4362-a001-fd5bb561c726)

---

```Python

```

```MySQL
# Write your MySQL query statement below

```

