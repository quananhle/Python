## 9. Palindrome Number

```Tag```: ```Math```

#### Difficulty: Easy

Given an integer ```x```, return _```true``` if ```x``` is a __palindrome__, and ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/219294128-aadbbe8a-75e5-494c-b078-db15f80c7374.png)

---

__Example 1:__
```
Input: x = 121
Output: true
Explanation: 121 reads as 121 from left to right and from right to left.
```

__Example 2:__
```
Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
```

__Example 3:__
```
Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
```

__Constraints:__

- ```-2^31 <= x <= 2^(31 - 1)```

---

### One-Liner

```Python
class Solution:
    def isPalindrome(self, x: int) -> bool:
        return str(x) == str(x)[::-1]
```

__Follow up__: Could you solve it without converting the integer to a string?

### Math

#### Reverse Whole Number

```Python
class Solution:
    def isPalindrome(self, x: int) -> bool:
        # Reverse the whole number
        if x < 0 or (x % 10 == 0 and x != 0):
            return False
        
        palindrome = 0
        original = x

        # Reverse whole interger x
        while x > 0:
            palindrome = palindrome * 10 + x % 10
            x //= 10

        return palindrome == original
```

#### Reverse Half Number 

```Python
class Solution:
    def isPalindrome(self, x: int) -> bool:
        # Reverse half of the number
        if x < 0 or (x % 10 == 0 and x != 0):
            return False

        right_half = 0

        # Reverse half interger x
        while x > right_half:
            right_half = right_half * 10 + x % 10
            x //= 10

        # Check 2 scenarios:
        # - len(x) is even, check if left half of x == right half of x 
        # - len(x) is odd, get rid of the middle digit in right half
        return x == right_half or right_half // 10 == x
```

 
