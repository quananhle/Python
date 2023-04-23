## [1416. Restore The Array](https://leetcode.com/problems/restore-the-array/)

```Tag```:

#### Difficulty: Hard

A program was supposed to print an array of integers. The program forgot to print whitespaces and the array is printed as a string of digits ```s``` and all we know is that all integers in the array were in the range ```[1, k]``` and there are no leading zeros in the array.

Given the string ```s``` and the integer ```k```, return _the number of the possible arrays that can be printed as ```s``` using the mentioned program_. Since the answer may be very large, return it modulo 10<sup>9</sup>+ 7.

---

__Example 1:__
```
Input: s = "1000", k = 10000
Output: 1
Explanation: The only possible array is [1000]
```

__Example 2:__
```
Input: s = "1000", k = 10
Output: 0
Explanation: There cannot be an array that was printed this way and has all integer >= 1 and <= 10.
```

__Example 3:__
```
Input: s = "1317", k = 2000
Output: 8
Explanation: Possible arrays are [1317],[131,7],[13,17],[1,317],[13,1,7],[1,31,7],[1,3,17],[1,3,1,7]
```

__Constraints:__

- 1 <= ```s.length``` <= 10<sup>5</sup>
- ```s``` consists of only digits and does not contain leading zeros.
- 1 <= ```k``` <= 10<sup>9</sup>

---

### The Framework

#### Top-Down Dynamic Programming

__Algorithm__

1. Create an array ```memo``` of size ```m + 1```, to store the value of ```dp(x)```.

2. To get the value of ```dp(start)```, if a non-zero ```dp[start]``` exists, it means we have already got its value, return ```dp[start]```. Otherwise:

  - If ```s[start] == 0```, return ```0```.
  - If ```start = m```, return ```1```.
  - Initialize ```count = 0```, the number of valid arrays.
  - Then we look for every possible ending index ```end``` by iterating over indexes from ```start```. If ```s[start ~ end]``` represents a valid integer, we continue looking for the subproblem ```dp(end + 1)``` and update count as ```count += dp(end + 1)```.
  - Update ```memo[start]``` as ```dp(start)```.

3. Return dp(0).

```Python

```

#### Bottom-Up Dynamic Programming
