## [1804. Implement Trie II (Prefix Tree)](https://leetcode.com/problems/implement-trie-ii-prefix-tree)

```Tag```: ```Trie``` ```Hash Map```

#### Difficulty: Medium

A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

Implement the ```Trie``` class:

- ```Trie()``` Initializes the trie object.
- ```void insert(String word)``` Inserts the string ```word``` into the trie.
- ```int countWordsEqualTo(String word)``` Returns the number of instances of the string ```word``` in the trie.
- ```int countWordsStartingWith(String prefix)``` Returns the number of strings in the trie that have the string ```prefix``` as a prefix.
- ```void erase(String word)``` Erases the string ```word``` from the trie.

![image](https://github.com/quananhle/Python/assets/35042430/fdc53f85-b2f4-49fb-91a2-c88a5c1ac41b)

---

__Example 1:__
```
Input
["Trie", "insert", "insert", "countWordsEqualTo", "countWordsStartingWith", "erase", "countWordsEqualTo", "countWordsStartingWith", "erase", "countWordsStartingWith"]
[[], ["apple"], ["apple"], ["apple"], ["app"], ["apple"], ["apple"], ["app"], ["apple"], ["app"]]
Output
[null, null, null, 2, 2, null, 1, 1, null, 0]

Explanation
Trie trie = new Trie();
trie.insert("apple");               // Inserts "apple".
trie.insert("apple");               // Inserts another "apple".
trie.countWordsEqualTo("apple");    // There are two instances of "apple" so return 2.
trie.countWordsStartingWith("app"); // "app" is a prefix of "apple" so return 2.
trie.erase("apple");                // Erases one "apple".
trie.countWordsEqualTo("apple");    // Now there is only one instance of "apple" so return 1.
trie.countWordsStartingWith("app"); // return 1
trie.erase("apple");                // Erases "apple". Now the trie is empty.
trie.countWordsStartingWith("app"); // return 0
```

__Constraints:__

- $1 \le word.length, prefix.length \le 2000$
- ```word``` and ```prefix``` consist only of lowercase English letters.
- At most $3 * 10^4$ calls in total will be made to ```insert```, ```countWordsEqualTo```, ```countWordsStartingWith```, and ```erase```.
- It is guaranteed that for any function call to ```erase```, the string ```word``` will exist in the trie.

---

```Python
class TrieNode():

    def __init__(self):
        self.children = dict()
        self.complete = False
        self.ending = 0
        self.beginning = 0

class Trie:

    def __init__(self):
        self.root = TrieNode()

    def insert(self, word: str) -> None:
        node = self.root
        for char in word:
            index = ord(char) - ord('a')
            if not index in node.children:
                node.children[index] = TrieNode()
            node = node.children[index]
            node.beginning += 1
        node.complete = True
        node.ending += 1

    def countWordsEqualTo(self, word: str) -> int:
        node = self.root
        for char in word:
            index = ord(char) - ord('a')
            if not index in node.children:
                return 0
            node = node.children[index]
        return node.ending

    def countWordsStartingWith(self, prefix: str) -> int:
        node = self.root
        for char in prefix:
            index = ord(char) - ord('a')
            if not index in node.children:
                return 0
            node = node.children[index]
        return node.beginning 

    def erase(self, word: str) -> None:
        node = self.root
        for char in word:
            index = ord(char) - ord('a')
            node = node.children[index]
            node.beginning -= 1
        node.ending -= 1


# Your Trie object will be instantiated and called as such:
# obj = Trie()
# obj.insert(word)
# param_2 = obj.countWordsEqualTo(word)
# param_3 = obj.countWordsStartingWith(prefix)
# obj.erase(word)
```
