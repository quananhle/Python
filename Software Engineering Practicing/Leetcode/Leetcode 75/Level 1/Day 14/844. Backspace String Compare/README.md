## 844. Backspace String Compare

#### Difficulty: Easy

Given two strings ```s``` and ```t```, return ```true``` _if they are equal when both are typed into empty text editors_. ```'#'``` means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

![image](https://user-images.githubusercontent.com/35042430/207222201-b28bbf3a-b2dd-45c7-b253-df56b7cab97f.png)

---

__Example 1:__
```
Input: s = "ab#c", t = "ad#c"
Output: true
Explanation: Both s and t become "ac".
```
__Example 2:__
```
Input: s = "ab##", t = "c#d#"
Output: true
Explanation: Both s and t become "".
```
__Example 3:__
```
Input: s = "a#c", t = "b"
Output: false
Explanation: s becomes "c" while t becomes "b".
```
__Constraints:__
```
1 <= s.length, t.length <= 200
s and t only contain lowercase letters and '#' characters.
```
---

__Follow up:__ Can you solve it in ```O(n)``` time and ```O(1)``` space?
