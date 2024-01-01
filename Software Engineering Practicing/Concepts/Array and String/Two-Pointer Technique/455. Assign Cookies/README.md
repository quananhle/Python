## [455. Assign Cookies](https://leetcode.com/problems/assign-cookies/)

```Tag```: ```String & Array``` ```Two Pointers``` ```Sorting```

#### Difficulty: Easy

Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie.

Each child ```i``` has a greed factor ```g[i]```, which is the minimum size of a cookie that the child will be content with; and each cookie ```j``` has a size ```s[j]```. If ```s[j] >= g[i]```, we can assign the cookie ```j``` to the child ```i```, and the child ```i``` will be content. Your goal is to maximize the number of your content children and output the maximum number.

<img width="511" alt="image" src="https://github.com/quananhle/Python/assets/35042430/9f0745b6-2f74-4e65-bc8e-80797d0aa70e">

---

__Example 1:__
```
Input: g = [1,2,3], s = [1,1]
Output: 1
Explanation: You have 3 children and 2 cookies. The greed factors of 3 children are 1, 2, 3. 
And even though you have 2 cookies, since their size is both 1, you could only make the child whose greed factor is 1 content.
You need to output 1.
```

__Example 2:__
```
Input: g = [1,2], s = [1,2,3]
Output: 2
Explanation: You have 2 children and 3 cookies. The greed factors of 2 children are 1, 2. 
You have 3 cookies and their sizes are big enough to gratify all of the children, 
You need to output 2.
```

__Constraints:__

- $1 \le g.length \le 3 * 10^4$
- $0 \le s.length \le 3 * 10^4$
- $1 \le g[i], s[j] \le 2^{31} - 1$

---

### Sorting + Two-Pointer Technique

```Python
class Solution:
    def findContentChildren(self, g: List[int], s: List[int]) -> int:
        i, j = 0, 0
        n, m = len(g), len(s)
        g.sort(), s.sort()

        while i < n and j < m:
            if g[i] <= s[j]:
                i += 1
            j += 1

        return i
```
