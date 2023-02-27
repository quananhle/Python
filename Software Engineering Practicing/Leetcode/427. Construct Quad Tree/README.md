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
