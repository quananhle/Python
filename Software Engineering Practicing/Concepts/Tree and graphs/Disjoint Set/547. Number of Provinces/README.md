## 547. Number of Provinces

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union-Find```

### Difficulty: Medium

There are ```n``` cities. Some of them are connected, while some are not. If city ```a``` is connected directly with city ```b```, and city ```b``` is connected directly with city ```c```, then city ```a``` is connected indirectly with city ```c```.

A province is a group of directly or indirectly connected cities and no other cities outside of the group.

You are given an ```n x n``` matrix ```isConnected``` where ```isConnected[i][j] = 1``` if the i<sup>th</sup> city and the j<sup>th</sup> city are directly connected, and ```isConnected[i][j] = 0``` otherwise.

Return _the total number of __provinces___.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/12/24/graph1.jpg)
```
Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
Output: 2
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/12/24/graph2.jpg)
```
Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
Output: 3
```

__Constraints:__
```
1 <= n <= 200
n == isConnected.length
n == isConnected[i].length
isConnected[i][j] is 1 or 0.
isConnected[i][i] == 1
isConnected[i][j] == isConnected[j][i]
```

---

### Depth-First Search

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:

```

### Breadth-First Search

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
    
```

### Union-Find

```Python
class Solution:
    def findCircleNum(self, isConnected: List[List[int]]) -> int:
    

```

