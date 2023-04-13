## [154. Find Minimum in Rotated Sorted Array II](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii)

```Tag```: ```Binary Search```

#### Difficulty: Hard

Suppose an array of length ```n``` sorted in ascending order is rotated between ```1``` and ```n``` times. For example, the array ```nums = [0,1,4,4,5,6,7]``` might become:

- ```[4,5,6,7,0,1,4]``` if it was rotated ```4``` times.
- ```[0,1,4,4,5,6,7]``` if it was rotated ```7``` times.

Notice that __rotating__ an array ```[a[0], a[1], a[2], ..., a[n-1]]``` ```1``` time results in the array ```[a[n-1], a[0], a[1], a[2], ..., a[n-2]]```.

Given the sorted rotated array ```nums``` that may contain duplicates, return _the minimum element of this array_.

You must decrease the overall operation steps as much as possible.

![image](https://user-images.githubusercontent.com/35042430/231350141-6af5dee4-0525-42a7-80c9-e1b62953eb0e.png)

---

__Example 1:__
```
Input: nums = [1,3,5]
Output: 1
```

__Example 2:__
```
Input: nums = [2,2,2,0,1]
Output: 0
```

__Constraints:__

- ```n == nums.length```
- ```1 <= n <= 5000```
- ```-5000 <= nums[i] <= 5000```
- ```nums``` is sorted and rotated between ```1``` and ```n``` times.
 

__Follow up__: This problem is similar to Find Minimum in Rotated Sorted Array, but ```nums``` may contain duplicates. Would this affect the runtime complexity? How and why?

---
 
![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/Figures/154/154_axis.png)
 
1. We keep two pointers, i.e. ```lo```, ```hi``` which point to the lowest and highest boundary of our search scope.
2. We then reduce the search scope by moving either of pointers, according to various situations. Usually we shift one of pointers to the mid point between ```lo``` and ```hi```, (i.e. ```pivot = lo + (hi - lo) // 2)```, which reduces the search scope down to half. This is also where the name of the algorithm comes from.
3. The reduction of the search scope would stop, either we find the desired element or the two pointers converge (i.e. ```lo == hi```).

__Algorithm__

In the classical binary search algorithm, we would compare the pivot element (i.e. ```nums[pivot]```) with the value that we would like to locate. In our case, however, we would compare the pivot element to the element pointed by the upper bound pointer (i.e. ```nums[hi]```).

```
Case 1). nums[mi] < nums[hi]
```

![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/Figures/154/154_case_1.png)

- The pivot element resides in the same half as the upper bound element.
- Therefore, the desired minimum element should reside to the left-hand side of pivot element. As a result, we then move the upper bound down to the pivot index, i.e. ```hi = mi```.

```
Case 2). nums[mi] > nums[high]
```

![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/Figures/154/154_case_2.png)

- The pivot element resides in the different half of array as the upper bound element.
- Therefore, the desired minimum element should reside to the right-hand side of the pivot element. As a result, we then move the lower bound up next to the pivot index, i.e. ```lo = mi + 1```.

```
Case 3). nums[mi] == nums[high]
```

![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/Figures/154/154_case_3_ii.png)

- In this case, we are not sure which side of the pivot that the desired minimum element would reside.
- To further reduce the search scope, a safe measure would be to reduce the upper bound by one (i.e. ```hi = hi - 1```), rather than moving aggressively to the pivot point.
- The above strategy would prevent the algorithm from stagnating (i.e. endless loop). More importantly, it maintains the correctness of the procedure, i.e. we would not end up with skipping the desired element.

To summarize, this algorithm differs to the classical binary search algorithm in two parts:

- We use the upper bound of search scope as the reference for the comparison with the pivot element, while in the classical binary search the reference would be the desired value.
- When the result of comparison is equal (i.e. Case #3), we further move the upper bound, while in the classical binary search normally we would return the value immediately.

- __Time Complexity__: O(N), when all elements in the array are identical
- __Space Complexity__: O(1)

### Template 1

```Python
class Solution:
    def findMin(self, nums: List[int]) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        while lo <= hi:
            # To prevent the numeric overflow issue, since the sum of two integers could exceed the limit of the integer number
            mi = lo + (hi - lo) // 2
            num = nums[mi]

            if num < nums[hi]:
                hi = mi
            elif num > nums[hi]:
                lo = mi + 1
            else:
                hi -= 1

        return nums[mi]
```

### Template 2

```Python
class Solution:
    def findMin(self, nums: List[int]) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        while lo < hi:
            # To prevent the numeric overflow issue, since the sum of two integers could exceed the limit of the integer number
            mi = lo + (hi - lo) // 2
            num = nums[mi]

            if num < nums[hi]:
                hi = mi
            elif num > nums[hi]:
                lo = mi + 1
            else:
                hi -= 1
            
        return nums[lo]
```

```Python
class Solution:
    def findMin(self, nums: List[int]) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        while lo < hi:
            mi = lo + (hi - lo) // 2
            num = nums[mi]

            if nums[lo] == num == nums[hi]:
                lo += 1
                hi -= 1
            elif num <= nums[hi]:
                hi = mi
            else:
                lo = mi + 1

        return nums[lo]
```







