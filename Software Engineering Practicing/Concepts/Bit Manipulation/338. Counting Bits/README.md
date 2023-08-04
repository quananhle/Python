## [338. Counting Bits](https://leetcode.com/problems/counting-bits)

```Tag```: ```Bitwise```

#### Difficulty: Easy

Given an integer ```n```, return _an array ans of length ```n + 1``` such that for each ```i``` ```(0 <= i <= n)```, ```ans[i]``` is the number of ```1```'s in the binary representation of ```i```_.

![image](https://github.com/quananhle/Python/assets/35042430/8ef7148e-c7ca-449a-a880-48d08b31ddd3)

---

__Example 1:__
```
Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10
```

__Example 2:__
```
Input: n = 5
Output: [0,1,1,2,1,2]
Explanation:
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101
```

__Constraints:__

- $0 \le n \le 10^{5}$
 
---

__Follow up:__

- It is very easy to come up with a solution with a runtime of $\mathcal{O}(n \cdot \mathcal{log}n)$. Can you do it in linear time $\mathcal{O}(n)$ and possibly in a single pass?
- Can you do it without using any built-in function (i.e., like __builtin_popcount in C++)?

---

### Approach 1: Pop Count

Complexity Analysis

Time complexity: O(n⋅log⁡n)O(n \cdot \log n)O(n⋅logn). 

```Python
class Solution:
    def countBits(self, n: int) -> List[int]:
        def pop_count(x: int) -> int:
            count = 0
            while x != 0:
                # Zeroing out the least significant nonzero bit
                x = x & (x - 1)
                count += 1
            return count
        
        res = [0] * (n + 1)
        for x in range(n + 1):
            res[x] = pop_count(x)
        
        return res
```
