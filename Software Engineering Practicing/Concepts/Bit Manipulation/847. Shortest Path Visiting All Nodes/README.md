## [847. Shortest Path Visiting All Nodes](https://leetcode.com/problems/shortest-path-visiting-all-nodes)

```Tag```: ```Graph``` ```Dynamic Programming``` ```Depth-First Search``` ```Breadth-First Search``` ```Bitwise Manipulation```

#### Difficulty: Hard

You have an undirected, connected graph of ```n``` nodes labeled from ```0``` to ```n - 1```. You are given an array ```graph``` where ```graph[i]``` is a list of all the nodes connected with node ```i``` by an edge.

Return _the length of the shortest path that visits every node_. You may start and stop at any node, you may revisit nodes multiple times, and you may reuse edges.

![image](https://github.com/quananhle/Python/assets/35042430/e039d5f7-6d4f-4d03-b499-5196bf1bf1b7)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/05/12/shortest1-graph.jpg)
```
Input: graph = [[1,2,3],[0],[0],[0]]
Output: 4
Explanation: One possible path is [1,0,2,0,3]
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/05/12/shortest2-graph.jpg)
```
Input: graph = [[1],[0,2,4],[1,3,4],[2],[1,2]]
Output: 4
Explanation: One possible path is [0,1,4,2,3]
```

__Constraints:__

- $n == graph.length$
- $1 \le n \le 12$
- $0 \le graph[i].length \lt n$
- ```graph[i]``` does not contain ```i```.
- If ```graph[a]``` contains ```b```, then ```graph[b]``` contains ```a```.
- The input ```graph``` is always connected.

---

### Dynamic Programming

#### Depth-First Search with Top-Down Dynamic Programming

__Bit Manipulation To Encode State__

We can use bitmasks, which is a great tool to learn as many other problems can be solved more efficiently by using them. If there are ```n``` nodes, then there are $2^n$ possible states of nodes we have visited so far - for each node, we have either visited it or we haven't. Therefore, we can use an integer to represent the nodes that we have visited so far - if the $i^{th}$ bit of the integer (from the right side) is set to ```1```, then that means we have visited node ```i```.

![image](https://leetcode.com/problems/shortest-path-visiting-all-nodes/Figures/847/847_1.png)

While this is an easy and very efficient way to encode state, we also need to know how to do 2 things:

1. How to change the mask (flip certain bits, for example, if we visit the 6th node, how do we flip the 6th bit?)
2. How to tell what nodes we have visited so far (given a certain mask, how do we tell if we have visited the 4th node?)

To change the mask through flipping bits, we can start by taking the number ```1```. If we left shift ```1``` $i$ times, then we will end up with a binary number that only has a ```1``` in the $i^{th}$ position. For example, ```1 << 4``` equals ```16```, or ```'10000'``` in binary, which is just a ```1``` in the 4<sup>th</sup> position. We can then $XOR$ this number with our mask. Because ```1 XOR 1 = 0``` and ```1 XOR 0 = 1```, this would flip the bit in the 4<sup>th</sup> position of our mask.

![image](https://leetcode.com/problems/shortest-path-visiting-all-nodes/Figures/847/847_2.png)

Now, given a mask, how do we tell if a certain node has been visited? We can use the exact same process as above - let's say we wanted to check if the 7<sup>th</sup> node has been visited. Take the number ```1```, and left shift it ```7``` times. ```1 << 7``` equals ```128```, or ```10000000``` in binary. Now, instead of performing an $XOR$, perform an $AND$. If the mask has the 7<sup>th</sup> bit set to ```1```, then the $AND$ will just give us back the same number, ```128```. If the mask has the 7<sup>th</sup> bit set to ```0```, then the $AND$ will give us back ```0```. Thus, if the result of the $AND$ equals ```0```, then we know the node has not been visited yet.

![image](https://leetcode.com/problems/shortest-path-visiting-all-nodes/Figures/847/847_3.png)

__Algorithm__

1. Initialize some variables.

- ```n```, as the length of ```graph```.
- ```ending_mask = (1 << n) - 1```, a bitmask that represents all nodes being visited. For example, if ```n = 5```, then ```ending_mask = 31 = '11111'```.
- ```cache```, a data structure that will be used to cache results to prevent duplicate computation.

2. Create a function ```dp(node, mask)``` that will be used for DFS.

- First, check if this state has already been visited. If it has, return the cached result.
- If not, check for the base case. If ```(mask & (mask - 1)) == 0```, then we have visited all other nodes, return ```0```.
- Otherwise, add an entry into the cache for this state with a very large number like infinity. We need to do this before applying the recurrence relation to avoid the infinite cycles we talked about above.
- Now, apply the recurrence relation. For all neighbor in ```graph[node]```, explore both mask options: already visited ```(dp(neighbor, mask))``` or visiting for the first time ```(dp(neighbor, mask ^ (1 << node)))```. Choose the best option out of all adjacent states, add ```1``` to it, and update the entry in the ```cache``` for the current state.
- At the end of the recurrence application, just return the result for the current state stored in the cache.

3. Perform a DFS for each node - ```dp(node, ending_mask)``` for all node from ```0``` to ```n - 1```. Pick the lowest result and return it.

```Python

```
