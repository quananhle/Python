## Combination Sum

```Tag```: ```Backtracking```

#### Difficulty: Medium

Given an array of __distinct__ integers ```candidates``` and a target integer ```target```, return _a list of all __unique combinations__ of ```candidates``` where the chosen numbers sum to ```target```_. You may return the combinations in any order.

The __same__ number may be chosen from ```candidates``` an __unlimited number of times__. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

The test cases are generated such that the number of unique combinations that sum up to ```target``` is less than ```150``` combinations for the given input.

![image](https://user-images.githubusercontent.com/35042430/218562455-4c0b1d0a-9603-4241-bab3-af11e94d600d.png)

__Example 1:__
```
Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
```

__Example 2:__
```
Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]
```

__Example 3:__
```
Input: candidates = [2], target = 1
Output: []
```

__Constraints:__

- ```1 <= candidates.length <= 30```
- ```2 <= candidates[i] <= 40```
- ```All elements of ```candidates``` are distinct.
- ```1 <= target <= 40```

---

### Backtracking

![image](https://leetcode.com/problems/combination-sum/solutions/824635/Figures/39/39_exploration_tree.png)

```Python

```
