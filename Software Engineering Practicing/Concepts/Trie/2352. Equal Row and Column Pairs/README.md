## [2352. Equal Row and Column Pairs](https://leetcode.com/problems/equal-row-and-column-pairs)

```Tag```: ```Trie``` ```Hash Map``` ```Matrix```

#### Difficulty: Medium

Given a __0-indexed__ ```n x n``` integer matrix ```grid```, return _the number of pairs (r<sub>i</sub>, c<sub>j</sub>) such that row r<sub>i</sub> and column c<sub>j</sub> are equal_.

A row and column pair is considered equal if they contain the same elements in the same order (i.e., an equal array).

![image](https://github.com/quananhle/Python/assets/35042430/79aaa830-93f6-4005-8cc3-c2f4cdf0bfc1)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/06/01/ex1.jpg)
```
Input: grid = [[3,2,1],[1,7,6],[2,7,7]]
Output: 1
Explanation: There is 1 equal row and column pair:
- (Row 2, Column 1): [2,7,7]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/06/01/ex2.jpg)
```
Input: grid = [[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]]
Output: 3
Explanation: There are 3 equal row and column pairs:
- (Row 0, Column 0): [3,1,2,2]
- (Row 2, Column 2): [2,4,2,2]
- (Row 3, Column 2): [2,4,2,2]
```

__Constraints:__

- ```n == grid.length == grid[i].length```
- ```1 <= n <= 200```
- ```1 <= grid[i][j] <= 10^5```

---

### Brute Force

![image](https://leetcode.com/problems/equal-row-and-column-pairs/Figures/2352/b1.png)

- __Time Complexity__: $O(n^3)$
- __Space Complexity__: $O(1)$

```Python
class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        ans = 0
        n = len(grid)

        for row in range(n):
            for col in range(n):
                match = True

                for i in range(n):
                    if grid[row][i] != grid[i][col]:
                        match = False
                        break
                
                ans += int(match)
            
        return ans
```

### Hash Map

![image](https://leetcode.com/problems/equal-row-and-column-pairs/Figures/2352/1.png)

![image](https://leetcode.com/problems/equal-row-and-column-pairs/Figures/2352/2.png)

![image](https://leetcode.com/problems/equal-row-and-column-pairs/Figures/2352/3.png)

__Algorithm__

1. Create an empty hash map ```rows``` and set ```count``` to ```0```.

2. For each row ```row``` in the ```grid```, convert it into an equivalent hashable object and use it as a key to the ```rows```. Increment the value of the corresponding key by ```1```.

3. For each ```column``` in the ```grid```, convert it into the same type of hashable object and check if it appears in the ```rows```. If it does, increment ```count``` by the frequency.

4. Return the answer ```count```.

- __Time Complexity__: $O(n^2)$
- __Space Complexity__: $O(n^2)$

```Python
class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        count = 0
        n = len(grid)
        rows = collections.defaultdict(int)

        # Traverse the rows
        for row in grid:
            rows[tuple(row)] = 1 + rows.get(tuple(row), 0)

        # Traverse the columns
        for c in range(n):
            col = [grid[r][c] for r in range(n)]
            count += rows[tuple(col)]

        return count
```

#### ```Counter()```

```Python
class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        count = 0
        n = len(grid)

        # Traverse the rows
        rows = collections.Counter(tuple(row) for row in grid)

        # Traverse the columns
        for c in range(n):
            col = [grid[r][c] for r in range(n)]
            count += rows[tuple(col)]

        return count
```

### Trie

Trie, also known as prefix tree, is a tree-like data structure which is often used to store strings (In this problem, we store arrays of integers instead of strings). The key advantage of trie is its efficient search time, which can be achieved in $O(n)$ time where $n$ is the length of the array. Trie works by storing each element of the array in a separate node, and each node has an array of children representing the possible characters that can follow the current element.

![image](https://leetcode.com/problems/equal-row-and-column-pairs/Figures/2352/t1.png)

![image](https://leetcode.com/problems/equal-row-and-column-pairs/Figures/2352/t2.png)

![image](https://leetcode.com/problems/equal-row-and-column-pairs/Figures/2352/t3.png)

![image](https://github.com/quananhle/Python/assets/35042430/b7045e6d-cd74-4143-b493-26902ee5b843)

```Python
class TrieNode:

    def __init__(self):
        self.count = 0
        self.children = collections.defaultdict()

class Trie:

    def __init__(self):
        self.trie = TrieNode()

    def insert(self, array):
        trie = self.trie
        for e in array:
            if not e in trie.children:
                trie.children[e] = TrieNode()
            trie = trie.children[e]
        trie.count += 1

    def search(self, array):
        trie = self.trie
        for e in array:
            if e in trie.children:
                trie = trie.children[e]
            else:
                return 0
        return trie.count

class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        trie = Trie()
        count = 0
        n = len(grid)

        for row in grid:
            trie.insert(row)
        
        for c in range(n):
            col = [grid[r][c] for r in range(n)]
            count += trie.search(col)
        
        return count
```
