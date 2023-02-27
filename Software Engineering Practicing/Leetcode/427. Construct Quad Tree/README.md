## [427. Construct Quad Tree](https://leetcode.com/problems/construct-quad-tree/)

```Tag```: ```Recursion``` ```Divide and Conquer``` ```Tree``` ```Matrix```

#### Difficulty: Medium

Given a ```n * n``` matrix ```grid``` of ```0's``` and ```1's``` only. We want to represent the ```grid``` with a __Quad-Tree__.

Return _the root of the Quad-Tree representing the ```grid```_.

Notice that you can assign the value of a node to __True__ or __False__ when ```isLeaf``` is __False__, and both are accepted in the answer.

A __Quad-Tree__ is a tree data structure in which each internal node has exactly four children. Besides, each node has two attributes:

- ```val```: __True__ if the node represents a ```grid``` of ```1'```s or __False__ if the node represents a grid of ```0'```s.
- ```isLeaf```: __True__ if the node is leaf node on the tree or __False__ if the node has the four children.

```
class Node {
    public boolean val;
    public boolean isLeaf;
    public Node topLeft;
    public Node topRight;
    public Node bottomLeft;
    public Node bottomRight;
}
```

We can construct a __Quad-Tree__ from a two-dimensional area using the following steps:

- If the current ```grid``` has the same value (i.e all ```1's``` or all ```0's```) set ```isLeaf``` True and set ```val``` to the value of the grid and set the four children to Null and stop.
- If the current ```grid``` has different values, set ```isLeaf``` to False and set ```val``` to any value and divide the current grid into four sub-grids as shown in the photo.

Recurse for each of the children with the proper sub-grid.

![image](https://assets.leetcode.com/uploads/2020/02/11/new_top.png)

![image](https://user-images.githubusercontent.com/35042430/221471894-b303aead-c366-4903-801b-43272bf07fc3.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/02/11/grid1.png)
```
Input: grid = [[0,1],[1,0]]
Output: [[0,1],[1,0],[1,1],[1,1],[1,0]]
Explanation: The explanation of this example is shown below:
Notice that 0 represnts False and 1 represents True in the photo representing the Quad-Tree.
```

![image](https://assets.leetcode.com/uploads/2020/02/12/e1tree.png)

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/02/12/e2mat.png)
```
Input: grid = [[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0]]
Output: [[0,1],[1,1],[0,1],[1,1],[1,0],null,null,null,null,[1,0],[1,0],[1,1],[1,1]]
Explanation: All values in the grid are not the same. We divide the grid into four sub-grids.
The topLeft, bottomLeft and bottomRight each has the same value.
The topRight have different values so we divide it into 4 sub-grids where each has the same value.
Explanation is shown in the photo below:
```

![image](https://assets.leetcode.com/uploads/2020/02/12/e2tree.png)

__Constraints:__

- ```n == grid.length == grid[i].length```
- ```n == 2^x where 0 <= x <= 6```

---

```Python
"""
# Definition for a QuadTree node.
class Node:
    def __init__(self, val, isLeaf, topLeft, topRight, bottomLeft, bottomRight):
        self.val = val
        self.isLeaf = isLeaf
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
"""

class Solution:
    def construct(self, grid: List[List[int]]) -> 'Node':
        def compare_value(row, col, side_size):
            value = grid[row][col]
            for r in range(row, row + side_size):
                for c in range(col, col + side_size):
                    if grid[r][c] != value:
                        return False
            return True
        
        def build(row, col, side_size):
            if compare_value(row, col, side_size):
                return Node(grid[row][col], True)

            root = Node(0, False)
            side_size = side_size // 2
            root.topLeft = build(row, col, side_size)
            root.topRight = build(row, col + side_size, side_size)
            root.bottomLeft = build(row + side_size, col, side_size)
            root.bottomRight = build(row + side_size, col + side_size, side_size)
            return root
        
        return build(0, 0, len(grid))
```


