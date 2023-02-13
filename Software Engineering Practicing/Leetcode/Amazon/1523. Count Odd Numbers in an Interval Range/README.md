## 1523. Count Odd Numbers in an Interval Range

```Tag```: ```Math```

#### Difficulty: Easy

Given two non-negative integers ```low``` and ```high```. Return _the count of odd numbers between ```low``` and ```high``` (inclusive)_.

![image](https://user-images.githubusercontent.com/35042430/218355600-323c5181-b800-449f-b470-b29dab548c6b.png)

---

__Example 1:__
```
Input: low = 3, high = 7
Output: 3
Explanation: The odd numbers between 3 and 7 are [3,5,7].
```

__Example 2:__
```
Input: low = 8, high = 10
Output: 1
Explanation: The odd numbers between 8 and 10 are [9].
```

__Constraints:__

- ```0 <= low <= high <= 10^9```

---

### List Comprehension

```Python
class Solution:
    def countOdds(self, low: int, high: int) -> int:
        # List Comprehension
        ### Time Limit Exceeded
        #### Time Complexity: O(N), iterate through the range
        #### Space Complexity: O(N), list comprehension
        return len([k for k in range(low, high + 1) if k % 2 != 0])
```

### Math

```Python
class Solution:
    def countOdds(self, low: int, high: int) -> int:
        return (high + 1) // 2 - (low // 2)  
```

```Python
class Solution:
    def countOdds(self, low: int, high: int) -> int:
        '''
        if low % 2 != 0:
            low -= 1
        complement = high + 1 - low
        return complement // 2
        '''
        return (high + 1 - low + 1) // 2 if low % 2 != 0 else (high + 1 - low) // 2
```
