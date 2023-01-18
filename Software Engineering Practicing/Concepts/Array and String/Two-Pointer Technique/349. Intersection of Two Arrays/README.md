## 349. Intersection of Two Arrays

```Tag```: ```Hash Set``` ```Hash Table``` ```Two Pointers``` ```

#### Difficulty: Easy

Given two integer arrays ```nums1``` and ```nums2```, return _an array of their intersection_. Each element in the result must be __unique__ and you may return the result in __any order__.

![image](https://user-images.githubusercontent.com/35042430/213248426-2dce2be8-afc0-4e2a-bbdd-76229fa8fae3.png)

---

__Example 1:__
```
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2]
```

__Example 2:__
```
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [9,4]
Explanation: [4,9] is also accepted.
```

__Constraints:__
```
1 <= nums1.length, nums2.length <= 1000
0 <= nums1[i], nums2[i] <= 1000
```

---

### Hash Set

```Python
class Solution:
    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:
        #### Time Complexity : O(N + M)
        #### Space Complexity: O(N + M)
        res = list()
        lst = nums1 + nums2
        for num in set(lst):
            if num in nums1 and num in nums2:
                res.append(num)
        return res
```

```Python
class Solution:
    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:
        set_nums1 = set(nums1)
        set_nums2 = set(nums2)
        return list(set_nums1 & set_nums2)
```

### One-Liner

```Python
class Solution:
    def intersection(self, nums1: List[int], nums2: List[int]) -> List[int]:
        #### Time Complexity : O(N + M)
        #### Space Complexity: O(N + M)
        return [num for num in set(nums1 + nums2) if num in nums1 and num in nums2]
```

__Follow up__: On-site Facebook interview question: solve the question O(N) time complexity and O(1) space complexity

### Two Pointers

```Python

```
