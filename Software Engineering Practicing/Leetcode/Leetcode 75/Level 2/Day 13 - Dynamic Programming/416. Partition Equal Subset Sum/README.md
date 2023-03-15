## [416. Partition Equal Subset Sum](https://leetcode.com/problems/partition-equal-subset-sum/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given an integer array ```nums```, return _```true``` if you can partition the array into two subsets such that the sum of the elements in both subsets is equal or ```false``` otherwise_.

![image](https://user-images.githubusercontent.com/35042430/225202324-64a0329f-d0ae-4789-9bc7-f3e2f7083c33.png)

---

__Example 1:__
```
Input: nums = [1,5,11,5]
Output: true
Explanation: The array can be partitioned as [1, 5, 5] and [11].
```

__Example 2:__
```
Input: nums = [1,2,3,5]
Output: false
Explanation: The array cannot be partitioned into equal sum subsets.
```

__Constraints:__

- ```1 <= nums.length <= 200```
- ```1 <= nums[i] <= 100```

---

The problem is similar to the classic Knapsack problem. The basic idea is to understand that to partition an array into two subsets of equal sum say ```subSetSum```, the ```totalSum``` of given array must be twice the ```subSetSum```.

```totalSum = subSetSum ∗ 2```

__Example__: Assume ```totalSum``` of an array is ```20``` and if we want to partition it into 2 subsets of equal sum, then the ```subSetSum``` must be ```(20 / 2) = 10.

It must be noted that the total sum of an array must be _even_, only then we can divide it into 2 equal subsets. For instance, we cannot have an equal ```subSetSum``` for an array with total sum as 21.

### Brute Force

We have to find a subset in an array where the sum must be equal to _subSetSum_ that we calculated above. The brute force approach would be to generate all the possible subsets of an array and return true if we find a subset with the required sum.

#### Depth-First Search

__Algorithm__

1. Function: keep track of the current index of ```nums``` and the current _subSetSum_
2. Recurrence relation:

    Assume, there is an array ```nums``` of size ```n``` and we have to find if there exists a subset with total _sum = subSetSum_. For a given array element ```x```, there could be either of 2 possibilities:

  - Case 1) ```x``` is included in _subset sum_. _subSetSum = subSetSum − x_
  - Case 2) ```x``` is not included in _subset sum_, so we must take previous sum without ```x```. _subSetSum = subSetSum_

    We can use depth first search and recursively calculate the ```subSetSum``` for each case and check if either of them is true. This can be formulated as

    ```Java
    isSum (subSetSum, n) = isSum(subSetSum- nums[n], n-1) ||  isSum(subSetSum, n-1)
    ```

3. Base Cases

  - If _subSetSum_ is ```0```, return ```true``` ( Since we found a subset with sum _subSetSum_)
  - If _subSetSum_ is less than ```0```, return ```false```

```Python
class Solution:
    def canPartition(self, nums: List[int]) -> bool:
        # Brute Force
        total = sum(nums)

        if total % 2 != 0:
            return False

        def dfs(i, curr):
            # Base cases:
            if curr == 0:
                return True
            if i == 0 or curr < 0:
                return False

            # Recurrece relation
            return dfs(i - 1, curr - nums[i - 1]) or dfs(i - 1, curr)

        subset = total // 2
        n = len(nums)

        return dfs(n - 1, subset)
```

