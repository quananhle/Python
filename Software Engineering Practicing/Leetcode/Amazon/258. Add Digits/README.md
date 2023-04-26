## [258. Add Digits](https://leetcode.com/problems/add-digits/)

```Tag```: ```Math```

#### Difficulty: Easy

Given an integer ```num```, repeatedly add all its digits until the result has only one digit, and return it.

![image](https://user-images.githubusercontent.com/35042430/234463377-1e734582-e816-48fa-861a-e1ec9a02d727.png)

---

__Example 1:__
```
Input: num = 38
Output: 2
Explanation: The process is
38 --> 3 + 8 --> 11
11 --> 1 + 1 --> 2 
Since 2 has only one digit, return it.
```

__Example 2:__
```
Input: num = 0
Output: 0
```

__Constraints:__

- 0 <= ```num``` <= 2<sup>31</sup> - 1

---

### Brute Force

```Python
class Solution:
    def addDigits(self, num: int) -> int:
        nums = str(num)

        while len(nums) > 1:
            nums = str(sum([int(c) for c in nums]))

        return int(nums)
```

```Python
class Solution:
    def addDigits(self, num: int) -> int:
        digital_root = 0

        while num > 0:
            digital_root += num % 10
            num //= 10

            if num == 0 and digital_root > 9:
                num = digital_root
                digital_root = 0
        
        return digital_root
```

__Follow up__: Could you do it without any loop/recursion in ```O(1)``` runtime?
