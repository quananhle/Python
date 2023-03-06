## [1539. Kth Missing Positive Number](https://leetcode.com/problems/kth-missing-positive-number/)

```Tag```: Binary Search```

#### Difficulty: Easy

Given an array ```arr``` of positive integers sorted in a __strictly increasing order__, and an integer ```k```.

Return the k<sup>th</sup> positive integer that is __missing__ from this array.

![image](https://user-images.githubusercontent.com/35042430/223009361-f7a7017e-6a79-4a78-980d-bd61c83bdd23.png)

---

__Example 1:__
```
Input: arr = [2,3,4,7,11], k = 5
Output: 9
Explanation: The missing positive integers are [1,5,6,8,9,10,12,13,...]. The 5th missing positive integer is 9.
```

__Example 2:__
```
Input: arr = [1,2,3,4], k = 2
Output: 6
Explanation: The missing positive integers are [5,6,7,...]. The 2nd missing positive integer is 6.
```

__Constraints:__

- ```1 <= arr.length <= 1000```
- ```1 <= arr[i] <= 1000```
- ```1 <= k <= 1000```
- ```arr[i] < arr[j]``` for ```1 <= i < j <= arr.length```

---

### Brute Force

![image](https://leetcode.com/problems/kth-missing-positive-number/Figures/1539/missing.png)

```Python
class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:
        # Check if the kth missing is outside the lower boundary
        if k <= arr[0] - 1:
            return k

        # Decrease k by the number of positive integers which are missing before the array starts
        k -= arr[0] - 1
        for num in range(len(arr) - 1):
            curr_missing = arr[num + 1] - arr[num] - 1
            # Check if the kth missing is between arr[num] and arr[num + 1]
            if k <= curr_missing:
                return arr[num] + k
            # Otherwise, keep looking
            k -= curr_missing
        
        # Check if the missing number is outside the upper boundary
        return arr[-1] + k
```

### Hash Set

```Python
class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:
        nums = set(arr)
        n = len(arr)
        for num in range(n + k + 1):
            if not num in nums:
                k -= 1
            if k == -1:
                return num
```

### One Liner

```Python
class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:
        return [num for num in range(len(arr) + k + 1) if not num in set(arr)][k]
```

__Follow up__: Could you solve this problem in less than ```O(n)``` complexity?

### Binary Search

![image](https://leetcode.com/problems/kth-missing-positive-number/Figures/1539/binary.png)

Let's compare the input array ```[2, 3, 4, 7, 11]``` with an array with no missing integers: ```[1, 2, 3, 4, 5]```. The number of missing integers is a simple difference between the corresponding elements of these two arrays:

- Before ```2```, there is ```2 - 1 = 1``` missing integer.
- Before ```3```, there is ```3 - 2 = 1``` missing integer.
- Before ```4```, there is ```4 - 3 = 1``` missing integer.
- Before ```7```, there are ```7 - 4 = 3``` missing integers.
- Before ```11```, there are ```11 - 5 = 6``` missing integers.

The number of positive integers which are missing before the ```arr[idx]``` is equal to ```arr[idx] - idx - 1```.

```Python
class Solution:
    def findKthPositive(self, arr: List[int], k: int) -> int:
        n = len(arr)
        lo, hi = 0, n - 1
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            # If number of positive integers which are missing before arr[mi] is less than k       
            if arr[mi] - mi - 1 < k:
                # Continue to search on the right halves
                lo = mi + 1
            # Otherwise, search on the left halves
            else:
                hi = mi - 1
        # At the end of the loop, lo = hi + 1, and the kth missing is in-between arr[lo] and arr[hi]
        # The number of integers missing before arr[hi] is arr[hi] - lo - 1, the number to return is
        # arr[hi] + k - (arr[hi] - hi - 1) = k + lo
        return lo + k
```
