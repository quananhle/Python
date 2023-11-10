## [1743. Restore the Array From Adjacent Pairs](https://leetcode.com/problems/restore-the-array-from-adjacent-pairs)

```Tag```: ```Graph``` ```Depth-First Search``` ```Linked List```

#### Difficulty: Medium

There is an integer array ```nums``` that consists of ```n``` unique elements, but you have forgotten it. However, you do remember every pair of adjacent elements in ```nums```.

You are given a 2D integer array ```adjacentPairs``` of size ```n - 1``` where each $adjacentPairs[i] = [u_i, v_i]$ indicates that the elements $u_i$ and $v_i$ are adjacent in ```nums```.

It is guaranteed that every adjacent pair of elements ```nums[i]``` and ```nums[i+1]``` will exist in ```adjacentPairs```, either as ```[nums[i], nums[i+1]]``` or ```[nums[i+1], nums[i]]```. The pairs can appear in any order.

Return _the original array nums_. If there are multiple solutions, return any of them.

---

__Example 1:__
```
Input: adjacentPairs = [[2,1],[3,4],[3,2]]
Output: [1,2,3,4]
Explanation: This array has all its adjacent pairs in adjacentPairs.
Notice that adjacentPairs[i] may not be in left-to-right order.
```

__Example 2:__
```
Input: adjacentPairs = [[4,-2],[1,4],[-3,1]]
Output: [-2,4,1,-3]
Explanation: There can be negative numbers.
Another solution is [-3,1,4,-2], which would also be accepted.
```

__Example 3:__
```
Input: adjacentPairs = [[100000,-100000]]
Output: [100000,-100000]
```

__Constraints:__

- $nums.length == n$
- $adjacentPairs.length == n - 1$
- $adjacentPairs[i].length == 2$
- $2 \le n \le 10^5$
- $-10^5 \le nums[i], u_i, v_i \le 10^5$
- There exists some nums that has ```adjacentPairs``` as its pairs.

---

### Depth-First Search

#### Recursive DFS

```Python
class Solution:
    def restoreArray(self, adjacentPairs: List[List[int]]) -> List[int]:
        n = len(adjacentPairs)

        adjacent_graph = collections.defaultdict(list)
        for u, v in adjacentPairs:
            adjacent_graph[u].append(v)
            adjacent_graph[v].append(u)

        m = len(adjacent_graph)

        start = None
        for node in adjacent_graph:
            if len(adjacent_graph[node]) == 1:
                start = node
                break

        res = list()
        def dfs(curr, prev):
            res.append(curr)
            for next in adjacent_graph[curr]:
                if next != prev:
                    dfs(next, curr)
        
        dfs(start, None)

        return res
```

#### Iterative DFS

```Python
class Solution:
    def restoreArray(self, adjacentPairs: List[List[int]]) -> List[int]:
        n = len(adjacentPairs)

        adjacent_graph = collections.defaultdict(list)
        for u, v in adjacentPairs:
            adjacent_graph[u].append(v)
            adjacent_graph[v].append(u)

        m = len(adjacent_graph)

        start = None
        for node in adjacent_graph:
            if len(adjacent_graph[node]) == 1:
                start = node
                break

        res = list()
        stack = [(start, None)]

        while stack:
            curr, prev = stack.pop()
            res.append(curr)
            for next in adjacent_graph[curr]:
                if next != prev:
                    stack.append((next, curr))
        
        return res
```

### Iterative Linked List Path

```Python
class Solution:
    def restoreArray(self, adjacentPairs: List[List[int]]) -> List[int]:
        n = len(adjacentPairs)

        adjacent_graph = collections.defaultdict(list)
        for u, v in adjacentPairs:
            adjacent_graph[u].append(v)
            adjacent_graph[v].append(u)

        m = len(adjacent_graph)

        root = None
        for node in adjacent_graph:
            if len(adjacent_graph[node]) == 1:
                root = node
                break

        curr = root
        res = [root]
        prev = None

        while len(res) < m:
            for next in adjacent_graph[curr]:
                if next != prev:
                    res.append(next)
                    curr, prev = next, curr
                    break
        
        return res
```
