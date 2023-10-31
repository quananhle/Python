## [217. Contains Duplicate](https://leetcode.com/problems/contains-duplicate/)

```Tag```: ```Hash Table``` ```Sort``` ```Brute Force``` ```Hash Set```

#### Difficulty: Easy

Given an integer array ```nums```, return _```true``` if any value appears at least twice in the array, and return ```false``` if every element is distinct_.

![image](https://user-images.githubusercontent.com/35042430/211179824-b51e904d-6e99-445b-b4d2-2323fc9be6d9.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1]
Output: true
```

__Example 2:__
```
Input: nums = [1,2,3,4]
Output: false
```

__Example 3:__
```
Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
```

__Constraints:__
```
1 <= nums.length <= 105
-109 <= nums[i] <= 109
```

---

### Brute Force

```Python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        # Brute Force
        #### Time Complexity: O(N^2)
        #### Space Complexity: O(1)
        for i in range(len(nums)-1):
            for j in range(i+1, len(nums)):
                if nums[i] == nums[j]:
                    return True
        return False    
```

### Hash Set

```Python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        # Hash Set
        #### Time Complexity: O(N)
        #### Space Complexity: O(N)
        return len(set(nums)) != len(nums)
```

### Hash Table
        
```Python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        # Hash Table
        #### Time Complexity: O(N)
        #### Space Complexity: O(N)
        freq = dict()
        for num in nums:
            freq[num] = 1 + freq.get(num, 0)
        for val in freq.values():
            if val > 1:
                return True
        return False
```

### Sort

```Python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        # Sort
        #### Time Complexity: O(NlogN)
        #### Space Complexity: O(N)
        nums = sorted(nums)
        for i in range(1, len(nums)):
            if nums[i-1] == nums[i]:
                return True
        return False
```
