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

__Algorithm__:

- Collect every pair of ```nums[i]``` and ```cost[i]``` in the array ```num_and_cost``` and sort it according to ```nums[i]```.
- Build a prefix sum array ```prefix``` to record the prefix sum of the cost in the sorted ```num_and_cost```.
- Start with ```nums[0]```, calculate the cost of making every element equal ```nums[0]``` as ```total```.
- Iterate over nums starting from ```nums[1]```, for every base ```nums[i]```:
    - Calculate the different between the current base and the previous base as ```gap = nums[i] - nums[i - 1]```.
    - The current ```total``` made by ```nums[i]```, compared with the previous cost made by ```nums[i - 1]```, is increased by ```gap``` times the prefix sum of costs ```prefix[i - 1]``` and decreased by ```gap``` times the suffix sum of costs ```prefix[n - 1] - prefix[i - 1]```.
    - Record and update the smallest ```total``` we have met so far as ```ans```.
- Once the iteration ends, return ```ans```.

- __Time Complexity__: $O(n⋅log⁡n)$
- __Space Complexity__: $O(n)$

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

### Binary Search

![image](https://leetcode.com/problems/minimum-cost-to-make-array-equal/Figures/2448/c1.png)

![image](https://leetcode.com/problems/minimum-cost-to-make-array-equal/Figures/2448/c2.png)

Algorithm
Initialize the searching space by setting its boundaries left = min(nums) and right = max(nums).
2）While left < right:

Get the middle value mid using integer division mid = (left + right) / 2.
Calculate the cost of two adjacent bases, F(mid) and F(mid + 1).
If F(mid) > F(mid + 1), cut the left half by setting left = mid + 1. Otherwise, cut the right half by setting right = mid. Then repeat step 2.
Return left once the search ends.

- __Time Complexity__: $O(n⋅log⁡k)$
- __Space Complexity__: $O(1)$

```Python
class Solution:
    def minCost(self, nums: List[int], cost: List[int]) -> int:
        def get_cost(base):
            return sum(abs(base - num) * c for num, c in zip(nums, cost))
        
        lo, hi = min(nums), max(nums)
        ans = get_cost(nums[0])

        while lo < hi:
            mi = lo + (hi - lo) // 2
            cost_1 = get_cost(mi)
            cost_2 = get_cost(mi + 1)
            ans = min(cost_1, cost_2)

            if cost_1 > cost_2:
                lo = mi + 1
            else:
                hi = mi
            
        return ans
```
