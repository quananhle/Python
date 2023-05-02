## [1065. Index Pairs of a String](https://leetcode.com/problems/index-pairs-of-a-string/)

```Tag```: ```Sliding Window``` ```Hash Set``` ```Trie```

#### Difficulty: Easy

Given a string ```text``` and an array of strings ```words```, return _an array of all index pairs ```[i, j]``` so that the substring ```text[i...j]``` is in ```words```_.

Return the pairs ```[i, j]``` in __sorted order__ (i.e., sort them by their first coordinate, and in case of ties sort them by their second coordinate).

![image](https://user-images.githubusercontent.com/35042430/235569431-d24c9a39-9e06-408e-a3e7-7574ff3e9231.png)

---

__Example 1:__
```
Input: text = "thestoryofleetcodeandme", words = ["story","fleet","leetcode"]
Output: [[3,7],[9,13],[10,17]]
```

__Example 2:__
```
Input: text = "ababa", words = ["aba","ab"]
Output: [[0,1],[0,2],[2,3],[2,4]]
Explanation: Notice that matches can overlap, see "aba" is found in [0,2] and [2,4].
```

__Constraints:__

- ```1 <= text.length <= 100```
- ```1 <= words.length <= 20```
- ```1 <= words[i].length <= 50```
- ```text``` and ```words[i]``` consist of lowercase English letters.
- All the strings of ```words``` are unique.

---

### ✅ Sliding Window

```Python
class Solution:
    def indexPairs(self, text: str, words: List[str]) -> List[List[int]]:
        n = len(text)
        words = set(words)
        lengths = set(len(word) for word in words)
        res = []

        for window in lengths:
            for start in range(n - window + 1):
                if text[start:start + window] in words:
                    res.append([start, start + window - 1])

        return sorted(res)
```

### Hash Set

![image](https://user-images.githubusercontent.com/35042430/235575118-1bed904c-99f7-40ed-858e-7f03dc0815f2.png)

```Python
class Solution:
    def indexPairs(self, text: str, words: List[str]) -> List[List[int]]:
        words = set(words)
        res = list()
        n = len(text)

        for start in range(n):
            for end in range(start, n):
                if text[start:end + 1] in words:
                    res.append([start, end])
        
        return res
```

### Trie

![image](https://leetcode.com/problems/index-pairs-of-a-string/Figures/1065/1065_trie.png)

__Algorithm__

1. Maintain the ```trie```. Insert all elements from ```words``` into it. Each trie node contains (possibly zero) outgoing edges to other nodes and a flag that indicates whether the string corresponding to the node belongs to the words set (whether it is marked).
2. Iterate ```i``` from ```0``` to ```text.length - 1```.
- Let ```p``` be the trie node corresponding to the current substring, which is empty now. ```p``` is the trie root initially.
- Iterate ```j``` from ```i``` to ```text.length - 1```
    - If an outgoing edge from ```p``` labeled with ```text[j]``` does not exist, we cannot add characters to the current substring anymore, so break from the loop. Otherwise, traverse this edge and set ```p``` to its child. If the node is marked, it means ```text[i...j]``` belongs to the set of ```words```, so add the pair ```[i, j]``` to the answer.
    - __Note__: this optimization is what makes this approach much more efficient because we break from the loop once we know there cannot be any more answers.
3. Return the answer.

![image](https://user-images.githubusercontent.com/35042430/235579726-124571ec-6425-46a2-b249-9f79dec9579b.png)

```Python
class TrieNode:
    def __init__(self):
        self.flag = False
        self.next = collections.defaultdict()

class Trie:
    def __init__(self):
        self.root = TrieNode()
    
    def insert(self, word):
        p = self.root
        for c in word:
            if not c in p.next:
                p.next[c] = TrieNode()
            p = p.next[c]
        p.flag = True

class Solution:
    def indexPairs(self, text: str, words: List[str]) -> List[List[int]]:
        trie = Trie()
        for word in words:
            trie.insert(word)

        n = len(text)
        res = list()
        for i in range(n):
            p = trie.root
            for j in range(i, n):
                if not text[j] in p.next:
                    break
                p = p.next[text[j]]
                if p.flag:
                    res.append([i, j])

        return res   
```
 
