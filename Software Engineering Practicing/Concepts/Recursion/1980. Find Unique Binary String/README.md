## [1980. Find Unique Binary String](https://leetcode.com/problems/find-unique-binary-string)

```Tag```: ```Recursion```

#### Difficulty: Medium

Given an array of strings ```nums``` containing ```n``` unique binary strings each of length ```n```, return _a binary string of length ```n``` that does not appear in ```nums```_. If there are multiple answers, you may return any of them.

---

__Example 1:__
```
Input: nums = ["01","10"]
Output: "11"
Explanation: "11" does not appear in nums. "00" would also be correct.
```

__Example 2:__
```
Input: nums = ["00","01"]
Output: "11"
Explanation: "11" does not appear in nums. "10" would also be correct.
```

__Example 3:__
```
Input: nums = ["111","011","001"]
Output: "101"
Explanation: "101" does not appear in nums. "000", "010", "100", and "110" would also be correct.
```

__Constraints:__

- $n == nums.length$
- $1 <= n <= 16$
- $nums[i].length == n$
- ```nums[i]``` is either ```'0'``` or ```'1'```.
- All the strings of ```nums``` are unique.

---

### Recursion

```Python
class Solution:
    def findDifferentBinaryString(self, nums: List[str]) -> str:
        n = len(nums)
        num_set = set(nums)
        
        def generate(curr):
            num = ''.join(curr)
            # Base case
            if len(curr) == n:
                if not num in num_set:
                    return num
                return ""
            
            add_zero = generate(curr + ['0'])
            add_one = generate(curr + ['1'])
            if add_zero:
                return add_zero
            elif add_one:
                return add_one
            else:
                return ""
        
        return generate([])
```
