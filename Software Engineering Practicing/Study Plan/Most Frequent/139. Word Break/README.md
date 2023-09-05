## [139. Word Break](https://leetcode.com/problems/word-break)

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Trie``` ```Dynamic Programming```

#### Difficulty: Medium

Given a string ```s``` and a dictionary of strings ```wordDict```, return _```true``` if ```s``` can be segmented into a space-separated sequence of one or more dictionary words_.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

![image](https://github.com/quananhle/Python/assets/35042430/e13855c8-e6ea-474c-a4f2-58dd96987b72)

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

### Breadth-First Search

We start at node ```0```, which represents the empty string. We want to reach node ```s.length```, which implies that we have built the entire string. We can run a BFS to accomplish this traversal.

At each node ```start```, we iterate over all the nodes ```end``` that come after ```start```. For each ```end```, we check if the substring between ```start```, ```end``` is in ```wordDict```. If it is, we can add ```end``` to the ```queue```.

We will first convert ```wordDict``` into a set so that we can perform the checks in constant time. We will also use a data structure ```seen``` to prevent us from visiting a node more than once.

__Algorithm__

1. Convert ```wordDict``` into a set ```words```.
2. Initialize a ```queue``` with ```0``` and a set ```seen```.
3. While the ```queue``` is not empty:
    - Remove the first element, ```start```.
    - If ```start == s.length```, return ```true```.
    - Iterate ```end``` from ```start + 1``` up to and including ```s.length```. For each ```end```, if ```end``` has not been visited yet,
        - Check the substring starting at ```start``` and ending before ```end```. If it is in ```words```, add ```end``` to the ```queue``` and mark it in seen.
4. Return ```false``` if the BFS finishes without reaching the final node.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^3 + m \cdot k)$
- __Space Complexity__: $\mathcal{O}(n + m \cdot k)$

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

### Depth-First Search (Time Limit Exceeded)

```Python
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        n = len(s)
        words = set(wordDict)
        seen = set()

        def dfs(start):
            # Base case
            if start == n:
                return True
            
            for end in range(start + 1, n + 1):
                if end in seen:
                    continue
                
                if s[start:end] in words and dfs(end) :
                    seen.add(end)
                    return True
            
            return False

        return dfs(0)
```

---

### The Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        n = len(s)
        words = set(wordDict)
        memo = collections.defaultdict(bool)

        def dp(start):
            # Base case
            if start == n:
                return True

            if start in memo:
                return memo[start]
            
            for end in range(start + 1, n + 1):
                if s[start:end] in words and dp(end):
                    memo[start] = True
                    return True

            memo[start] = False
            return False
        
        return dp(0)
```

```Python
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        n = len(s)
        words = set(wordDict)

        @functools.lru_cache(maxsize=None)
        def dp(start):
            # Base case
            if start == n:
                return True
            
            for end in range(start + 1, n + 1):
                if s[start:end] in words and dp(end):
                    return True

            return False
        
        return dp(0)
```

#### Bottom-Up Dynamic Programming

```Python

```

---

### Trie

#### Depth-First Search with Trie

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
