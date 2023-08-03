## [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/)

```Tag```: ```SQL``` ```Pandas```

![image](https://github.com/quananhle/Python/assets/35042430/16be5217-c6c0-42d2-9351-f0fee5929b02)

```SQL
Create table If Not Exists Products (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'))
Truncate table Products
insert into Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N')
insert into Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y')
insert into Products (product_id, low_fats, recyclable) values ('4', 'N', 'N')
```

```Python
Products = pd.DataFrame([], columns=['product_id', 'low_fats', 'recyclable']).astype({'product_id':'int64', 'low_fats':'category', 'recyclable':'category'})
```

![image](https://github.com/quananhle/Python/assets/35042430/a97ee5d7-aeca-43dd-b22e-8a6b5391b2dd)

---

__Example 1__:

![image](https://github.com/quananhle/Python/assets/35042430/14e1a3f3-e343-4d56-b14e-a8d8e7e6f812)

---

```MySQL
SELECT product_id FROM products WHERE low_fats = "Y" AND recyclable ="Y";
```

```Python
import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    df = products[(products['low_fats'] == 'Y') & (products['recyclable'] == 'Y')]
    return df[['product_id']]
```
