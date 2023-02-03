## 220. Contains Duplicate III

```Tag```: ```Binary Search Tree``` ```Bucket Sort``` ```Sliding Window```

#### Difficulty: Hard

You are given an integer array ```nums``` and two integers ```indexDiff``` and ```valueDiff```. Find a pair of indices ```(i, j)``` such that:

- ```i != j```,
- ```abs(i - j) <= indexDiff```.
- ```abs(nums[i] - nums[j]) <= valueDiff```, 

and return _```true``` if such pair exists or ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/216531043-a674984d-ded0-4318-b72a-1a89edfeb5d7.png)

---

__Example 1:__
```
Input: nums = [1,2,3,1], indexDiff = 3, valueDiff = 0
Output: true
Explanation: We can choose (i, j) = (0, 3).
We satisfy the three conditions:
i != j --> 0 != 3
abs(i - j) <= indexDiff --> abs(0 - 3) <= 3
abs(nums[i] - nums[j]) <= valueDiff --> abs(1 - 1) <= 0
```

__Example 2:__
```
Input: nums = [1,5,9,1,5,9], indexDiff = 2, valueDiff = 3
Output: false
Explanation: After trying all the possible pairs (i, j), we cannot satisfy the three conditions, so we return false.
```

__Constraints:__

- 2 <= ```nums.length``` <= 10<sup>5</sup>
- -10<sup>9</sup> <= ```nums[i]``` <= 10<sup>9</sup>
- ```1 <= indexDiff <= nums.length```
- 0 <= ```valueDiff``` <= 10<sup>9</sup>

---

### Sliding Window

```Python
class Solution:
    def containsNearbyAlmostDuplicate(self, nums: List[int], indexDiff: int, valueDiff: int) -> bool:
        # Brute Force Sliding Window
        n = len(nums)
        for i in range(n):
            # i != j
            # abs(i - j) <= indexDiff
            for j in range(max(i - indexDiff, 0), i):
                # abs(nums[i] - nums[j]) <= valueDiff
                if abs(nums[i] - nums[j]) <= valueDiff:
                    return True
        return False
```

### Bucket Sort

```Bucket sort``` is a sorting algorithm that works by distributing the elements of an array into a number of buckets. Each bucket is then sorted individually, using a different sorting algorithm

![image](https://leetcode.com/problems/contains-duplicate-iii/solutions/127827/Figures/220/220_Buckets.png)

From the above example, we have 8 unsorted integers. We create 5 buckets covering the inclusive ranges of ```[0,9],[10,19],[20,29],[30,39],[40,49]``` individually. Each of the eight elements is in a particular bucket. For element with value x, its bucket label is x/w and here we have w=10. Sort each bucket using some other sorting algorithm and then collect all of them bucket by bucket.

```Python
class Solution:
    def containsNearbyAlmostDuplicate(self, nums: List[int], indexDiff: int, valueDiff: int) -> bool:
        bucket_size = valueDiff + 1
        bucket = collections.defaultdict(int)

        def get_bucket_index(num):
            if num >= 0:
                return num // bucket_size
            return (num + 1) // bucket_size - 1
        
        for idx, num in enumerate(nums):
            bucket_idx = get_bucket_index(num)
            if bucket_idx in bucket:
                return True

            # Check left and right bucket of the current bucket
            left, right = bucket_idx - 1, bucket_idx + 1
            # Check if the following requirements are met
                # abs(i - j) <= indexDiff.
                # abs(nums[i] - nums[j]) <= valueDiff
            if (left in bucket and abs(bucket[left] - num) <= valueDiff) \
                or (right in bucket and abs(bucket[right] - num) <= valueDiff):
                    return True
            
            # Otherwise, create new bucket for num
            bucket[bucket_idx] = num

            # Remove invalid bucket which element index does not meet the indexDiff condition
            if idx >= indexDiff:
                bucket.pop(get_bucket_index(nums[idx - indexDiff]))
        
        return False
```
