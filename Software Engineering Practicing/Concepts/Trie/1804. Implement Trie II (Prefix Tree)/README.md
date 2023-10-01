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
