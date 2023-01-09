## 547. Number of Provinces

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union-Find```

### Difficulty: Medium

There are ```n``` cities. Some of them are connected, while some are not. If city ```a``` is connected directly with city ```b```, and city ```b``` is connected directly with city ```c```, then city ```a``` is connected indirectly with city ```c```.

A province is a group of directly or indirectly connected cities and no other cities outside of the group.

You are given an ```n x n``` matrix ```isConnected``` where ```isConnected[i][j] = 1``` if the i<sup>th</sup> city and the j<sup>th</sup> city are directly connected, and ```isConnected[i][j] = 0``` otherwise.

Return _the total number of provinces_.

---




