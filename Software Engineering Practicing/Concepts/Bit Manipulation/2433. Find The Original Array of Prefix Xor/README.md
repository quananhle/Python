## [2433. Find The Original Array of Prefix Xor](https://leetcode.com/problems/find-the-original-array-of-prefix-xor)

```Tag```: ```Bitwise Manipulation```

#### Difficulty: Medium

You are given an integer array ```pref``` of size ```n```. Find and return _the array ```arr``` of size ```n``` that satisfies_:

```
pref[i] = arr[0] ^ arr[1] ^ ... ^ arr[i].
```

Note that ^ denotes the bitwise-xor operation.

It can be proven that the answer is unique.

![image](https://github.com/quananhle/Python/assets/35042430/2680074f-51ee-4f27-9eed-f29f53afd854)

---

__Example 1__:
```
Input: pref = [5,2,0,3,1]
Output: [5,7,2,3,2]
Explanation: From the array [5,7,2,3,2] we have the following:
- pref[0] = 5.
- pref[1] = 5 ^ 7 = 2.
- pref[2] = 5 ^ 7 ^ 2 = 0.
- pref[3] = 5 ^ 7 ^ 2 ^ 3 = 3.
- pref[4] = 5 ^ 7 ^ 2 ^ 3 ^ 2 = 1.
```

__Example 2__:
```
Input: pref = [13]
Output: [13]
Explanation: We have pref[0] = arr[0] = 13.
```

__Constraints__:

- $1 \le pref.length \le 10^5$
- $0 \le pref[i] \le 10^6$

---

### Bitwise Manipulation

```Python
class Solution:
    def findArray(self, pref: List[int]) -> List[int]:
        n = len(pref)
        res = [None] * n
        res[0] = pref[0]

        for i in range(1, n):
            res[i] = pref[i] ^ pref[i -1]
        
        return res
```

### In-Place Modification

```Python
class Solution:
    def findArray(self, pref: List[int]) -> List[int]:
        n = len(pref)

        for i in range(n -1, 0, -1):
            pref[i] ^= pref[i - 1]
        
        return pref
```
