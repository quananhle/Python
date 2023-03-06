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

```Python

```
