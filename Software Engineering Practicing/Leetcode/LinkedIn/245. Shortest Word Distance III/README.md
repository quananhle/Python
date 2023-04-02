## [245. Shortest Word Distance III](https://leetcode.com/problems/shortest-word-distance-iii/)

```Tag```: ```Two Pointers```

#### Difficulty: Medium

Given an array of strings ```wordsDict``` and two strings that already exist in the array ```word1``` and ```word2```, return _the shortest distance between the occurrence of these two words in the list_.

Note that ```word1``` and ```word2``` may be the same. It is guaranteed that they represent two individual words in the list.

![image](https://user-images.githubusercontent.com/35042430/229265737-b0aec0f3-2b4c-45e8-a545-79b6c1ee43bc.png)

---
 
__Example 1:__

```
Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "coding"
Output: 1
```

__Example 2:__
```
Input: wordsDict = ["practice", "makes", "perfect", "coding", "makes"], word1 = "makes", word2 = "makes"
Output: 3
```

__Constraints:__

- ```1 <= wordsDict.length <= 10^5```
- ```1 <= wordsDict[i].length <= 10```
- ```wordsDict[i]``` consists of lowercase English letters.
- ```word1``` and ```word2``` are in wordsDict.

---

### Two Pointers

__Algorithm__

1. Initialize the answer variable ```ans = wordsDict.length``` as the distance cannot exceed the length of the input array, so this will store the minimum distance possible.

2. Initialize ```prev``` to ```-1```; this variable will be pointing to the previous index where we have an interesting string.

3. Iterate over the list ```wordsDict``` from ```0``` to the last index, and for each index ```i```, if the string at this index is interesting:

    - a. First, check if ```prev != -1```. Then, check if either ```word1``` and ```word2``` are equal, or the index ```prev``` and ```i``` are pointing to different strings in the list. If yes, find the difference between ```prev``` and ```i``` and ```ans``` accordingly.
    - b. Set ```prev = i```.

4. Return ```ans```.

```Python
class Solution:
    def shortestWordDistance(self, wordsDict: List[str], word1: str, word2: str) -> int:
        # Two Pointer
        n = len(wordsDict)
        ans = n
        prev = -1

        for i in range(n):

            if wordsDict[i] == word1 or wordsDict[i] == word2:
                # Check if word1 or word2 is found before
                if prev != -1 and (wordsDict[prev] != wordsDict[i] or word1 == word2):
                    ans = min(ans, i - prev)
                # Otherwise, update the current index to prev
                prev = i

        return ans
```

```Python
class Solution:
    def shortestWordDistance(self, wordsDict: List[str], word1: str, word2: str) -> int:
        # Two Pointer
        n = len(wordsDict)
        ans = n
        w1 = w2 = -1

        for i in range(n):
            # Check if word1 is found
            if wordsDict[i] == word1:
                # Get the index position of word1 in wordsDict
                w1 = i
                # Check if index position of word2 is already found before
                if w2 != -1:
                    ans = min(ans, w1 - w2)
            # Check if word2 is found
            if wordsDict[i] == word2:
                # Get the index position of word2 in wordsDict
                w2 = i
                # Check if index position of word1 is already found before and w1 and w2 are not the same element in wordsDict
                if w1 != -1 and w1 != w2:
                    ans = min(ans, w2 - w1)
        return ans
```

### Merging Lists

__Algorithm__

1. Iterate over the strings in the list __wordsDict__, and for each string in the list which is either ```word1``` or ```word2```, insert an entry as ```{i, 1}``` or ```{i, 2}``` into the list ```memo```, where ```i``` is the index of string and the second integer represents whether the string corresponds to ```word1``` or ```word2```.
2. Initialize the answer variable ```ans = wordsDict.length```. This will store the minimum distance possible.
3. Iterate over the list ```memo``` from the position ```0``` to the second last index, compare every pair with the next pair in the list, and if both values in the pair are different, then find the difference between the indices in these two pairs and update ```ans``` accordingly.
4. Return ```ans```.

```Python
class Solution:
    def shortestWordDistance(self, wordsDict: List[str], word1: str, word2: str) -> int:
        memo = list()
        n = len(wordsDict)
        ans = n

        for index, word in enumerate(wordsDict):
            if word == word1:
                memo.append((index, 1))
            if word == word2:
                memo.append((index, 2))

        for i in range(len(memo) - 1):
            if (memo[i][0] != memo[i + 1][0]) and (memo[i][1] != memo[i + 1][1]):
                ans = min(ans, memo[i + 1][0] - memo[i][0])

        return ans
```
