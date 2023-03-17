## [208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)

```Tag```: ```Hash Map``` ```Trie```

#### Difficulty: Medium

A trie (pronounced as "try") or __prefix tree__ is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

Implement the Trie class:

- ```Trie()``` Initializes the trie object.
- ```void insert(String word)``` Inserts the string ```word``` into the trie.
- ```boolean search(String word)``` Returns ```true``` if the string ```word``` is in the trie (i.e., was inserted before), and ```false``` otherwise.
- ```boolean startsWith(String prefix)``` Returns ```true``` if there is a previously inserted string ```word``` that has the prefix ```prefix```, and ```false``` otherwise.

![image](https://user-images.githubusercontent.com/35042430/225825552-09d22612-15cc-4aa3-be54-3c65b1ce3e66.png)

---

__Example 1:__
```
Input
["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
Output
[null, null, true, false, true, null, true]

Explanation
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // return True
trie.search("app");     // return False
trie.startsWith("app"); // return True
trie.insert("app");
trie.search("app");     // return True
```

__Constraints:__

- ```1 <= word.length, prefix.length <= 2000```
- ```word``` and ```prefix``` consist only of lowercase English letters.
- At most 3 * 10<sup>4</sup> calls in total will be made to ```insert```, ```search```, and ```startsWith```.

---

__Applications__

Trie (we pronounce "try") or prefix tree is a tree data structure, which is used for retrieval of a key in a dataset of strings. There are various applications of this very efficient data structure such as :

1. Autocomplete

![image](https://leetcode.com/media/original_images/208_GoogleSuggest.png)

Figure 1. Google Suggest in action.

2. Spell checker

![image](https://leetcode.com/media/original_images/208_SpellCheck.png)

Figure 2. A spell checker used in word processor.

3. IP routing (Longest prefix matching)

![image](https://leetcode.com/media/original_images/208_IPRouting.gif)

Figure 3. Longest prefix matching algorithm uses Tries in Internet Protocol (IP) routing to select an entry from a forwarding table.

4. T9 predictive text

![image](https://leetcode.com/media/original_images/208_T9.jpg)

Figure 4. T9 which stands for Text on 9 keys, was used on phones to input texts during the late 1990s.

5. Solving word games

![image](https://leetcode.com/media/original_images/208_Boggle.png)

Figure 5. Tries is used to solve Boggle efficiently by pruning the search space.

---

![image](https://leetcode.com/media/original_images/208_Node.png)

Figure 6. Representation of a key "leet" in trie.

![image](https://leetcode.com/media/original_images/208_TrieInsert.png)

```Python
class TrieNode():
    def __init__(self):
        self.children = dict()
        self.complete = False

class Trie:

    def __init__(self):
        self.root = TrieNode()


    def insert(self, word: str) -> None:
        node = self.root
        for char in word:
            if not char in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.complete = True


    def search(self, word: str) -> bool:
        node = self.root
        for char in word:
            if not char in node.children:
                return False
            node = node.children[char]
        return node.complete


    def startsWith(self, prefix: str) -> bool:
        node = self.root
        for char in prefix:
            if not char in node.children:
                return False
            node = node.children[char]
        return True


# Your Trie object will be instantiated and called as such:
# obj = Trie()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.startsWith(prefix)
```
