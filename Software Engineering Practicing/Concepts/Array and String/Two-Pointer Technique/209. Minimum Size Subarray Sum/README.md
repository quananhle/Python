## 209. Minimum Size Subarray Sum

```Tag```:

#### Difficulty: Medium

Given an array of positive integers ```nums``` and a positive integer ```target```, return _the __minimal length__ of a subarray whose sum is greater than or equal to ```target```_. If there is no such subarray, return ```0``` instead.

![image](https://user-images.githubusercontent.com/35042430/209982455-57daa1fc-d043-4b35-8304-51ab96d0bbf2.png)

---

__Example 1:__
```
Input: target = 7, nums = [2,3,1,2,4,3]
Output: 2
Explanation: The subarray [4,3] has the minimal length under the problem constraint.
```

__Example 2:__
```
Input: target = 4, nums = [1,4,4]
Output: 1
```

__Example 3:__
```
Input: target = 11, nums = [1,1,1,1,1,1,1,1]
Output: 0
```

__Constraints:__
```
1 <= target <= 109
1 <= nums.length <= 105
1 <= nums[i] <= 104
```

---

__Follow up:__ If you have figured out the ```O(n)``` solution, try coding another solution of which the time complexity is ```O(n log(n))```.
