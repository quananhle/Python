## [1531. String Compression II](https://leetcode.com/problems/string-compression-ii)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

__Run-length encoding__ is a string compression method that works by replacing consecutive identical characters (repeated 2 or more times) with the concatenation of the character and the number marking the count of the characters (length of the run). For example, to compress the string ```"aabccc"``` we replace ```"aa"``` by ```"a2"``` and replace ```"ccc"``` by ```"c3"```. Thus the compressed string becomes ```"a2bc3"```.

Notice that in this problem, we are not adding ```'1'``` after single characters.

Given a string ```s``` and an integer ```k```. You need to delete at most ```k``` characters from ```s``` such that the run-length encoded version of ```s``` has minimum length.

Find _the minimum length of the run-length encoded version of ```s``` after deleting at most ```k``` characters_.

![image](https://github.com/quananhle/Python/assets/35042430/5fd4dce4-a28a-4d7e-9376-44677d1bf29d)

---

__Example 1:__
```
Input: s = "aaabcccd", k = 2
Output: 4
Explanation: Compressing s without deleting anything will give us "a3bc3d" of length 6. Deleting any of the characters 'a' or 'c' would at most decrease the length of the compressed string to 5, for instance delete 2 'a' then we will have s = "abcccd" which compressed is abc3d. Therefore, the optimal way is to delete 'b' and 'd', then the compressed version of s will be "a3c3" of length 4.
```

__Example 2:__
```
Input: s = "aabbaa", k = 2
Output: 2
Explanation: If we delete both 'b' characters, the resulting compressed string would be "a4" of length 2.
```

__Example 3:__
```
Input: s = "aaaaaaaaaaa", k = 0
Output: 3
Explanation: Since k is zero, we cannot delete anything. The compressed string is "a11" of length 3.
```

__Constraints:__

- $1 \le s.length \le 100$
- $0 \le k \le s.length$
- ```s``` contains only lowercase English letters.

---

### Dynamic Pragramming Framework

#### Top-Down Dynamic Programming

![image](https://leetcode.com/problems/string-compression-ii/Figures/1531/1531_1.png)

- ```i```: Index of the current symbol
- ```prev```: The last symbol we have in our compression
- ```count```: The number of ```prev``` we have considered
- ```k```: The number of symbols we are still allowed to delete

Now we need to understand what parameters to use to define each DP state. We need several of them:

1. First is the number of symbols we have already traversed. We need it to know the next symbol to be processed.
2. The last letter that was added to the compressed string that we are building. This is so that we can decide how the compression will change if a new symbol is added.
3. The count of the last letter. Imagine that we have compression ```a3b5```. If we add one more ```b```, our compression will become ```a3b6```. We need to be careful with several cases. When we have, say, ```a3``` compression, and we add a ```b```, then we will now have ```a3b```. Also if we have ```a3b9``` and we add one more ```b```, then we will have ```a3b10```. Similarly, ```a3b99``` will change to ```a3b100``` after addition of a ```b```. Notice that when the count of the last letter is ```0```, ```1```, ```9```, or ```99```, the length of the compression will change. However, when the count of the last letter is anything else, the length of the compression will not change.
4. Finally, we need to keep track of how many symbols we are still allowed to delete.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \cdot k^2)$
- __Space Complexity__: $\mathcal{O}(n \cdot k^2)$

```Python
class Solution:
    def getLengthOfOptimalCompression(self, s: str, k: int) -> int:
        n = len(s)

        @functools.lru_cache(maxsize=None)
        def dp(i, prev, count, k):
            # Base case
            if k < 0:
                return math.inf
            if i == n:
                return 0
            
            # DP Transitions: to delete or to keep
            to_delete = dp(i + 1, prev, count, k - 1)

            # To keep
            if s[i] == prev:
                to_keep = dp(i + 1, prev, count + 1, k) + (count in [1, 9, 99])
            else:
                to_keep = dp(i + 1, s[i], 1, k) + 1
            
            return min(to_delete, to_keep)
        
        return dp(0, '', 0, k)
```
