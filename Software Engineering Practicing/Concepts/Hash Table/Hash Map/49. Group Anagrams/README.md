## [49. Group Anagrams](https://leetcode.com/problems/group-anagrams)

```Tag```: ```Hash Table``` ```Sorting``` ```Tuple```

#### Difficulty: Medium

Given an array of strings ```strs```, group the __anagrams__ together. You can return the answer in __any order__.

An __Anagram__ is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

![image](https://github.com/quananhle/Python/assets/35042430/93a0ff69-25f3-418a-918e-7bdc0b924ea2)

---

__Example 1:__
```
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
```

__Example 2:__
```
Input: strs = [""]
Output: [[""]]
```

__Example 3:__
```
Input: strs = ["a"]
Output: [["a"]]
```

__Constraints:__

- $1 \le strs.length \le 10^4$
- $0 \le strs[i].length \le 100$
- ```strs[i]``` consists of lowercase English letters.

---

### Hash Table

```Python
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        memo = collections.defaultdict(list)

        for string in strs:
            alphabet_order = [0] * 26
            for c in string:
                alphabet_order[ord(c) - ord('a')] += 1
            memo[tuple(alphabet_order)].append(string)
        
        return memo.values()
```

```Python
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        #### Time Complexity: O(100 * N), based on constrains, length of the longest single anagram is 100, traverse through every string of the input
        #### Time Complexity: O(26 * N), extra memory space for a list to hold index of 26 characters, and a hash table
        '''
        dictionary = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
        upper_dict = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']
        '''
        alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
        memo = collections.defaultdict(list)
        for string in strs:
            # Initialize a list with index representing the 26 character of alphabet 
            order = [0] * 26
            for s in string:
                # Anagrams have the same order of index count
                order[alphabet.index(s)] += 1
            # Group anagrams by order of index count
            memo[tuple(order)].append(string)
        return memo.values()
```

```Python
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        #### Time Complexity: O(100 * N), based on constrains, length of the longest single anagram is 100, traverse through every string of the input
        #### Time Complexity: O(26 * N), extra memory space for a list to hold index of 26 characters, and a hash table
        res = list()
        memo = collections.defaultdict(list)
        for string in strs:
            res = [0] * 26
            for s in string:
                res[ord(s) - ord('a')] += 1
            memo[tuple(res)].append(string)
        return memo.values()
```

### Sorting

```Python
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        #### Time Complexity: O(N * 100 log 100), traverse through every string of the input size N, and sort operations take NlogN time, based on constrains, length of the longest single anagram is 100, 
        #### Time Complexity: O(26 * N), extra memory space for a list to hold index of 26 characters, and a hash table
        res = list()
        memo = collections.defaultdict(list)
        for index, string in enumerate(strs):
            memo[tuple(sorted(string))].append(string)
        return memo.values()
```
