## [2448. Minimum Cost to Make Array Equal](https://leetcode.com/problems/minimum-cost-to-make-array-equal/)

```Tag```:

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


