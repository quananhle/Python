## [2369. Check if There is a Valid Partition For The Array](https://leetcode.com/problems/check-if-there-is-a-valid-partition-for-the-array/)

```Tag```:

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```nums```. You have to partition the array into one or more __contiguous__ subarrays.

We call a partition of the array valid if each of the obtained subarrays satisfies one of the following conditions:

1. The subarray consists of exactly ```2``` equal elements. For example, the subarray ```[2,2]``` is good.
2. The subarray consists of exactly ```3``` equal elements. For example, the subarray ```[4,4,4]``` is good.
3. The subarray consists of exactly ```3``` consecutive increasing elements, that is, the difference between adjacent elements is ```1```. For example, the subarray ```[3,4,5]``` is good, but the subarray ```[1,3,5]``` is not.

Return _```true``` if the array has at least one valid partition_. Otherwise, return ```false```.

![image](https://github.com/quananhle/Python/assets/35042430/b23bd353-71a9-4510-b98a-f3f69644b792)

---
