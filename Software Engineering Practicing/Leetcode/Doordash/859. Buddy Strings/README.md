## [859. Buddy Strings](https://leetcode.com/problems/buddy-strings/)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Easy

Given two strings ```s``` and ```goal```, return _```true``` if you can swap two letters in s so the result is equal to ```goal```_, otherwise, return ```false```.

Swapping letters is defined as taking two indices ```i``` and ```j``` (0-indexed) such that ```i != j``` and swapping the characters at ```s[i]``` and ```s[j]```.

For example, swapping at indices ```0``` and ```2``` in ```"abcd"``` results in ```"cbad"```.

![image](https://github.com/quananhle/Python/assets/35042430/0fc44eca-185a-4602-9a72-8db656d0e21a)

---

__Example 1:__
```
Input: s = "ab", goal = "ba"
Output: true
Explanation: You can swap s[0] = 'a' and s[1] = 'b' to get "ba", which is equal to goal.
```

__Example 2:__
```
Input: s = "ab", goal = "ab"
Output: false
Explanation: The only letters you can swap are s[0] = 'a' and s[1] = 'b', which results in "ba" != goal.
```

__Example 3:__
```
Input: s = "aa", goal = "aa"
Output: true
Explanation: You can swap s[0] = 'a' and s[1] = 'a' to get "aa", which is equal to goal.
```

__Constraints:__

- 1 <= ```s.length, goal.length``` <= $2 * 10^{4}$
- ```s``` and ```goal``` consist of lowercase letters.

---

### String & Array

```Python
class Solution:
    def buddyStrings(self, s: str, goal: str) -> bool:
        count = 0
        for i in range(len(s)):
            if s[i] != goal[i]:
                count += 1
            
        if count == 2:
            return Counter(goal) == Counter(s)
        elif count == 0:
            return len(set(s)) != len(s) and len(set(goal)) != len(goal)
        else:
            return False
```
