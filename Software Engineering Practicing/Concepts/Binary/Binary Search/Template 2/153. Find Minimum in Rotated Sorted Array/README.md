## [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array)

```Tag```: ```Binary Search```

#### Difficulty: Medium

Suppose an array of length ```n``` sorted in ascending order is rotated between ```1``` and ```n``` times. For example, the array ```nums = [0,1,2,4,5,6,7]``` might become:

- ```[4,5,6,7,0,1,2]``` if it was rotated ```4``` times.
- ```[0,1,2,4,5,6,7]``` if it was rotated ```7``` times.

Notice that rotating an array ```[a[0], a[1], a[2], ..., a[n-1]]``` 1 time results in the array ```[a[n-1], a[0], a[1], a[2], ..., a[n-2]]```.

Given the sorted rotated array ```nums``` of unique elements, return _the minimum element of this array_.

You must write an algorithm that runs in ```O(log n)``` time.

![image](https://user-images.githubusercontent.com/35042430/229933500-2edb4528-f294-4600-b2f4-2f028a9ef271.png)

---

__Example 1:__
```
Input: nums = [3,4,5,1,2]
Output: 1
Explanation: The original array was [1,2,3,4,5] rotated 3 times.
```

__Example 2:__
```
Input: nums = [4,5,6,7,0,1,2]
Output: 0
Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
```

__Example 3:__
```
Input: nums = [11,13,15,17]
Output: 11
Explanation: The original array was [11,13,15,17] and it was rotated 4 times. 
```

__Constraints:__

- ```n == nums.length```
- ```1 <= n <= 5000```
- ```-5000 <= nums[i] <= 5000```
- All the integers of ```nums``` are unique.
- ```nums``` is sorted and rotated between ```1``` and ```n``` times.

---

### Binary Search

```Python
class Solution:
    def findMin(self, nums: List[int]) -> int:
        n = len(nums)

        lo, hi = 0, n - 1
        
        while lo < hi:
            mi = lo + (hi - lo) // 2

            if nums[mi] < nums[hi]:
                hi = mi
            else:
                lo = mi + 1
        
        return nums[lo]
```
