## [1268. Search Suggestions System](https://leetcode.com/problems/search-suggestions-system)

```Tag```: ```Trie``` ```Binary Search``` ```Depth-First Search``` ```Two Pointers```

#### Difficulty: Medium

You are given an array of strings ```products``` and a string ```searchWord```.

Design a system that suggests at most three product names from ```products``` after each character of ```searchWord``` is typed. Suggested products should have common prefix with ```searchWord```. If there are more than three products with a common prefix return the three lexicographically minimums products.

Return _a list of lists of the suggested products after each character of ```searchWord``` is typed_.

![image](https://github.com/quananhle/Python/assets/35042430/e0aa9e7e-07bc-4478-b8f7-02fcc52d14ed)

---

__Example 1:__
```
Input: products = ["mobile","mouse","moneypot","monitor","mousepad"], searchWord = "mouse"
Output: [["mobile","moneypot","monitor"],["mobile","moneypot","monitor"],["mouse","mousepad"],["mouse","mousepad"],["mouse","mousepad"]]
Explanation: products sorted lexicographically = ["mobile","moneypot","monitor","mouse","mousepad"].
After typing m and mo all products match and we show user ["mobile","moneypot","monitor"].
After typing mou, mous and mouse the system suggests ["mouse","mousepad"].
```

__Example 2:__
```
Input: products = ["havana"], searchWord = "havana"
Output: [["havana"],["havana"],["havana"],["havana"],["havana"],["havana"]]
Explanation: The only word "havana" will be always suggested while typing the search word.
```

__Constraints:__

- $1 \le products.length \le 1000$
- $1 \le products[i].length \le 3000$
- $1 \le sum(products[i].length) \le 2 * 10^{4}$
- All the strings of ```products``` are unique.
- ```products[i]``` consists of lowercase English letters.
- $1 \le searchWord.length \le 1000$
- ```searchWord``` consists of lowercase English letters.

---

### Two Pointers

```Python
class Solution:
    def suggestedProducts(self, products: List[str], searchWord: str) -> List[List[str]]:
        n = len(products)
        products.sort()
        res = list()

        start, end = 0, n - 1
        for i, char in enumerate(searchWord):
            while start <= end and (i >= len(products[start]) or products[start][i] < char):
                start += 1
            while start <= end and (i >= len(products[end]) or products[end][i] > char):
                end -= 1
            
            if start <= end:
                res.append(products[start:min(start + 3, end + 1)])
            else:
                res.append([])
        
        return res
```

### Binary Search

```Python
class Solution:
    def suggestedProducts(self, products: List[str], searchWord: str) -> List[List[str]]:
        n = len(products)
        products.sort()  # Sort by increasing lexicographically order of products
        res = list()

        lo = 0
        prefix = list()
        for char in searchWord:
            prefix.append(char)
            lo = mi = bisect_left(products, "".join(prefix), lo, n)
            curr = list()
            for i in range(mi, min(mi + 3, n)):
                if products[i].startswith("".join(prefix)):
                    curr.append(products[i])
            res.append(curr)
        return res
```

### Trie

#### Depth-First Search

```Python
class Trie:
    def __init__(self):
        self.children = collections.defaultdict(Trie)
        self.word = None

    def insert(self, word):
        curr = self
        for c in word:
            curr = curr.children[c]
        curr.word = word

    def search(self):
        words = []

        def dfs(curr):
            if len(words) == 3: return
            if curr.word != None:
                words.append(curr.word)
            for c in ascii_lowercase:
                if c in curr.children:
                    dfs(curr.children[c])

        dfs(self)
        return words

class Solution:
    def suggestedProducts(self, products: List[str], searchWord: str) -> List[List[str]]:
        node = Trie()
        for word in products:
            node.insert(word)

        res = []
        curr = node
        for char in searchWord:
            if curr and char in curr.children:
                curr = curr.children[char]
                res.append(curr.search())
            else:
                curr = None
                res.append([])

        return res
```

#### Sorting

```Python
class Solution:
    def suggestedProducts(self, products: List[str], searchWord: str) -> List[List[str]]:
        class TrieNode:
            def __init__(self):
                self.children = collections.defaultdict(TrieNode)
                self.suggestion = []
            
            def add_sugestion(self, product):
                if len(self.suggestion) < 3:
                    self.suggestion.append(product)
        
        products = sorted(products)
        root = TrieNode()
        for p in products:
            node = root
            for char in p:
                node = node.children[char]
                node.add_sugestion(p)
        
        result, node = [], root
        for char in searchWord:
            node = node.children[char]
            result.append(node.suggestion)
        return result
```

