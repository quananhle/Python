## [1758. Minimum Changes To Make Alternating Binary String](https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string)

```Tag```: ```Bit Manipulation``` ```Array & String``` ```Simulation```

#### Difficulty: Easy

You are given a string ```s``` consisting only of the characters ```'0'``` and ```'1'```. In one operation, you can change any ```'0'``` to ```'1'``` or vice versa.

The string is called alternating if no two adjacent characters are equal. For example, the string ```"010"``` is alternating, while the string ```"0100"``` is not.

Return _the minimum number of operations needed to make ```s``` alternating_.

---

__Example 1:__
```
Input: s = "0100"
Output: 1
Explanation: If you change the last character to '1', s will be "0101", which is alternating.
```

__Example 2:__
```
Input: s = "10"
Output: 0
Explanation: s is already alternating.
```

__Example 3:__
```
Input: s = "1111"
Output: 2
Explanation: You need two operations to reach "0101" or "1010".
```

__Constraints:__

- $1 \le s.length \le 10^4$
- ```s[i]``` is either ```'0'``` or ```'1'```.

---

### Simulation

__Intuition__

Once we make ```s``` alternating, there are two possibilities:

- ```s``` starts with ```0```.
- ```s``` starts with ```1```.

![image](https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/Figures/1758/1.png)

To fix any mismatched position, we require ```1``` operation. 
Thus, if we were to convert ```s``` to an alternating string starting with ```0```, we would require ```5``` operations. If we were to convert ```s``` to an alternative string starting with ```1```, we would require ```2``` operations. 
Since we want the minimum, we would have an answer of ```2```.

This brings us to our solution. We initialize two integers:

- ```start_0``` which represents the number of operations we require if we convert ```s``` to an alternating string starting with ```0```.
- ```start_1``` which represents the number of operations we require if we convert ```s``` to an alternating string starting with ```1```.

![image](https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/Figures/1758/2.png)

![image](https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/Figures/1758/3.png)

```Python
class Solution:
    def minOperations(self, s: str) -> int:
        start_0_possibility = start_1_possibility = 0

        for i, c in enumerate(s):
            if i % 2 == 0:
                # 0101: count even indices that have '1'
                if c != '0':
                    # Need to change to 0
                    start_0_possibility += 1
                # 1010: count even indices that have '0'
                if c != '1':
                    # Need to change to 1
                    start_1_possibility += 1
            else:
                # 0101: count odd indices that have '0'
                if c != '1':
                    # Need to change to 1
                    start_0_possibility += 1
                # 1010: count odd indices that have '1'
                if c != '0':
                    # Need to change to 0
                    start_1_possibility += 1

        return min(start_0_possibility, start_1_possibility)
```

### Optimizations

![image](https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/Figures/1758/1.png)

Only need to keep track of 1 possibility

```Python
class Solution:
    def minOperations(self, s: str) -> int:
        start_0 = 0
        
        for i, c in enumerate(s):
            if i % 2 == 0:
                if c == "1":
                    start_0 += 1
            else:
                if c == "0":
                    start_0 += 1
        
        return min(start_0, len(s) - start_0)
```

```Python
class Solution:
    def minOperations(self, s: str) -> int:
        ans, curr = 0, '0'

        for c in s:
            ans += (c != curr)
            curr = '1' if curr == '0' else '0'
        
        return min(ans, len(s) - ans)
```
