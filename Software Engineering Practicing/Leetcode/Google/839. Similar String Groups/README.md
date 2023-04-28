## [839. Similar String Groups](https://leetcode.com/problems/similar-string-groups)

```Tag```: ```Depth-First Search```

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
