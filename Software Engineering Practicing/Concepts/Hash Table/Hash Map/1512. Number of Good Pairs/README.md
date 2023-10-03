## [1512. Number of Good Pairs](https://leetcode.com/problems/number-of-good-pairs)

```Tag```: ```Hash Map``` ```Math```

#### Difficulty: Easy

Given an array of integers ```nums```, return _the number of good pairs_.

A pair ```(i, j)``` is called good if ```nums[i] == nums[j]``` and ```i < j```.

![image](https://github.com/quananhle/Python/assets/35042430/2e6004d3-c3d0-4218-9ed0-1e217689c106)

---

__Example 1:__
```
Input: nums = [1,2,3,1,1,3]
Output: 4
Explanation: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.
```

__Example 2:__
```
Input: nums = [1,1,1,1]
Output: 6
Explanation: Each pair in the array are good.
```

__Example 3:__
```
Input: nums = [1,2,3]
Output: 0
```

__Constraints:__

- $1 \le nums.length \le 100$
- $1 \le nums[i] \le 100$

---

### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n^2)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        ans = 0
        n = len(nums)
        for i in range(n):
            for j in range(i + 1, n):
                if nums[i] == nums[j]:
                    ans += 1
        return ans
```

### Hash Map

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        counter = dict()
        ans = 0
        for num in nums:
            if not num in counter:
                counter[num] = counter.get(num, 0) + 1
            else:
                ans += counter[num]
                counter[num] += 1
        return ans
```

```Python
class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        counter = collections.defaultdict(int)
        ans = 0
        
        for num in nums:
            ans += counter[num]
            counter[num] += 1

        return ans
```

### Sum of Arithmetic Progression (AP)

- $1 -> 0$ pairs
- $11 -> +1$ pair
- $111 -> +2$ pairs
- $1111 -> +3$ pairs $=> 1+2+3=((4 - 1) * (4 - 1 + 1) // 2 = 6$

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        counter = dict()
        ans = 0
        for num in nums:
            counter[num] = counter.get(num, 0) + 1

        return sum((v - 1) * ((v - 1) + 1) // 2 for v in counter.values())
```

#### One Liner

```Python
class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        return sum((v - 1) * ((v - 1) + 1) // 2 for v in Counter(nums).values())
```
