## 66. Plus One

#### Difficulty: Easy

You are given a __large integer__ represented as an integer array ```digits```, where each ```digits[i]``` is the i<sup>th</sup> digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading ```0```'s.

Increment the large integer by one and return _the resulting array of digits_.

![image](https://user-images.githubusercontent.com/35042430/206973579-81915b1f-14f0-4fda-81e0-c41205618fa1.png)

---

__Example 1:__
```
Input: digits = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Incrementing by one gives 123 + 1 = 124.
Thus, the result should be [1,2,4].
```

__Example 2:__
```
Input: digits = [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
Incrementing by one gives 4321 + 1 = 4322.
Thus, the result should be [4,3,2,2].
```

__Example 3:__
```
Input: digits = [9]
Output: [1,0]
Explanation: The array represents the integer 9.
Incrementing by one gives 9 + 1 = 10.
Thus, the result should be [1,0].
```

__Constraints:__
```
1 <= digits.length <= 100
0 <= digits[i] <= 9
digits does not contain any leading 0's.
```

---

```Python
class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        number = 0
        digits[-1] += 1
        for i in range(len(digits)):
            number +=  digits[i] * 10**(len(digits)-1-i)
        return [int(n) for n in str(number)]


```Python
class Solution(object):
    def plusOne(self, digits):
        """
        :type digits: List[int]
        :rtype: List[int]
        """
        for i in range(len(digits)):
            idx = len(digits) - i - 1
            if digits[idx] == 9:
                digits[idx] = 0
            else:
                digits[idx] += 1
                return digits
        return [1] + digits
```

        # Bottom-Up Dynamic Programming
        """
        res = list()
        def helper(num):
            if len(num) == 0:
                return [1]
            digit = num.pop() + 1
            if digit == 10:
                num = helper(num)
                digit = 0
            num.append(digit)
            return num
        return helper(digits)
        """
        


```
