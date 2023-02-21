## 540. Single Element in a Sorted Array

```Tag```: ```Binary Search``` ```Bitwise Manipulation```

#### Difficulty: Medium

You are given a sorted array consisting of only integers where every element appears exactly twice, except for one element which appears exactly once.

Return the single element that appears only once.

Your solution must run in ```O(log n)``` time and ```O(1)``` space.

![image](https://user-images.githubusercontent.com/35042430/220236243-b4283126-65fe-49db-ab08-668c2416a4fd.png)

---

__Example 1:__
```
Input: nums = [1,1,2,3,3,4,4,8,8]
Output: 2
```

__Example 2:__
```
Input: nums = [3,3,7,7,10,11,11]
Output: 10
```

__Constraints:__

- ```1 <= nums.length <= 10^5```
- ```0 <= nums[i] <= 10^5```

---

### Binary Search

In order to use binary search, we need to be able to look at the middle item and then determine whether the solution is the middle item, or to the left, or to the right. The key observation to make is that the starting array must always have an odd number of elements (be odd-lengthed), because it has one element appearing once, and all the other elements appearing twice.
 
![image](https://leetcode.com/problems/single-element-in-a-sorted-array/solutions/416649/Figures/540/example1.png)

Here is what happens when we remove a pair from the center. We are left with a left subarray and a right subarray.

![image](https://leetcode.com/problems/single-element-in-a-sorted-array/solutions/416649/Figures/540/example2.png)
An array with the elements 1, 1, 4, 4, 5, 5, 6, 6, 8, 9, 9. The 5's are crossed out.

Like the original array, the subarray containing the single element must be odd-lengthed. The subarray not containing it must be even-lengthed. So by taking a pair out of the middle and then calculating which side is now odd-lengthed, we have the information needed for binary search.

__Case 1__: _Mid’s partner is to the right, and the halves were originally even._

The right side becomes odd-lengthed because we removed ```mid```'s partner from it. We need to set ```lo``` to ```mid + 2``` so that the remaining array is the part above ```mid```'s partner.
![image](https://leetcode.com/problems/single-element-in-a-sorted-array/solutions/416649/Figures/540/case1.png)

__Case 2__: _Mid’s partner is to the right, and the halves were originally odd._

The left side remains odd-lengthed. We need to set ```hi``` to ```mid - 1``` so that the remaining array is the part below ```mid```.
![image](https://leetcode.com/problems/single-element-in-a-sorted-array/solutions/416649/Figures/540/case2.png)

__Case 3__: _Mid’s partner is to the left, and the halves were originally even._

The left side becomes odd-lengthed because we removed ```mid```'s partner from it. We need to set ```hi``` to ```mid - 2``` so that the remaining array is the part below ```mid```'s partner.
![image](https://leetcode.com/problems/single-element-in-a-sorted-array/solutions/416649/Figures/540/case3.png)

__Case 4__: _Mid’s partner is to the left, and the halves were originally odd._

The right side remains odd-lengthed. We need to set ```lo``` to ```mid + 1``` so that the remaining array is the part above ```mid```.
![image](https://leetcode.com/problems/single-element-in-a-sorted-array/solutions/416649/Figures/540/case4.png)

```Python
class Solution:
    def singleNonDuplicate(self, nums: List[int]) -> int:
        lo, hi = 0, len(nums) - 1
        while lo < hi:
            mi = lo + (hi - lo) // 2
            '''
            if (hi - mi) % 2 == 0:
                even_halves = True
            else:
                even_halves = False
            '''
            even_halves = (hi - mi) % 2 == 0
            if nums[mi + 1] == nums[mi]:
                if even_halves:
                    lo = mi + 2
                else:
                    hi = mi - 1
            elif nums[mi - 1] == nums[mi]:
                if even_halves:
                    hi = mi - 2
                else:
                    lo = mi + 1
            else:
                return nums[mi]
        return nums[lo]
```

#### Check on Index

```Python
class Solution:
    def singleNonDuplicate(self, nums: List[int]) -> int:
        lo, hi = 0, len(nums) - 1
        while lo < hi:
            mi = lo + (hi - lo) // 2
            # Check if mid index is an odd index, even length array
            if mi % 2 == 1:
                mi -= 1
            if nums[mi] == nums[mi + 1]:
                lo = mi + 2
            else:
                hi = mi
        return nums[lo]
```

---

### Linear Search

#### Search on Every Even Index

```Python
class Solution:
    def singleNonDuplicate(self, nums: List[int]) -> int:
        for i in range(0, len(nums) - 2, 2):
            if nums[i] != nums[i + 1]:
                return nums[i]
        return -1
```

### Bitwise Manipulation

```Python
class Solution:
    def singleNonDuplicate(self, nums: List[int]) -> int:
        ans = 0
        for num in nums:
            ans ^= num
        return ans
```


