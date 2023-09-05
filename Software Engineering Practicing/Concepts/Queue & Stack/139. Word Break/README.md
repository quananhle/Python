## [139. Word Break](https://leetcode.com/problems/word-break)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Trie```

#### Difficulty: Medium

Given a string ```s``` and a dictionary of strings ```wordDict```, return _```true``` if ```s``` can be segmented into a space-separated sequence of one or more dictionary words_.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

![image](https://user-images.githubusercontent.com/35042430/219778036-477a29ba-d8d6-4d23-a329-111121cf2e9b.png)

---

__Example 1:__
```
Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".
```

__Example 2:__
```
Input: s = "applepenapple", wordDict = ["apple","pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
Note that you are allowed to reuse a dictionary word.
```

__Example 3:__
```
Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false
```

__Constraints:__

- ```1 <= s.length <= 300```
- ```1 <= wordDict.length <= 1000```
- ```1 <= wordDict[i].length <= 20```
- ```s``` and ```wordDict[i]``` consist of only lowercase English letters.
- All the ```strings``` of ```wordDict``` are unique.

---

### Depth-First Search

```Python
class TrieNode:
    def __init__(self):
        self.found = False
        self.child = collections.defaultdict(TrieNode)
    
    def add(self, word):
        trie = self
        for c in word:
            trie = trie.child[c]
        trie.found = True

class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        # Depth-First Search
        root = TrieNode()
        for word in wordDict:
            root.add(word)

        n = len(s)
        stack = [False] * (n+1)
        stack[n] = True

        for start in range(n - 1, -1, -1):
            trie = root
            for end in range(start + 1, n + 1):
                c = s[end - 1]
                if c not in trie.child: 
                    break
                trie = trie.child[c]
                if trie.found and stack[end]:
                    stack[start] = True
                    break
        
        return stack[0]
```

### Breadth-First Search

```Python
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        # Breadth-First Search
        visited = set()
        word_set = set(wordDict)
        n = len(s)

        # Start at index 0 of string s
        queue = collections.deque([0])

        while queue:
            start = queue.popleft()
            
            # Base case
            if start in visited:
                continue
            visited.add(start)
            
            for end in range(start + 1, n + 1):
                if s[start:end] in word_set:
                    queue.append(end)
                    if end == len(s):
                        return True
        return False
```
