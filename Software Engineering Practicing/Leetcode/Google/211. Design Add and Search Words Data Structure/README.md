## [211. Design Add and Search Words Data Structure](https://leetcode.com/problems/design-add-and-search-words-data-structure/)

```Tag```: ```Design``` ```Trie``` ```Hash Map```

#### Difficulty: Medium

Design a data structure that supports adding new words and finding if a string matches any previously added string.

Implement the ```WordDictionary``` class:

- ```WordDictionary()``` Initializes the object.
- ```void addWord(word)``` Adds ```word``` to the data structure, it can be matched later.
- ```bool search(word)``` Returns ```true``` if there is any string in the data structure that matches ```word``` or ```false``` otherwise. ```word``` may contain dots ```'.'``` where dots can be matched with any letter.

---

__Example:__
```
Input
["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
Output
[null,null,null,null,false,true,true,true]

Explanation
WordDictionary wordDictionary = new WordDictionary();
wordDictionary.addWord("bad");
wordDictionary.addWord("dad");
wordDictionary.addWord("mad");
wordDictionary.search("pad"); // return False
wordDictionary.search("bad"); // return True
wordDictionary.search(".ad"); // return True
wordDictionary.search("b.."); // return True
```

__Constraints:__

- ```1 <= word.length <= 25```
- ```word``` in ```addWord``` consists of lowercase English letters.
- ```word``` in ```search``` consist of ```'.'``` or lowercase English letters.
- There will be at most ```3``` dots in ```word``` for ```search``` queries.
- At most 10<sup>4</sup> calls will be made to ```addWord``` and ```search```.

---

### Hash Map

```Python
class WordDictionary:

    def __init__(self):
        self.dict = collections.defaultdict(set)
        
    def addWord(self, word: str) -> None:
        self.dict[len(word)].add(word)

    def search(self, word: str) -> bool:
        n = len(word)
        for lookup in self.dict[n]:
            i = 0
            while i < n and (lookup[i] == word[i] or word[i] == '.'):
                i += 1
            if i == n:
                return True
        return False

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary()
# obj.addWord(word)
# param_2 = obj.search(word)
```

### Trie

There are two main types of trie interview questions:

- Standard Trie. Design a structure to dynamically add and search strings, for example
  - [Add and Search Word](https://leetcode.com/problems/design-add-and-search-words-data-structure/editorial/).
  - [Word Search II](https://leetcode.com/articles/word-search-ii).
  - [Design Search Autocomplete System.](https://leetcode.com/articles/design-search-autocomplete-system/)
- Bitwise Trie. Design a structure to dynamically add binary strings and compute maximum/minimum XOR/AND/etc, for example
  - [Maximum XOR of Two Number in an Array](https://leetcode.com/articles/maximum-xor-of-two-numbers-in-an-array/).

__addWord__

![image](https://user-images.githubusercontent.com/35042430/226152232-358b964c-394a-4ecb-9645-b5eb40df2eff.png)

![image](https://leetcode.com/problems/design-add-and-search-words-data-structure/Figures/211/trie.png)

__Search in Trie__

![image](https://leetcode.com/problems/design-add-and-search-words-data-structure/Figures/211/search2.png)

The presence of ```'.'``` characters forces us to explore all possible paths at each ```.``` level.

![image](https://leetcode.com/problems/design-add-and-search-words-data-structure/Figures/211/search_dot.png)

```Python
class WordDictionary:

    def __init__(self):
        self.trie = dict()
        
    def addWord(self, word: str) -> None:
        node = self.trie

        for c in word:
            if not c in node:
                node[c] = dict()
            node = node[c]
        node['$'] = True

    def search(self, word: str) -> bool:
        def dfs(word, node):
            for i, c in enumerate(word):
                if not c in node:
                    # Check if the current character is '.'
                    if c == '.':
                        # Check all possible nodes at this level
                        for x in node:
                            if x != '$' and dfs(word[i+1:], node[x]):
                                return True
                    return False
                else:
                    node = node[c]
            return '$' in node
        return dfs(word, self.trie)


# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary()
# obj.addWord(word)
# param_2 = obj.search(word)
```

![image](https://user-images.githubusercontent.com/35042430/226152679-d822d420-01ce-4b14-99e5-a5035465ef9a.png)
