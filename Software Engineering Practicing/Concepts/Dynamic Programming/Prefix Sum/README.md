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

You might want to use the prefix sum technique for the problems like __"Find a number of continuous subarrays/submatrices/tree paths that sum to target"__.
