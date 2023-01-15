## 1061. Lexicographically Smallest Equivalent String

```Tag```: ```Union-Find```

#### Difficulty: Medium

You are given two strings of the same length ```s1``` and ```s2``` and a string ```baseStr```.

We say ```s1[i]``` and ```s2[i]``` are equivalent characters.

For example, if ```s1 = "abc"``` and ```s2 = "cde"```, then we have ```'a' == 'c'```, ```'b' == 'd'```, and ```'c' == 'e'```

Equivalent characters follow the usual rules of any equivalence relation:

- Reflexivity: ```'a' == 'a'```.
- Symmetry: ```'a' == 'b'``` implies ```'b' == 'a'```.
- Transitivity: ```'a' == 'b'``` and ```'b' == 'c'``` implies ```'a' == 'c'```.

For example, given the equivalency information from ```s1 = "abc"``` and ```s2 = "cde"```, ```"acd"``` and ```"aab"``` are equivalent strings of ```baseStr = "eed"```, and ```"aab"``` is the lexicographically smallest equivalent string of ```baseStr```.

Return _the lexicographically smallest equivalent string of ```baseStr``` by using the equivalency information from ```s1``` and ```s2```_.

![image](https://user-images.githubusercontent.com/35042430/212457305-d8cfebe4-2492-4982-a181-ea37b57bfd7a.png)

---

__Example 1:__
```
Input: s1 = "parker", s2 = "morris", baseStr = "parser"
Output: "makkek"
Explanation: Based on the equivalency information in s1 and s2, we can group their characters as [m,p], [a,o], [k,r,s], [e,i].
The characters in each group are equivalent and sorted in lexicographical order.
So the answer is "makkek".
```

__Example 2:__
```
Input: s1 = "hello", s2 = "world", baseStr = "hold"
Output: "hdld"
Explanation: Based on the equivalency information in s1 and s2, we can group their characters as [h,w], [d,e,o], [l,r].
So only the second letter 'o' in baseStr is changed to 'd', the answer is "hdld".
```

__Example 3:__
```
Input: s1 = "leetcode", s2 = "programs", baseStr = "sourcecode"
Output: "aauaaaaada"
Explanation: We group the equivalent characters in s1 and s2 as [a,o,e,r,s,c], [l,p], [g,t] and [d,m], thus all letters in baseStr except 'u' and 'd' are transformed to 'a', the answer is "aauaaaaada".
```

__Constraints:__
```
1 <= s1.length, s2.length, baseStr <= 1000
s1.length == s2.length
s1, s2, and baseStr consist of lowercase English letters.
```

---

### Optimized “disjoint set” with Path Compression and Union by Rank

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)] 
        self.rank = [1] * size
        self.count = size

    def find(self, x):
        if x == self.root[x]:
            return x
        else:
            self.root[x] = self.find(self.root[x])
            return self.root[x]

    def union(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)
        if root_x != root_y:
            if root_x < root_y:
                self.root[root_y] = root_x
            else:
                self.root[root_x] = root_y
            self.count -= 1
            return True
        else:
            return False
        
        def get_count(self):
            return self.count
        
        def connected(self, x, y):
            return self.find(x) == self.find(y)

class Solution:
    def smallestEquivalentString(self, s1: str, s2: str, baseStr: str) -> str:
        res = list()
        union_find = UnionFind(26)
        # Union merge for all the edges
        for i in range(len(s1)):
            '''
            union_find.union(ord(s1[i]) - 97, ord(s2[i]) - 97)
            '''
            union_find.union(ord(s1[i]) - ord('a'), ord(s2[i]) - ord('a'))
        # Iterate over all the characters from 0 until 26, and make each character represent itself in root vector
        for i in range(26):
            union_find.find(i)
        # Map the characters to the representative of characters in the string baseStr
        for c in baseStr:
            '''
            x = union_find.find(ord(c) - 97)
            res.append(chr(x + 97))
            '''
            res.append(chr(union_find.find(ord(c) - ord('a')) + ord('a')))
        return "".join(res)
        # return "".join(chr(ord('a') + union_find.find(ord(c) - 97)) for c in baseStr)
```

### Optimized “disjoint set” with Path Compression and Union by Rank with Hash Table

```Python
class UnionFind:
    def __init__(self, size):
        self.root = collections.defaultdict()
        self.rank = [1] * size
        self.count = size

    def find(self, x):
        '''
        self.root.setdefault(x, x)
        '''
        if not x in self.root:
            self.root[x] = x        
        if x != self.root[x]:
            self.root[x] = self.find(self.root[x])
        return self.root[x]

    def union(self, x, y):
        root_x = self.find(x)
        root_y = self.find(y)
        if root_x != root_y:
            if root_x < root_y:
                self.root[root_y] = root_x
            else:
                self.root[root_x] = root_y
            self.count -= 1
            return True
        else:
            return False
        
        def get_count(self):
            return self.count
        
        def connected(self, x, y):
            return self.find(x) == self.find(y)

class Solution:
    def smallestEquivalentString(self, s1: str, s2: str, baseStr: str) -> str:
        union_find = UnionFind(26)
        # Union the two equivalent characters from s1 and s2 into the same group
        for i in range(len(s1)):
            union_find.union(s1[i], s2[i])
        res = list()
        for c in baseStr:
            # Find the root of the character in baseStr
            res.append(union_find.find(c))
        return "".join(res)
```
