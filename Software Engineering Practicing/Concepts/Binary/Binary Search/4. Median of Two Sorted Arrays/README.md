## [4. Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)

```Tag```: ```Binary Search```

#### Difficulty: Hard

Given two sorted arrays ```nums1``` and ```nums2``` of size ```m``` and ```n``` respectively, return _the median of the two sorted arrays_.

The overall run time complexity should be ```O(log (m+n))```.

![image](https://user-images.githubusercontent.com/35042430/230543556-b8238323-a2cb-45ca-9d7f-6b3196c199bc.png)

---

__Example 1:__
```
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
```

__Example 2:__
```
Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
```

__Constraints:__

- ```nums1.length == m```
- ```nums2.length == n```
- ```0 <= m <= 1000```
- ```0 <= n <= 1000```
- ```1 <= m + n <= 2000```
- -10<sup>6</sup> <= ```nums1[i]```, ```nums2[i]``` <= 10<sup>6</sup>

---

### Brute Force

- __Time Complexity:__ ```O((N + M) * log(N + M))```
- __Space Complexity:__ ```O(N + M)```

```Python
class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        array = list()
        '''
        for num in nums1:
            array.append(num)
        for num in nums2:
            array.append(num)
        '''
        array.extend(nums1[:])
        array.extend(nums2[:])

        array = sorted(array)
        n = len(array)

        lo, hi = 0, n - 1
        mi = lo + (hi - lo) // 2

        if n % 2 != 0:
            return float(array[mi])
        return (array[mi] + array[mi + 1]) / 2
```
