## 2421. Number of Good Paths

```Tag```: ```Graph``` ```Tree```

#### Difficulty: Hard

There is a tree (i.e. a connected, undirected graph with no cycles) consisting of ```n``` nodes numbered from ```0``` to ```n - 1``` and exactly ```n - 1``` edges.

You are given a __0-indexed__ integer array ```vals``` of length ```n``` where ```vals[i]``` denotes the value of the i<sup>th</sup> node. You are also given a 2D integer array ```edges``` where ```edges[i]``` = [a<sub>i</sub>, b<sub>i</sub>] denotes that there exists an undirected edge connecting nodes a<sub>i</sub> and b<sub>i</sub>.

A __good path__ is a simple path that satisfies the following conditions:

The starting node and the ending node have the __same__ value.

All nodes between the starting node and the ending node have values less than or equal to the starting node (i.e. the starting node's value should be the maximum value along the path).

Return __the number of distinct good paths__.

Note that a path and its reverse are counted as the __same__ path. For example, ```0 -> 1``` is considered to be the same as ```1 -> 0```. A single node is also considered as a valid path.

![image](https://user-images.githubusercontent.com/35042430/212521622-a315c253-b3e2-453c-9eb4-cca727e76246.png)

---
