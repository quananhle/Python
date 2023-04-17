## [344. Reverse String](https://leetcode.com/problems/reverse-string)

```Tag```: ```Two Pointer``` ```String```

#### Difficulty: Easy

Write a function that reverses a string. The input string is given as an array of characters ```s```.

You must do this by modifying the input array __in-place__ with ```O(1)``` extra memory.

 ![image](https://user-images.githubusercontent.com/35042430/209779030-0147985a-73b5-42ea-8b44-3cf9e99fb472.png)

---

__Example 1:__
```
Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]
```

__Example 2:__
```
Input: s = ["H","a","n","n","a","h"]
Output: ["h","a","n","n","a","H"]
```

__Constraints:__
```
1 <= s.length <= 105
s[i] is a printable ascii character.
```

---

### Two Pointers

```Python
class Solution:
    def reverseString(self, s: List[str]) -> None:
        """
        Do not return anything, modify s in-place instead.
        """
        #### Time Complexity: O(N/2) = O(N), traverse through the entire input
        #### Space Complexity: O(1), contant memory space for pointers
        left, right = 0, len(s)-1
        while left < right:
            s[left], s[right] = s[right], s[left]
            left += 1
            right -= 1
```
