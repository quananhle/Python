## [1822. Sign of the Product of an Array](https://leetcode.com/problems/sign-of-the-product-of-an-array)

```Tag```: ```Array & String```

#### Difficulty: Easy

There is a function ```signFunc(x)``` that returns:

- ```1``` if ```x``` is positive.
- ```-1``` if ```x``` is negative.
- ```0``` if ```x``` is equal to ```0```.

You are given an integer array ```nums```. Let ```product``` be the product of all values in the array ```nums```.

Return ```signFunc(product)```.

![image](https://user-images.githubusercontent.com/35042430/235568267-c78973e2-b168-435e-b71b-5754effcda45.png)

---

__Example 1:__
```
Input: nums = [-1,-2,-3,-4,3,2,1]
Output: 1
Explanation: The product of all values in the array is 144, and signFunc(144) = 1
```

__Example 2:__
```
Input: nums = [1,5,0,2,-3]
Output: 0
Explanation: The product of all values in the array is 0, and signFunc(0) = 0
```

__Example 3:__
```
Input: nums = [-1,1,-1,1,-1]
Output: -1
Explanation: The product of all values in the array is -1, and signFunc(-1) = -1
```

__Constraints:__

- ```1 <= nums.length <= 1000```
- ```-100 <= nums[i] <= 100```

---

### One Pass

```Python
class Solution:
    def arraySign(self, nums: List[int]) -> int:
        prod = 1
        for num in nums:
            prod = prod * num
        
        return 1 if prod > 0 else -1 if prod < 0 else 0 
```

### Counting

```Python
class Solution:
    def arraySign(self, nums: List[int]) -> int:
        count = 0
        for num in nums:
            if num == 0:
                return 0
            elif num < 0:
                count += 1
        
        return 1 if count % 2 == 0 else -1
```

### Flag

```Python
class Solution:
    def arraySign(self, nums: List[int]) -> int:
        positive = True
        for num in nums:
            if num == 0:
                return 0
            elif num < 0:
                positive = not positive
        
        return 1 if positive else -1
```

### One Liner

```Python
class Solution:
    def arraySign(self, nums: List[int]) -> int:
        return 1 if math.prod(nums) > 0 else -1 if math.prod(nums) < 0 else 0 
```

