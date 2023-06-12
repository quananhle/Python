## [228. Summary Ranges](https://leetcode.com/problems/summary-ranges/)

```Tag```: ```Array & String```

#### Difficulty: Easy

You are given a sorted unique integer array ```nums```.

A range ```[a,b]``` is the set of all integers from ```a``` to ```b``` (inclusive).

Return _the smallest sorted list of ranges that cover all the numbers in the array exactly_. That is, each element of ```nums``` is covered by exactly one of the ranges, and there is no integer ```x``` such that ```x``` is in one of the ranges but not in ```nums```.

Each range ```[a,b]``` in the list should be output as:

- ```"a->b"``` if ```a != b```
- ```"a"``` if ```a == b```

![image](https://github.com/quananhle/Python/assets/35042430/991244ce-498d-457e-a915-fa0da288dd59)

---

__Example 1:__
```
Input: nums = [0,1,2,4,5,7]
Output: ["0->2","4->5","7"]
Explanation: The ranges are:
[0,2] --> "0->2"
[4,5] --> "4->5"
[7,7] --> "7"
```

__Example 2:__
```
Input: nums = [0,2,3,4,6,8,9]
Output: ["0","2->4","6","8->9"]
Explanation: The ranges are:
[0,0] --> "0"
[2,4] --> "2->4"
[6,6] --> "6"
[8,9] --> "8->9"
```

__Constraints:__

- ```0 <= nums.length <= 20```
- ```-2^31 <= nums[i] <= 2^31 - 1```
- All the values of ```nums``` are unique.
- ```nums``` is sorted in ascending order.

---

```Python
class Solution:
    def summaryRanges(self, nums: List[int]) -> List[str]:
        res = list()
        i = 0
        n = len(nums)

        while i < n:
            start = nums[i]
            while i + 1 < n and nums[i] + 1 == nums[i + 1]:
                i += 1
            if start != nums[i]:
                res.append(str(start) + "->" + str(nums[i]))
            else:
                res.append(str(nums[i]))
            
            i += 1
        
        return res
```
