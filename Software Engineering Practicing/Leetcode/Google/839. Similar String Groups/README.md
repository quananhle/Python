## [839. Similar String Groups](https://leetcode.com/problems/similar-string-groups)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Union Find```

#### Difficulty: Hard

Two strings ```X``` and ```Y``` are similar if we can swap two letters (in different positions) of ```X```, so that it equals ```Y```. Also two strings ```X``` and ```Y``` are similar if they are equal.

For example, ```"tars"``` and ```"rats"``` are similar (swapping at positions ```0``` and ```2```), and ```"rats"``` and ```"arts"``` are similar, but ```"star"``` is not similar to ```"tars"```, ```"rats"```, or ```"arts"```.

Together, these form two connected groups by similarity: ```{"tars", "rats", "arts"}``` and ```{"star"}```.  Notice that ```"tars"``` and ```"arts"``` are in the same group even though they are not similar.  Formally, each group is such that a word is in the group if and only if it is similar to at least one other word in the group.

We are given a list ```strs``` of strings where every string in ```strs``` is an anagram of every other string in ```strs```. How many groups are there?

![image](https://user-images.githubusercontent.com/35042430/235188769-f59d6ff8-3bcc-4b2e-832e-28c91bf21093.png)

---

__Example 1:__
```
Input: strs = ["tars","rats","arts","star"]
Output: 2
```

__Example 2:__
```
Input: strs = ["omv","ovm"]
Output: 1
```

__Constraints:__

- ```1 <= strs.length <= 300```
- ```1 <= strs[i].length <= 300```
- ```strs[i]``` consists of lowercase letters only.
- All words in ```strs``` have the same length and are anagrams of each other.

---

### Depth-First Search

![image](https://leetcode.com/problems/similar-string-groups/Figures/839/839-1.png)

- __Time complexity__: O(n<sup>2</sup> * m)
- __Space complexity__: O(n<sup>2</sup>)

```Python
class Solution:
    def numSimilarGroups(self, strs: List[str]) -> int:
        n = len(strs)

        def similar(s, t):
            diff = 0
            for i in range(len(s)):
                if s[i] != t[i]:
                    diff += 1
            return diff == 0 or diff == 2

        # Build the adjacent graph
        graph = collections.defaultdict(list)
        for i in range(n):
            for j in range(i + 1, n):
                if similar(strs[i], strs[j]):
                    graph[i].append(j)
                    graph[j].append(i)

        visited = set()

        def dfs(node):
            visited.add(node)
            if not node in graph:
                return
            
            for neighbor in graph[node]:
                if not neighbor in visited:
                    visited.add(neighbor)
                    dfs(neighbor)
        
        count = 0
        for node in range(n):
            if not node in visited:
                dfs(node)
                count += 1

        return count 
```

### Breadth-First Search

- __Time complexity__: O(n<sup>2</sup> * m)
- __Space complexity__: O(n<sup>2</sup>)

```Python
class Solution:
    def numSimilarGroups(self, strs: List[str]) -> int:
        n = len(strs)

        def similar(s, t):
            diff = 0
            for i in range(len(s)):
                if s[i] != t[i]:
                    diff += 1
            return diff == 0 or diff == 2

        # Build the adjacent graph
        graph = collections.defaultdict(list)
        for i in range(n):
            for j in range(i + 1, n):
                if similar(strs[i], strs[j]):
                    graph[i].append(j)
                    graph[j].append(i)

        visited = set()

        def bfs(node):
            queue = collections.deque()
            queue.append(node)
            visited.add(node)

            while queue:
                node = queue.popleft()
                if not node in graph:
                    return
                
                for neighbor in graph[node]:
                    if not neighbor in visited:
                        visited.add(neighbor)
                        queue.append(neighbor)

        count = 0
        for node in range(n):
            if not node in visited:
                bfs(node)
                count += 1

        return count
```

### Union Find

__Algorithm__

1. Createa an integer variable ```n``` which stores the number of words in ```strs```.
2. Create an instance of ```UnionFind``` of size ```n```.
3. For any two words at index ```i``` and ```j``` that behave as nodes, we check whether the words ```strs[i]``` and ```strs[j]``` are similar or not by iterating over all the letters of the words. The words are similar if they are equal or differ only at two indices.
    - If the words are similar, we use the ```find``` operation to determine the components of both the nodes.
    - If both nodes belong to different components, we use the ```union``` operation over both nodes to combine the two different connected components into a single one. We also decrement ```count``` by ```1```.
6. Return ```count```.

- __Time complexity__: O(n<sup>2</sup> * m)
- __Space complexity__: O(n)

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [1] * size 
        self.size = size

    def find(self, x):
        if x == self.root[x]:
            return x
        self.root[x] = self.find(self.root[x])
        return self.root[x]

    def union(self, x, y):
        root_x, root_y = self.find(x), self.find(y)
        if root_x != root_y:
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += root_x
            else:
                self.root[root_y] = root_x
                self.rank[root_x] = root_y
            self.size -= 1

    def get_count(self):
        return self.size

    def connected(self, x, y):
        return self.find(x) == self.find(y)

class Solution:
    def numSimilarGroups(self, strs: List[str]) -> int:
        n = len(strs)

        def similar(s, t):
            diff = 0
            for i in range(len(s)):
                if s[i] != t[i]:
                    diff += 1
            return diff == 0 or diff == 2

        uf = UnionFind(n)
        count = n
        for i in range(n):
            for j in range(i + 1, n):
                if similar(strs[i], strs[j]) and uf.find(i) != uf.find(j):
                    count -= 1
                    uf.union(i, j)

        return count
```
