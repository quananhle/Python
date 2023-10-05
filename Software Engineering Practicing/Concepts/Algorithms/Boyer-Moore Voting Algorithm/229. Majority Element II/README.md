## [229. Majority Element II](https://leetcode.com/problems/majority-element-ii)

```Tag```: ```Hash Map``` ```Boyer-Moore Voting Algorithm```

#### Difficulty: Medium

Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

![image](https://github.com/quananhle/Python/assets/35042430/bfe778e3-3c3d-4a76-ab02-16a1145ce5cf)

---

__Example 1:__
```
Input: nums = [3,2,3]
Output: [3]
```

__Example 2:__
```
Input: nums = [1]
Output: [1]
```

__Example 3:__
```
Input: nums = [1,2]
Output: [1,2]
```

__Constraints:__

- $1 \le nums.length \le 5 * 10^4$
- -10^9 \le nums[i] \le 10^9

---

### Counter

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> List[int]:
        n = len(nums)
        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)
        res = list()
        for num, freq in counter.items():
            if freq > (n // 3):
                res.append(num)
        return res
```

#### One Liner

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> List[int]:
        return [num for num, freq in collections.Counter(nums).items() if freq > (len(nums) // 3)]
```

### Boyer-Moore Voting Algorithm

```Python

```
