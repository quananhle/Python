## 402. Remove K Digits

```Tag```: ```Monotonic Stack```

#### Difficulty: Medium

Given string ```num``` representing a non-negative integer ```num```, and an integer ```k```, return _the smallest possible integer after removing ```k``` digits from ```num```_.

![image](https://user-images.githubusercontent.com/35042430/220970016-b60d67ec-776f-461c-b648-ec52ccc4ee34.png)

---

__Example 1:__
```
Input: num = "1432219", k = 3
Output: "1219"
Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
```

__Example 2:__
```
Input: num = "10200", k = 1
Output: "200"
Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
```

__Example 3:__
```
Input: num = "10", k = 2
Output: "0"
Explanation: Remove all the digits from the number and it is left with nothing which is 0.
```

__Constraints:__

- ```1 <= k <= num.length <= 10^5```
- ```num``` consists of only digits.
- ```num``` does not have any leading zeros except for the zero itself.

---

We've got a hint while entertaining the idea of brute-force, that given two sequences of digit of the same length, it is the __leftmost distinct digits__ that determine the superior of the two numbers, e.g. for ```A = 1axxx```, ```B = 1bxxx```, if the digits ```a > b```, then ```A > B```.

With this insight, the first intuition we got for our problem is that we should iterate from the left to right, when removing the digits. The more a digit to the left-hand side, the more weight it carries.

Now that we fix on the order of the iteration, it is critical to come up some criteria on how we eliminate digits, in order to obtain the minimum value.

![image](https://leetcode.com/problems/remove-k-digits/solutions/377716/Figures/402/402_example.png)

### Monotonic Stack

![image](https://leetcode.com/problems/remove-k-digits/solutions/377716/Figures/402/402_algorithm.png)

```Python
class Solution:
    def removeKdigits(self, num: str, k: int) -> str:
        # Monotonic Stack
        if len(num) == k:
            return '0'

        res = list()
        for n in num:
            while res and k and res[-1] > n:
                res.pop()
                k -= 1
            # To avoid leading zero when monotonic is empty
            if res or n != '0':
                res.append(n)
        # Edge case: if k is not yet 0, num contains all ascending digits, remove k digits from right to left
        if k:
            res = res[0:-k]
        return ''.join(res) if res else '0'

"""
Case 1: Remove biggest digit from left to right until k = 0
num = "1432219", k = 3 -> remove from left to right 4, 3, 2 => "1219"

Case 2: Avoid leading zero
num = "10200", k = 1 -> remove from left to right 1 => "0200" = "200"

Case 3: Remove all digits
num = "10", k = 2 => "0" -> len(num) == k => "0"
num = "9", k = 1 => "0" -> len(num) == k => "0"
num = "1432219", k = 7 => "0" -> len(num) == k => "0"

Case 4: Emtpy output
num = "10", k = 1 => "0" -> monotonic stack = [] => "0"

Case 5: Monotonic stack is formed and k != 0
num = "112", k = 1 => "11" -> monotonic stack = [1,1,2], k = 1 -> edge case: remove from right to left 2 => "11"
num = "1432345", k = 3 => "1234" -> remove from left to right 4, 3 -> monotonic stack = [1,2,3,4,5], k = 1
                                 -> edge case: remove from right to left 5 => "1234"
"""
```
