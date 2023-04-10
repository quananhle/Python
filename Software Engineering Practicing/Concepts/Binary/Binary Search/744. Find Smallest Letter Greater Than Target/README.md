## 744. Find Smallest Letter Greater Than Target

```Tag```: ```Binary Search```

#### Difficulty: Easy

You are given an array of characters ```letters``` that is sorted in __non-decreasing__ order, and a character ```target```. There are at least two different characters in ```letters```.

Return _the smallest character in ```letters``` that is lexicographically greater than ```target```_. If such a character does not exist, return _the first character in ```letters```_.

![image](https://user-images.githubusercontent.com/35042430/230963327-f924e437-4f02-4a57-8370-ab8d0eaab39e.png)

---

__Example 1:__
```
Input: letters = ["c","f","j"], target = "a"
Output: "c"
Explanation: The smallest character that is lexicographically greater than 'a' in letters is 'c'.
```

__Example 2:__
```
Input: letters = ["c","f","j"], target = "c"
Output: "f"
Explanation: The smallest character that is lexicographically greater than 'c' in letters is 'f'.
```

__Example 3:__
```
Input: letters = ["x","x","y","y"], target = "z"
Output: "x"
Explanation: There are no characters in letters that is lexicographically greater than 'z' so we return letters[0].
```

__Constraints:__

- ```2 <= letters.length <= 10```<sup>```4```</sup>
- ```letters[i]``` is a lowercase English letter.
- ```letters``` is sorted in non-decreasing order.
- ```letters``` contains at least two different characters.
- ```target``` is a lowercase English letter.

---

### Linear Scan

```Python
class Solution:
    def nextGreatestLetter(self, letters: List[str], target: str) -> str:
        for letter in letters:
            if letter > target:
                return letter
        return letters[0]
```

### Binary Search

```Python
class Solution:
    def nextGreatestLetter(self, letters: List[str], target: str) -> str:
        if not (letters[0] <= target <= letters[-1]):
            return letters[0]

        lo, hi = 0, len(letters)

        while lo < hi:
            mi = lo + (hi - lo) // 2
            letter = letters[mi]

            if letter <= target:
                lo = mi + 1
            else:
                hi = mi

        '''
        return letters[lo] if lo < len(letters) else letters[0]
        '''
        return letters[lo % len(letters)]
```

```Python
class Solution:
    def nextGreatestLetter(self, letters: List[str], target: str) -> str:
        index = bisect.bisect(letters, target)
        '''
        return letters[index % len(letters)]
        '''
        return letters[index] if index < len(letters) else letters[0]
```
