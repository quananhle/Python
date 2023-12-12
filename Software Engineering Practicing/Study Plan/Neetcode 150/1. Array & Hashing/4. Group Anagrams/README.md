## [Group Anagrams](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Hash%20Table/Hash%20Map/49.%20Group%20Anagrams)

```Python
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        alphabet = collections.defaultdict(list)

        for string in strs:
            anagram = [0] * 26
            for c in string:
                anagram[ord(c) - ord('a')] += 1
            alphabet[tuple(anagram)].append(string)
        
        return alphabet.values()
```
