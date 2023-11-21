## [1887. Reduction Operations to Make the Array Elements Equal](https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal)

```Tag```: ```Array & String``` ```Sorting```

#### Difficulty: Medium

Given an integer array ```nums```, your goal is to make all elements in ```nums``` equal. To complete one operation, follow these steps:

1. Find the __largest__ value in ```nums```. Let its index be ```i``` (__0-indexed__) and its value be ```largest```. If there are multiple elements with the largest value, pick the smallest ```i```.
2. Find the next largest value in ```nums``` strictly smaller than largest. Let its value be ```nextLargest```.
3. Reduce ```nums[i]``` to ```nextLargest```.

Return _the number of operations to make all elements in ```nums``` equal_.

---

__Example 1:__
```
Input: nums = [5,1,3]
Output: 3
Explanation: It takes 3 operations to make all elements in nums equal:
1. largest = 5 at index 0. nextLargest = 3. Reduce nums[0] to 3. nums = [3,1,3].
2. largest = 3 at index 0. nextLargest = 1. Reduce nums[0] to 1. nums = [1,1,3].
3. largest = 3 at index 2. nextLargest = 1. Reduce nums[2] to 1. nums = [1,1,1].
```

__Example 2:__
```
Input: nums = [1,1,1]
Output: 0
Explanation: All elements in nums are already equal.
```

__Example 3:__
```
Input: nums = [1,1,2,2,3]
Output: 4
Explanation: It takes 4 operations to make all elements in nums equal:
1. largest = 3 at index 4. nextLargest = 2. Reduce nums[4] to 2. nums = [1,1,2,2,2].
2. largest = 2 at index 2. nextLargest = 1. Reduce nums[2] to 1. nums = [1,1,1,2,2].
3. largest = 2 at index 3. nextLargest = 1. Reduce nums[3] to 1. nums = [1,1,1,1,2].
4. largest = 2 at index 4. nextLargest = 1. Reduce nums[4] to 1. nums = [1,1,1,1,1].
```

__Constraints:__

- $1 \le nums.length \le 5 * 10^4$
- $1 \le nums[i] \le 5 * 10^4$

---

![image](https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal/Figures/1887/1.png)

![image](https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal/Figures/1887/2.png)

As you can see, the original ```8``` was reduced to each unique element in the array less than it. There were many operations done on other numbers in between, but if we were to focus ONLY on the original ```8``` and the operations performed on it, we find that the number of operations is equal to the count of unique numbers less than ```8```.

![image](https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal/Figures/1887/3.png)

In fact, this idea extends to every position in the array!

![image](https://leetcode.com/problems/reduction-operations-to-make-the-array-elements-equal/Figures/1887/4.png)

For each position, we can find the number of operations required to reduce the number to ```min``` by counting the number of steps we take down.

### Sorting

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \cdot \log{N})$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def reductionOperations(self, nums: List[int]) -> int:
        nums.sort()
        n = len(nums)

        reduction_steps = 0
        ans = 0

        for i in range(1, n):
            if nums[i] != nums[i - 1]:
                reduction_steps += 1
            ans += reduction_steps

        return ans
```

```Python
class Solution:
    def reductionOperations(self, nums: List[int]) -> int:
        nums.sort(reverse=True)
        n = len(nums)

        reduction_steps = 0
        ans = 0

        for i in range(n - 2, -1, -1):
            if nums[i] != nums[i + 1]:
                reduction_steps += 1
            ans += reduction_steps

        return ans
```

```Python
class Solution:
    def reductionOperations(self, nums: List[int]) -> int:
        nums.sort(reverse=True)
        ans = 0
        n = len(nums)

        for i in range(1, n):
            if nums[i - 1] != nums[i]:
                ans += i
        
        return ans
```
