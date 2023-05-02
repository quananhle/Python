## [1697. Checking Existence of Edge Length Limited Paths](https://leetcode.com/problems/checking-existence-of-edge-length-limited-paths/)

```Tag```: ```Union Find```

#### Difficulty: Hard

An undirected graph of ```n``` nodes is defined by ```edgeList```, where ```edgeList[i]``` = [u<sub>i</sub>, v<su>i</sub>, dis<sub>i</sub>] denotes an edge between nodes u<sub>i</sub> and v<sub>i</sub> with distance dis<sub>i</sub>. Note that there may be multiple edges between two nodes.

Given an array ```queries```, where ```queries[j]``` = [p<sub>j</sub>, q<sub>j</sub>, limit<sub>j</sub>], your task is to determine for each ```queries[j]``` whether there is a path between p<sub>j</sub> and q<sub>j</sub> such that each edge on the path has a distance strictly less than limit<sub>j</sub> .

Return _a boolean array answer, where ```answer.length == queries.length``` and the j<sup>th</sup> value of answer is ```true``` if there is a path for ```queries[j]``` is ```true```, and ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/235581334-1640db86-f60f-4836-a36d-a6b5179dba83.png)
