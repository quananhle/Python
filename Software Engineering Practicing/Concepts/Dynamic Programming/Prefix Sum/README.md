## Prefix Sum

### What is prefix sum?

__Prefix sum__ also called __cumulative sum__, is an array with the same size as the original array, where the ith element represents the sum of the elements in the origianl array up to the ith position.
e.g., ```arr = [1,2,3,4,5]```, ```prefixSum = [1,3,6,10,15]```

### __Prefix sum__ technique: 

```one pass + linear time complexity```

```
Prefix sum is a sum of the current value with all previous elements starting from the beginning of the structure.
```

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/prefix_qd.png)
_Prefix sum for 1D array._

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/2d_prefix.png)
_Prefix sum for 2D array._

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/tree2.png)
_Prefix sum for the binary tree._

### Prefix Sum: 

You might want to use the prefix sum technique for the problems like __"Find a number of continuous subarrays/submatrices/tree paths that sum to target"__.

#### How to Use: Number of Continuous Subarrays that Sum to Target

[Find a number of continuous subarrays that sum to target](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/Prefix%20Sum/560.%20Subarray%20Sum%20Equals%20K)

- Use a variable to track the current prefix sum and a hashmap "```prefix sums``` -> how many times was it seen so far".

![image](https://leetcode.com/problems/path-sum-iii/Figures/437/array1.png)
_Find a number of continuous subarrays that sum to target._

- Parse the input structure and count the requested subarrays/submatrices/tree paths along the way with the help of that hashmap. How to count?

- There could be two situations:
  - In situation 1, the subarray with the target sum starts from the beginning of the array. That means that the current prefix sum is equal to the target sum, and we increase the counter by ```1```.

  ![image](https://leetcode.com/problems/path-sum-iii/Figures/437/situation11.png)
  _Situation 1: The subarray starts from the beginning of the array._

  - In situation 2, the subarray with the target sum starts somewhere in the middle. That means we should add to the counter the number of times we have seen the prefix sum ```curr_sum - target``` so far: ```count += prefix_sums[curr_sum - target]```. The logic is simple: the current prefix sum is ```curr_sum```, and some elements before the prefix sum was ```curr_sum - target```. All the elements in between sum up to ```curr_sum - (curr_sum - target) = target```.
 
  ![image](https://leetcode.com/problems/path-sum-iii/Figures/437/situation24.png)
  _Situation 2: The subarray starts somewhere in the middle._
