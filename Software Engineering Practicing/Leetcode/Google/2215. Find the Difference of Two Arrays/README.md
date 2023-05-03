## [2215. Find the Difference of Two Arrays](https://leetcode.com/problems/find-the-difference-of-two-arrays)

```Tag```: ```String & Array``` ```Hash Set``` ```Hash Table```

#### Difficulty: Easy

Given two __0-indexed__ integer arrays ```nums1``` and ```nums2```, return _a list ```answer``` of size ```2``` where_:

  - ```answer[0]``` is a list of all distinct integers in ```nums1``` which are not present in ```nums2```.
  - ```answer[1]``` is a list of all distinct integers in ```nums2``` which are not present in ```nums1```.

__Note__ that the integers in the lists may be returned in __any__ order.

![image](https://user-images.githubusercontent.com/35042430/235832849-3163803f-ffeb-4589-83c2-c655b3dd1d1b.png)

---

__Example 1:__
```
Input: nums1 = [1,2,3], nums2 = [2,4,6]
Output: [[1,3],[4,6]]
Explanation:
For nums1, nums1[1] = 2 is present at index 0 of nums2, whereas nums1[0] = 1 and nums1[2] = 3 are not present in nums2. Therefore, answer[0] = [1,3].
For nums2, nums2[0] = 2 is present at index 1 of nums1, whereas nums2[1] = 4 and nums2[2] = 6 are not present in nums2. Therefore, answer[1] = [4,6].
```

__Example 2:__
```
Input: nums1 = [1,2,3,3], nums2 = [1,1,2,2]
Output: [[3],[]]
Explanation:
For nums1, nums1[2] and nums1[3] are not present in nums2. Since nums1[2] == nums1[3], their value is only included once and answer[0] = [3].
Every integer in nums2 is present in nums1. Therefore, answer[1] = [].
```

__Constraints:__

- ```1 <= nums1.length, nums2.length <= 1000```
- ```-1000 <= nums1[i], nums2[i] <= 1000```

---

### Brute Force

```Python
class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        res = [[], []]

        def helper(nums1, nums2):
            nums1_set = set()

            for num1 in nums1:
                exist_in_nums2 = False
                for num2 in nums2:
                    if num1 == num2:
                        exist_in_nums2 = True
                        break

                if not exist_in_nums2:
                    nums1_set.add(num1)
            
            return list(nums1_set)
        
        return [helper(nums1, nums2), helper(nums2, nums1)]
```

### ✅ Hash Set

```Python
class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        nums1_set = set(nums1)
        nums2_set = set(nums2)
        res = [[],[]]

        for num in nums1 + nums2:
            if num not in nums2_set and num in nums1_set:
                res[0].append(num)
                nums1_set.remove(num)
            elif num not in nums1_set and num in nums2_set:
                res[1].append(num)
                nums2_set.remove(num)

        return res
```

#### One Liner

```Python
class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        return [list(set(nums1).difference(set(nums2))), list(set(nums2).difference(set(nums1)))]
```

```Python
class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        return [set(nums1) - set(nums2), set(nums2) - set(nums1)]
```

### Hash Table

```Python
class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        nums1_dict = collections.defaultdict(int)
        nums2_dict = collections.defaultdict(int)

        for num in nums1:
            if not num in nums1_dict:
                nums1_dict[num] += 1
        for num in nums2:
            if not num in nums2_dict:
                nums2_dict[num] += 1

        res = [[], []]

        for num in nums1 + nums2:
            if num in nums1_dict and not num in nums2_dict:
                res[0].append(num)
                nums1_dict[num] -= 1
                if not nums1_dict[num]:
                    del nums1_dict[num]
            elif num in nums2_dict and not num in nums1_dict:
                res[1].append(num)
                nums2_dict[num] -= 1
                if not nums2_dict[num]:
                    del nums2_dict[num]

        return res
```
