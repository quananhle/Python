## [1569. Number of Ways to Reorder Array to Get Same BST](https://leetcode.com/problems/number-of-ways-to-reorder-array-to-get-same-bst/)

```Tag```: ```Binary Search Tree``` ```Recursion```

#### Difficulty: Hard

Given an array ```nums``` that represents a permutation of integers from ```1``` to ```n```. We are going to construct a binary search tree (BST) by inserting the elements of ```nums``` in order into an initially empty BST. Find the number of different ways to reorder ```nums``` so that the constructed BST is identical to that formed from the original array ```nums```.

- For example, given ```nums = [2,1,3]```, we will have ```2``` as the root, ```1``` as a left child, and ```3``` as a right child. The array ```[2,3,1]``` also yields the same BST but ```[3,2,1]``` yields a different BST.
Return _the number of ways to reorder ```nums``` such that the BST formed is identical to the original BST formed from ```nums```_.

Since the answer may be very large, return it modulo $10^9 + 7$.

![image](https://github.com/quananhle/Python/assets/35042430/4a7f575a-15b9-4c30-a8d9-f4b4d1828be1)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/08/12/bb.png)
```
Input: nums = [2,1,3]
Output: 1
Explanation: We can reorder nums to be [2,3,1] which will yield the same BST. There are no other ways to reorder nums which will yield the same BST.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/08/12/ex1.png)
```
Input: nums = [3,4,5,1,2]
Output: 5
Explanation: The following 5 arrays will yield the same BST: 
[3,1,2,4,5]
[3,1,4,2,5]
[3,1,4,5,2]
[3,4,1,2,5]
[3,4,1,5,2]
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/08/12/ex4.png)
```
Input: nums = [1,2,3]
Output: 0
Explanation: There are no other orderings of nums that will yield the same BST.
```

__Constraints:__

- ```1 <= nums.length <= 1000```
- ```1 <= nums[i] <= nums.length```
- All integers in ```nums``` are distinct.

---

### Recursion

```Python
class Solution:
    def numOfWays(self, nums: List[int]) -> int:
        mod = 10**9 + 7

        def dfs(nums):
            n = len(nums)
            # Base case
            if n < 3:
                return 1
            
            left_nodes = [node for node in nums if node < nums[0]]
            right_nodes = [node for node in nums if node > nums[0]]
            return dfs(left_nodes) * dfs(right_nodes) * comb(n - 1, len(left_nodes)) % mod

        return (dfs(nums) - 1) % mod
```
