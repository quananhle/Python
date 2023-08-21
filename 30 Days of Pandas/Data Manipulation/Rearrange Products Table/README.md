## [1795. Rearrange Products Table](https://leetcode.com/problems/rearrange-products-table)

```Tag```: ```SQL``` ```Pandas```

#### Difficulty: Easy

```MySQL
Create table If Not Exists Products (product_id int, store1 int, store2 int, store3 int)
Truncate table Products
insert into Products (product_id, store1, store2, store3) values ('0', '95', '100', '105')
insert into Products (product_id, store1, store2, store3) values ('1', '70', 'None', '80')
```

```Python
data = [[0, 95, 100, 105], [1, 70, None, 80]]
Products = pd.DataFrame(data, columns=['product_id', 'store1', 'store2', 'store3']).astype({'product_id':'int64', 'store1':'int64', 'store2':'int64', 'store3':'int64'})
```

---

![image](https://github.com/quananhle/Python/assets/35042430/802ac3bc-bf29-4aa4-8830-2d58c41b42ff)

---

![image](https://github.com/quananhle/Python/assets/35042430/11333c7f-25f8-4253-b0b6-141f182b08b3)

---

```Python
import pandas as pd

def rearrange_products_table(products: pd.DataFrame) -> pd.DataFrame:
  a = products.loc[products['store1'].notna(), ['product_id', 'store1']]
  a['store'] = "store1"
  a.rename(columns={'store1':'price'}, inplace=True)
  a = a[['product_id', 'store', 'price']]

  b = products.loc[products['store2'].notna(), ['product_id', 'store2']]
  b['store'] = "store2"
  b.rename(columns={'store2':'price'}, inplace=True)
  b = b[['product_id', 'store', 'price']]
    
  c = products.loc[products['store3'].notna(), ['product_id', 'store3']]
  c['store'] = "store3"
  c.rename(columns={'store3':'price'}, inplace=True)
  c = c[['product_id', 'store', 'price']]
      
  answer = pd.concat([a, b, c])
  return answer
```

```MySQL
SELECT product_id, 'store1' AS store, store1 AS price 
FROM Products 
WHERE store1 IS NOT NULL
UNION 
SELECT product_id, 'store2' AS store, store2 AS price 
FROM Products 
WHERE store2 IS NOT NULL
UNION 
SELECT product_id, 'store3' AS store, store3 AS price 
FROM Products 
WHERE store3 IS NOT NULL
```
