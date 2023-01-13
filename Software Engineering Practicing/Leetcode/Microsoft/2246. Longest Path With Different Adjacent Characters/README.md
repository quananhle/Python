## 2246. Longest Path With Different Adjacent Characters

```Tag```: ```Tree``` ```Graph```  ```Depth-First Search```

#### Difficulty: Hard

You are given a __tree__ (i.e. a connected, undirected graph that has no cycles) __rooted__ at node ```0``` consisting of ```n``` nodes numbered from ```0``` to ```n - 1```. The tree is represented by a __0-indexed__ array ```parent``` of size ```n```, where ```parent[i]``` is the parent of node ```i```. Since node ```0``` is the root, ```parent[0] == -1```.

You are also given a string ```s``` of length ```n```, where ```s[i]``` is the character assigned to node ```i```.

Return _the length of the longest path in the tree such that no pair of adjacent nodes on the path have the same character assigned to them_.

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/03/25/testingdrawio.png)
```
Input: parent = [-1,0,0,1,1,2], s = "abacbe"
Output: 3
Explanation: The longest path where each two adjacent nodes have different characters in the tree is the path: 0 -> 1 -> 3. The length of this path is 3, so 3 is returned.
It can be proven that there is no longer path that satisfies the conditions. 
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/03/25/graph2drawio.png)
```
Input: parent = [-1,0,0,0], s = "aabc"
Output: 3
Explanation: The longest path where each two adjacent nodes have different characters is the path: 2 -> 0 -> 3. The length of this path is 3, so 3 is returned.
```

__Constraints:__
```
n == parent.length == s.length
1 <= n <= 105
0 <= parent[i] <= n - 1 for all i >= 1
parent[0] == -1
parent represents a valid tree.
s consists of only lowercase English letters.
```

---

### Depth-First Search

Intuitively, we can think that for any parent node, the longest path will be formed by choosing at most the two longest chains of its child nodes. Here's a visual explanation of the two scenarios that could occur where node ```p``` is the parent node:

![image](https://leetcode.com/problems/longest-path-with-different-adjacent-characters/solutions/2889382/Figures/2246/2246-1.png)

So, for a node ```p``` if we find the two longest chains of its child nodes, say ```L1``` and ```L2``` we can compute the longest path centered at node ```p```. For each node, we can find the maximum of value ```1 + L1 + L2``` to find the answer. The addition of one comes for the node ```p``` itself.


```Python
class Solution:
    def longestPath(self, parent: List[int], s: str) -> int:
        # Depth-First Search
        tree = collections.defaultdict(list)
        for pos, par in enumerate(parent):
            tree[par].append(pos)
        
        res = 1

        def dfs(curr=0):
            nonlocal res
            # Longest and second longest path starting from current node, not includinh the current node itself
            longest = second_longest = 0
            next_nodes = tree[curr]
            for node in next_nodes:
                # Get the number of nodes in the longest chain starting from the child, including the child.                
                point = dfs(node)
                if s[node] != s[curr]:
                    # Update the length of the top two longest paths
                    if point > longest:
                        second_longest, longest = longest, point
                    elif point > second_longest:
                        second_longest = point
            # Add 1 of the current node to the two chains
            res = max(res, longest + second_longest + 1)
            # Return the length of the longest chain including the current node which is longest chain + 1
            return longest + 1

        dfs()
        return res
```
