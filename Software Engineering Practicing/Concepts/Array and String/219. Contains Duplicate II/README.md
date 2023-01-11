## 219. Contains Duplicate II

```Tag```: ```Hash Table``` ```Hash Set``` ```Sliding Window```

#### Difficulty: Easy

Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

![image](https://user-images.githubusercontent.com/35042430/211743374-fec042b2-ac04-4eaa-8214-e5f2119d15f3.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1], k = 3
Output: true
```

__Example 2:__
```
Input: nums = [1,0,1,1], k = 1
Output: true
```

__Example 3:__
```
Input: nums = [1,2,3,1,2,3], k = 2
Output: false
```

__Constraints:__
```
1 <= nums.length <= 105
-109 <= nums[i] <= 109
0 <= k <= 105
```

---

### Hash Table

```Python
class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        # Hash Table
        #### Time Complexity : O(N), traverse through the input array to build the hash map
        #### Space Complexity: O(N), extra memory space required to build hash map
        memo = collections.defaultdict(list)
        for i, n in enumerate(nums):
            memo[n].append(i)
        for key, val in memo.items():
            if len(val) >= 2:
                for i in range(1, len(val)):
                    if val[i] - val[i - 1] <= k:
                        return True
        return False
```

### Optimized Hash Table

```Python
class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        # Hash Table
        #### Time Complexity : O(N), traverse through the input array to build the hash map
        #### Space Complexity: O(N), extra memory space required to build hash map
        memo = dict()
        for idx, num in enumerate(nums):
            if num in memo and idx - memo[num] <= k:
                return True
            memo[num] = idx
        return False
```

### Hash Set with Sliding Window

```Python
class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        # Hash Set with Sliding Window
        #### Time Complexity : O(N), traverse through the input array to do operations of search (O(1)), delete (O(1)) and insert (O(1))
        #### Space Complexity: O(min(N, k)), extra memory space of sliding window to build hash table
        memo = set()
        for i in range(len(nums)):
            if nums[i] in memo:
                return True
            memo.add(nums[i])
            if len(memo) > k:
                memo.remove(nums[i-k])
        return False
```
