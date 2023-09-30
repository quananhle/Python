## [456. 132 Pattern](https://leetcode.com/problems/132-pattern)

```Tag```: ```Stack``` ```Binary Search``` ```Interval```

#### Difficulty: Medium

Given an array of ```n``` integers ```nums```, a 132 pattern is a subsequence of three integers ```nums[i]```, ```nums[j]``` and ```nums[k]``` such that ```i < j < k``` and ```nums[i] < nums[k] < nums[j]```.

Return _```true``` if there is a 132 pattern in ```nums```, otherwise, return ```false```_.

![image](https://github.com/quananhle/Python/assets/35042430/f00dfadc-c9c0-432e-b96b-5a132555fb03)

---

__Example 1:__
```
Input: nums = [1,2,3,4]
Output: false
Explanation: There is no 132 pattern in the sequence.
```

__Example 2:__
```
Input: nums = [3,1,4,2]
Output: true
Explanation: There is a 132 pattern in the sequence: [1, 4, 2].
```

__Example 3:__
```
Input: nums = [-1,3,2,0]
Output: true
Explanation: There are three 132 patterns in the sequence: [-1, 3, 2], [-1, 3, 0] and [-1, 2, 0].
```

__Constraints:__

- $n == nums.length$
- $1 \le n \le 2 * 10^{5}$
- $10^{9} \le nums[i] \le 10^{9}$

---

### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^3)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def find132pattern(self, nums: List[int]) -> bool:
        for i in range(len(nums) - 2):
            for j in range(i + 1, len(nums) - 1):
                for k in range(j + 1, len(nums)):
                    if nums[k] > nums[i] and nums[j] > nums[k]:
                        return True
        
        return False
```

### Optimized Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^2)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def find132pattern(self, nums: List[int]) -> bool:
        min_num = math.inf
        for j in range(len(nums) - 1):
            min_num = min(nums[j], min_num)
            for k in range(j + 1, len(nums)):
                if min_num < nums[k] < nums[j]:
                    return True
        
        return False
```

### Search Intervals

As discussed in the last approach, once we've fixed a $nums[i], nums[j]$ pair, we just need to determine a $nums[k]$ which falls in the range $(nums[i],nums[j])$. Further, to maximize the likelihood of any arbitrary $nums[k]$ falling in this range, we need to try to keep this range as much as possible. But, in the last approach, we tried to work only on $nums[i]$. But, it'll be a better choice, if we can somehow work out on $nums[j]$ as well.

![image](https://leetcode.com/problems/132-pattern/Figures/456/456_132_Pattern.PNG)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^2)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def find132pattern(self, nums: List[int]) -> bool:
        subsequences = list()
        n = len(nums)
        i, k = 0, 1

        while k < n:
            # Check if encounter a falling edge, k - 1 is the peak index, or j as j < k and nums[k] < nums[j]
            j = k - 1
            if nums[k] < nums[j]:
                # Check if i is smaller than j, indicating interval has a range of at least 3 elements
                if i < j:
                    # Record the index of i and j
                    subsequences.append((nums[i], nums[j]))
                # Jump i to the lowest point of the falling slope
                i = k
            # Check subsequence if it has 132 pattern
            for subsequence in subsequences:
                if subsequence[0] < nums[k] < subsequence[1]:
                    return True
            k += 1    
        return False
```

```Python
class Solution:
    def find132pattern(self, nums: List[int]) -> bool:
        subsequences = list()
        n = len(nums)
        i, k = 0, 1

        for k in range(n):
            # Check if encounter a falling edge, k - 1 is the peak index, or j as j < k and nums[k] < nums[j]
            j = k - 1
            if nums[k] < nums[j]:
                # Check if i is smaller than j, indicating interval has a range of at least 3 elements
                if i < j:
                    # Record the index of i and j
                    subsequences.append((nums[i], nums[j]))
                # Jump i to the lowest point of the falling slope
                i = k
            # Check subsequence if it has 132 pattern
            for subsequence in subsequences:
                if subsequence[0] < nums[k] < subsequence[1]:
                    return True
        return False
```

### Montonic Stack

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def find132pattern(self, nums: List[int]) -> bool:
        n = len(nums)
        if n < 3:
            return False
        stack = list()

        # Preprocess prefix min array for nums[i] candidate
        min_array = [nums[0]] * n
        for i in range(1, len(nums)):
            min_array[i] = min(min_array[i - 1], nums[i])

        # Traverse backward to add all candidate of nums[k] to the monotonic stack
        for j in range(n - 1, -1, -1):
            if nums[j] <= min_array[j]:
                continue
            # Ensure nums[k] candidate in the monotonic stack is larger than nums[i] candidate
            while stack and stack[-1] <= min_array[j]:
                stack.pop()
            # If the nums[k] candidate, if there is in stack, is smaller than nums[j] candidate
            if stack and stack[-1] < nums[j]:
                # All candidates for nums[i] < nums[k] < nums[j] found 
                return True
            stack.append(nums[j])
        
        return False
```

### Using Array as Stack

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def find132pattern(self, nums: List[int]) -> bool:
        k = len(nums)
        if k < 3:
            return False

        # Preprocess prefix min array for nums[i] candidate
        min_array = [nums[0]] * k
        for i in range(1, len(nums)):
            min_array[i] = min(min_array[i - 1], nums[i])

        for j in range(len(nums) - 1, -1, -1):
            if nums[j] <= min_array[j]:
                continue
            while k < len(nums) and nums[k] <= min_array[j]:
                k += 1
            if k < len(nums) and nums[k] < nums[j]:
                return True
            k -= 1
            nums[k] = nums[j]
        
        return False
```

### Binary Search

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \cdot \log N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
        if len(nums) < 3:
            return False
        min_array = [-1] * len(nums)
        min_array[0] = nums[0]
        for i in range(1, len(nums)):
            min_array[i] = min(min_array[i - 1], nums[i])

        k = len(nums)
        for j in range(len(nums) - 1, -1, -1):
            if nums[j] <= min_array[j]:
                continue
            k = bisect_left(nums, min_array[j] + 1, k, len(nums))
            if k < len(nums) and nums[k] < nums[j]:
                return True
            k -= 1
            nums[k] = nums[j]
        return False
```
