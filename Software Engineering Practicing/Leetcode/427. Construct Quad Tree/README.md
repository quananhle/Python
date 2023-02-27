## [427. Construct Quad Tree](https://leetcode.com/problems/construct-quad-tree/)

```Tag```: ```Recursion``` ```Divide and Conquer``` ```Tree``` ```Matrix```

#### Difficulty: Medium

Given a ```n * n``` matrix ```grid``` of ```0's``` and ```1's``` only. We want to represent the ```grid``` with a __Quad-Tree__.

Return _the root of the Quad-Tree representing the ```grid```_.

Notice that you can assign the value of a node to __True__ or __False__ when ```isLeaf``` is __False__, and both are accepted in the answer.

A __Quad-Tree__ is a tree data structure in which each internal node has exactly four children. Besides, each node has two attributes:

- ```val```: __True__ if the node represents a ```grid``` of ```1'```s or __False__ if the node represents a grid of ```0'```s.
- ```isLeaf```: __True__ if the node is leaf node on the tree or __False__ if the node has the four children.
