## [2448. Minimum Cost to Make Array Equal](https://leetcode.com/problems/minimum-cost-to-make-array-equal/)

```Tag```: ```Prefix Sum``` ```Binary Search```

#### Difficulty: Hard

You are given two __0-indexed__ arrays ```nums``` and ```cost``` consisting each of ```n``` positive integers.

You can do the following operation any number of times:

- Increase or decrease any element of the array ```nums``` by ```1```.

The cost of doing one operation on the i<sup>th</sup> element is ```cost[i]```.

Return _the minimum total cost such that all the elements of the array ```nums``` become equal_.

![image](https://github.com/quananhle/Python/assets/35042430/f710b7fb-ec49-4dd1-a9bb-8d1df1158324)

---

__Example 1:__
```
Input: nums = [1,3,5,2], cost = [2,3,1,14]
Output: 8
Explanation: We can make all the elements equal to 2 in the following way:
- Increase the 0th element one time. The cost is 2.
- Decrease the 1st element one time. The cost is 3.
- Decrease the 2nd element three times. The cost is 1 + 1 + 1 = 3.
The total cost is 2 + 3 + 3 = 8.
It can be shown that we cannot make the array equal with a smaller cost.
```

__Example 2:__
```
Input: nums = [2,2,2,2,2], cost = [4,2,8,1,3]
Output: 0
Explanation: All the elements are already equal, so no operations are needed.
```

__Constraints:__

- ```n == nums.length == cost.length```
- ```1 <= n <= 10^5```
- ```1 <= nums[i], cost[i] <= 10^6```

---

![image](https://leetcode.com/problems/minimum-cost-to-make-array-equal/Figures/2448/intro.png)

### Prefix Sum

![image](https://leetcode.com/problems/minimum-cost-to-make-array-equal/Figures/2448/1.png)

![image](https://leetcode.com/problems/minimum-cost-to-make-array-equal/Figures/2448/3.png)

![image](https://leetcode.com/problems/minimum-cost-to-make-array-equal/Figures/2448/2.png)

![image](https://leetcode.com/problems/minimum-cost-to-make-array-equal/Figures/2448/5.png)

Algorithm
Collect every pair of nums[i] and cost[i] in the array numsAndCost and sort it according to nums[i].

Build a prefix sum array prefixCost to record the prefix sum of the cost in the sorted numsAndCost.

Start with nums[0], calculate the cost of making every element equal nums[0] as totalCost.

Iterate over nums starting from nums[1], for every base nums[i]:

Calculate the different between the current base and the previous base as gap = nums[i] - nums[i - 1].

The current totalCost made by nums[i], compared with the previous cost made by nums[i - 1], is increased by gap times the prefix sum of costs prefixCost[i - 1] and decreased by gap times the suffix sum of costs prefixCost[n - 1] - prefixCost[i - 1].

Record and update the smallest totalCost we have met so far as answer.

Once the iteration ends, return answer.

```Python
class Solution:
    def minCost(self, nums: List[int], cost: List[int]) -> int:
        num_and_cost = sorted([num, c] for num, c in zip(nums, cost))
        n = len(cost)

        prefix = [0] * n
        prefix[0] = num_and_cost[0][1]
        for i in range(1, n):
            prefix[i] = num_and_cost[i][1] + prefix[i - 1]

        total = 0
        for i in range(1, n):
            total += num_and_cost[i][1] * (num_and_cost[i][0] - num_and_cost[0][0])
        ans = total

        for i in range(1, n):
            gap = num_and_cost[i][0] - num_and_cost[i - 1][0]
            total += prefix[i - 1] * gap
            total -= gap * (prefix[n - 1] - prefix[i - 1])
            ans = min(ans, total)

        return ans
```

