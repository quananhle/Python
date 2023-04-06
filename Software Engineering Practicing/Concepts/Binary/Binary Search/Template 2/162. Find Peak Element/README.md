## [162. Find Peak Element](https://leetcode.com/problems/find-peak-element/)

```Tag```: ```Binary Search```

#### Difficulty: Medium

A peak element is an element that is strictly greater than its neighbors.

Given a __0-indexed__ integer array ```nums```, find a peak element, and return _its index_. If the array contains multiple peaks, return the index to __any of the peaks__.

You may imagine that ```nums[-1] = nums[n] = -∞```. In other words, an element is always considered to be strictly greater than a neighbor that is outside the array.

You must write an algorithm that runs in ```O(log n)``` time.

![image](https://user-images.githubusercontent.com/35042430/229907589-405a072e-b0b6-4aa4-88ca-901ee5efc596.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.
```

__Example 2:__
```
Input: nums = [1,2,1,3,5,6,4]
Output: 5
Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
```

__Constraints:__

- ```1 <= nums.length <= 1000```
- -2<sup>31</sup> <= ```nums[i]``` <= 2<sup>31</sup> - 1
- ```nums[i] != nums[i + 1]``` for all valid ```i```.

---

### Greedy

```Python
class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        peak = ans = -math.inf
        for idx, num in enumerate(nums):
            if peak < num:
                peak = num
                ans = idx
        return ans
```

### Index()

```Python
class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        return nums.index(max(nums))
```

### Binary Search (Template II)

![image](https://user-images.githubusercontent.com/35042430/229924268-d0b37be2-4279-4590-9db2-205d3daf6525.png)

![image](https://user-images.githubusercontent.com/35042430/229924323-100f1c2b-f23f-4068-8710-1fd221c8b861.png)

![image](https://user-images.githubusercontent.com/35042430/229924363-bf53f301-ce10-4db0-9032-6cc2513beb2a.png)

![image](https://user-images.githubusercontent.com/35042430/229924391-95c80344-6935-411f-8b08-4b58d0980fce.png)

![image](https://user-images.githubusercontent.com/35042430/229924457-ea06db69-4857-4114-8b87-62a18d397ee4.png)

![image](https://user-images.githubusercontent.com/35042430/229924520-577ee98d-5d66-46fe-96fc-6325b82fd8b0.png)

#### Iterative Binary Search

- __Time complexity__: O(log(n))
- __Space complexity__: O(1)

```Python
class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        lo, hi = 0, len(nums) - 1

        while lo < hi:
            mi = lo + (hi - lo) // 2

            if nums[mi] > nums[mi + 1]:
                hi = mi
            else:
                lo = mi + 1

        return lo 
```

#### Recursive Binary Search

- __Time complexity__: O(log(n))
- __Space complexity__: O(log(n))

```Python
class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        def binary_search(lo, hi):
            # Base case
            if lo == hi:
                return lo

            mi = lo + (hi - lo) // 2

            if nums[mi] < nums[mi + 1]:
                return binary_search(mi + 1, hi)
            else:
                return binary_search(lo, mi)

        return binary_search(0, len(nums) - 1)
```

### Binary Search (Template III)

```Python
class Solution:
    def findPeakElement(self, nums: List[int]) -> int:
        n = len(nums)

        lo, hi = 0, n - 1
        while lo + 1 < hi:
            mi = lo + (hi - lo) // 2

            # Found a peak
            if nums[mi] > nums[mi + 1] and nums[mi] > nums[mi - 1]:
                return mi
            # Otherwise, if not a peak, climb up to the higher side
            elif nums[mi] < nums[mi + 1]:
                lo = mi
            else:
                hi = mi
        
        return hi if nums[hi] > nums[lo] else lo
```
