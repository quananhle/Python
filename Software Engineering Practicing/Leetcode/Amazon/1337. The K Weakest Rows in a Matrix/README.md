## [1337. The K Weakest Rows in a Matrix](https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix)

```Tag```: ```Priority Queue``` ```Binary Search``` ```Array & String``` ```Linear Search``` ```Sorting``` 

#### Difficulty: Easy

You are given an ```m x n``` binary matrix ```mat``` of ```1```'s (representing soldiers) and ```0```'s (representing civilians). The soldiers are positioned in front of the civilians. That is, all the ```1```'s will appear to the left of all the ```0```'s in each row.

A row ```i``` is weaker than a row ```j``` if one of the following is true:

- The number of soldiers in row ```i``` is less than the number of soldiers in row ```j```.
- Both rows have the same number of soldiers and ```i < j```.

Return _the indices of the ```k``` weakest rows in the matrix ordered from weakest to strongest_.

![image](https://github.com/quananhle/Python/assets/35042430/0b7c6992-1cea-4832-8dde-92fa8520c754)

---

__Example 1:__
```
Input: mat = 
[[1,1,0,0,0],
 [1,1,1,1,0],
 [1,0,0,0,0],
 [1,1,0,0,0],
 [1,1,1,1,1]], 
k = 3
Output: [2,0,3]
Explanation: 
The number of soldiers in each row is: 
- Row 0: 2 
- Row 1: 4 
- Row 2: 1 
- Row 3: 2 
- Row 4: 5 
The rows ordered from weakest to strongest are [2,0,3,1,4].
```

__Example 2:__
```
Input: mat = 
[[1,0,0,0],
 [1,1,1,1],
 [1,0,0,0],
 [1,0,0,0]], 
k = 2
Output: [0,2]
Explanation: 
The number of soldiers in each row is: 
- Row 0: 1 
- Row 1: 4 
- Row 2: 1 
- Row 3: 1 
The rows ordered from weakest to strongest are [0,2,3,1].
```

__Constraints:__

- $m == mat.length$
- $n == mat[i].length$
- $2 \le n, m \le 100$
- $1 \le k \le m$
- $matrix[i][j]$ is either ```0``` or ```1```.

---

![image](https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/Figures/1337/row_counts.png)

### Linear Search 

#### Sort

__Complexity Analysis__

- __Time Complexity__: $O(m \cdot (n + \log \,m))$.
- __Space Complexity__: $O(m)$.

```Python
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        ROWS, COLS = len(mat), len(mat[0])
        res = list()

        for row in range(ROWS):
            counts_1 = 0
            for col in range(COLS):
                if mat[row][col] == 1:
                    counts_1 += 1
            res.append((counts_1, row))

        res.sort()
        h = list()
        for i in range(k):
            h.append(res[i][1])

        return h
```

#### Sum() & List Comprehension

```Python
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        ROWS = len(mat)
        res = list()

        for row in range(ROWS):
            res.append((sum(mat[row]), row))

        res.sort()
        return [i for _, i in res[:k]]
```

```Python
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        res = [(sum(row), i) for i, row in enumerate(mat)]
        res.sort()
        return [i for _, i in res[:k]]
```

#### Priority Queue

```Python
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        ROWS, COLS = len(mat), len(mat[0])
        res = list()

        for row in range(ROWS):
            res.append((sum(mat[row]), row))

        h = list()
        for soldiers, i in res:
            pair = (-soldiers, -i)
            heapq.heappush(h, pair)
            if len(h) > k:
                heapq.heappop(h)

        res = list()
        while h:
            _, i = heapq.heappop(h)
            res.append(-i)

        return [num for num in res[::-1]]
```

---

### Binary Search

#### Sorting/ Map

Here's the pseudocode forthe binary search algorithm (Template 2):

```Python
lo = 0
hi = n
while lo < hi:
    mi = lo + (hi - lo) // 2
    if row[mi] == 1:
        lo = mi + 1
    else:
        hi = mi
return lo
```

![image](https://github.com/quananhle/Python/assets/35042430/a4a8d82c-502e-41ba-8165-e72ae8b68cf5)

![image](https://github.com/quananhle/Python/assets/35042430/0c3249d4-09a5-4f07-8160-8dc2f18203b1)

![image](https://github.com/quananhle/Python/assets/35042430/27694e9a-91da-49ee-b909-175e5efa5d8c)

![image](https://github.com/quananhle/Python/assets/35042430/3e0bd128-a076-4da7-9c01-a190641a66e7)

![image](https://github.com/quananhle/Python/assets/35042430/919f52ec-22dd-4727-a9da-52ddaf113944)

![image](https://github.com/quananhle/Python/assets/35042430/b91cfc7f-c534-45a8-9c60-14e5ebc9f7e4)

![image](https://github.com/quananhle/Python/assets/35042430/e08b3d41-20ac-49a3-aee9-81f65eea88cb)

![image](https://github.com/quananhle/Python/assets/35042430/b47edeaa-7ccd-44c4-a7a7-ee4c98b2c2f8)

![image](https://github.com/quananhle/Python/assets/35042430/5c10a607-d3ed-44a8-a6cf-9cb0aeca76b9)

![image](https://github.com/quananhle/Python/assets/35042430/3e6adbfe-e792-4103-b74f-5702ce4c5ea3)

__Complexity Analysis__

- __Time Complexity__: $O(m \cdot \log mn)$.
- __Space Complexity__: $O(m)$.

```Python
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        ROWS, COLS = len(mat), len(mat[0])

        def binary_search(row):
            lo, hi = 0, COLS
            while lo < hi:
                mi = lo + (hi - lo) // 2
                if row[mi] == 1:
                    lo = mi + 1
                else:
                    hi = mi
            return lo
        
        res = list()
        for i, row in enumerate(mat):
            res.append((binary_search(row), i))
        
        res.sort()
        return [i for _, i in res[:k]]
```

### Binary Search

#### Priority Queue

> Python has a Min-Priority Queue called ```heapq```. We can convert it into a Max-Priority Queue by putting a negative sign in front of all the numbers going into it.

```Python
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        ROWS, COLS = len(mat), len(mat[0])

        def binary_search(row):
            lo, hi = 0, COLS
            while lo < hi:
                mi = lo + (hi - lo) // 2
                if row[mi] == 1:
                    lo = mi + 1
                else:
                    hi = mi
            return lo

        h = list()
        for i, row in enumerate(mat):
            pair = (-binary_search(row), -i)
            if len(h) < k or pair > h[0]:
                heapq.heappush(h, pair)
            if len(h) > k:
                heapq.heappop(h)
            
        res = list()
        while h:
            _, i = heapq.heappop(h)
            res.append(-i)
        
        res = res[::-1]
        return res
```

---

### Vertical Scan

On each cell we pass that is a ```0```, we check if the cell to the left was a ```1```. If it was, then we're on the first ```0``` of that row and should add its index to our output list. Once there are ```k``` indexes in the output list, we simply return the list. The order in which the rows are found using this approach turns out to be the sorted order we want!

```Python
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        ROWS, COLS = len(mat), len(mat[0])

        res = list()
        for col, row in itertools.product(range(COLS), range(ROWS)):
            if len(res) == k: break
            # Check if in the first column, or the adjacent cell to the left of the current cell (0) is 1
            if mat[row][col] == 0 and (col == 0 or mat[row][col - 1] == 1):
                res.append(row)

        # Cover edge case when the rows contain entirely 1's
        i = 0
        while len(res) < k:
            if mat[i][-1] == 1:
                res.append(i)
            i += 1
        
        return res
```

```Python
class Solution:
    def kWeakestRows(self, mat: List[List[int]], k: int) -> List[int]:
        ROWS, COLS = len(mat), len(mat[0])
        res = collections.defaultdict(bool)

        # Vertical traversal
        for col in range(COLS):
            for row in range(ROWS):
                # Check if current cell is 1 or current row index already in record, continue to the next row
                if mat[row][col] or row in res: continue
                # Otherwise, mark the row as found and decrement k
                res[row] = True
                k -= 1
                # Exit early and return output once got enough k rows
                if not k: return res.keys()
            
        # To cover edge case when after vertical scanning, k is not enough, entire row contain 1's
        for row in range(ROWS):
            if not row in res:
                res[row] = True
                k -= 1
                if not k: return res.keys()
```
