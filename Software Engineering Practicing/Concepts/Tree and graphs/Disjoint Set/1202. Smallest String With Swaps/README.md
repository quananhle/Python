## 1202. Smallest String With Swaps



#### Difficulty: Medium

You are given a string ```s```, and an array of pairs of indices in the string ```pairs``` where ```pairs[i] = [a, b]``` indicates 2 indices(0-indexed) of the string.

You can swap the characters at any pair of indices in the given ```pairs``` any number of times.

Return _the lexicographically smallest string that ```s``` can be changed to after using the swaps_.

![image](https://user-images.githubusercontent.com/35042430/211417589-38e64021-9824-4dd6-9b2c-b14089b5375e.png)

---

__Example 1:__
```
Input: s = "dcab", pairs = [[0,3],[1,2]]
Output: "bacd"
Explaination: 
Swap s[0] and s[3], s = "bcad"
Swap s[1] and s[2], s = "bacd"
```

__Example 2:__
```
Input: s = "dcab", pairs = [[0,3],[1,2],[0,2]]
Output: "abcd"
Explaination: 
Swap s[0] and s[3], s = "bcad"
Swap s[0] and s[2], s = "acbd"
Swap s[1] and s[2], s = "abcd"
```

__Example 3:__
```
Input: s = "cba", pairs = [[0,1],[1,2]]
Output: "abc"
Explaination: 
Swap s[0] and s[1], s = "bca"
Swap s[1] and s[2], s = "bac"
Swap s[0] and s[1], s = "abc"
```

__Constraints:__
```
1 <= s.length <= 10^5
0 <= pairs.length <= 10^5
0 <= pairs[i][0], pairs[i][1] < s.length
s only contains lower case English letters.
```

---

![image](https://leetcode.com/problems/smallest-string-with-swaps/solutions/1862995/Figures/1202/Slide1.png)

### Optimized “disjoint set” with Path Compression and Union by Rank
#### Time Complexity : ```O((E + N) ⋅ α(N) + NlogN)```, ```union()``` method takes amortized time complexity for each union-find operation is ```O(α(N))``` while traversing through each pair costs ```O(E⋅α(N))``` time. Iterate through the string s of size ```N``` and perform ```find()``` costs ```O(N⋅α(N))```. Sort() takes NlogN time.
#### Space Complexity: ```O(N)```, extra memory space required to build a hash table contain as many as N keys 

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [1] * size
        self.count = size
    
    def find(self, x):
        # Check if the node is the root node of itself
        if x == self.root[x]:
            return x
        # Otherwise, keep looking for the root node
        else:
            self.root[x] = self.find(self.root[x])
            return self.root[x]
    
    def union(self, x, y):
        # Get the root nodes of x and y
        root_x = self.find(x)
        root_y = self.find(y)
        # Check if the root of x and the root of y are not in the same group
        if root_x != root_y:
            # Merge the lower-rank group into higher-rank group
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += root_x
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += root_y
            # Update the number of group after the merge
            self.count -= 1
            return True
        else:
            return False

class Solution:
    def smallestStringWithSwaps(self, s: str, pairs: List[List[int]]) -> str:
        union_find = UnionFind(len(s))
        # Iterate over the edges
        for edge in pairs:
            source, destination = edge[0], edge[1]
            union_find.union(source, destination)
        
        root_to_component = collections.defaultdict(list)
        for i in range(len(s)):
            root = union_find.find(i)
            root_to_component[root].append(i)

        res = list(s)
        for key, indices in root_to_component.items():
            chars = []
            for i in indices:
                chars.append(s[i])
            print (chars)
            chars = sorted(chars)

            for c, i in zip(chars, indices):
                res[i] = c
                
        return "".join(res)
```
