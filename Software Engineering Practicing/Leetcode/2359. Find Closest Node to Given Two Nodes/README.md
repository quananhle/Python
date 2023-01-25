## 2359. Find Closest Node to Given Two Nodes

```Tag```: ```Depth-First Search```

#### Difficulty: Medium

You are given a __directed__ graph of ```n``` nodes numbered from ```0``` to ```n - 1```, where each node has __at most one__ outgoing edge.

The graph is represented with a given __0-indexed__ array ```edges``` of size ```n```, indicating that there is a directed edge from node ```i``` to node ```edges[i]```. If there is no outgoing edge from ```i```, then ```edges[i] == -1```.

You are also given two integers ```node1``` and ```node2```.

Return _the index of the node that can be reached from both ```node1``` and ```node2```, such that the maximum between the distance from node1 to that node, and from node2 to that node is __minimized___. If there are multiple answers, return _the node with the __smallest index___, and if no possible answer exists, return ```-1```.

Note that ```edges``` may contain cycles.

---

 
