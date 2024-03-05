## [1750. Minimum Length of String After Deleting Similar Ends](https://leetcode.com/problems/minimum-length-of-string-after-deleting-similar-ends)

```Tag```: ```Array & String``` ```Two Pointers``` ```Recursion```

Given a string ```s``` consisting only of characters ```'a'```, ```'b'```, and ```'c'```. You are asked to apply the following algorithm on the string any number of times:

- Pick a non-empty prefix from the string ```s``` where all the characters in the prefix are equal.
- Pick a non-empty suffix from the string ```s``` where all the characters in this suffix are equal.
- The prefix and the suffix should not intersect at any index.
- The characters from the prefix and suffix must be the same.
- Delete both the prefix and the suffix.

Return _the minimum length of ```s``` after performing the above operation any number of times (possibly zero times)_.

---

__Example 1:__
```
Input: s = "ca"
Output: 2
Explanation: You can't remove any characters, so the string stays as is.
```

__Example 2:__
```
Input: s = "cabaabac"
Output: 0
Explanation: An optimal sequence of operations is:
- Take prefix = "c" and suffix = "c" and remove them, s = "abaaba".
- Take prefix = "a" and suffix = "a" and remove them, s = "baab".
- Take prefix = "b" and suffix = "b" and remove them, s = "aa".
- Take prefix = "a" and suffix = "a" and remove them, s = "".
```

__Example 3:__
```
Input: s = "aabccabba"
Output: 3
Explanation: An optimal sequence of operations is:
- Take prefix = "aa" and suffix = "a" and remove them, s = "bccabb".
- Take prefix = "b" and suffix = "bb" and remove them, s = "cca".
```

__Constraints:__

- $1 \le s.length \le 10^5$
- ```s``` only consists of characters ```'a'```, ```'b'```, and ```'c'```.

---

### Two Pointers

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def minimumLength(self, s: str) -> int:
        n = len(s)
        left, right = 0, n - 1

        while left < right and s[left] == s[right]:
            start, end = s[left], s[right]

            while left <= right and s[left] == start:
                left += 1
            
            while left < right and s[right] == end:
                right -= 1

        return right - left + 1
```

### Tail Recursion

In a recursive function, each recursive call creates a new stack frame, which can lead to a stack overflow if the function is called too many times. Tail recursion reduces this problem by reusing the current stack frame instead of creating a new one.
It's an optimization technique used in functional programming to avoid the use of explicit loops and improve performance.

To use tail recursion, the last statement of a function must be a recursive call, and the function must have a base case that can be reached by the recursive call. The base case is used to stop the recursion and return a value.
Since our approach has both conditions, we can use tail recursion in the below implementation.

> Note: The implementation shown here is provided for the purpose of building perspective on different ways to solve a problem. While the recursion-based solution is valid, the two-pointer implementation remains the most intuitive and optimized solution.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def minimumLength(self, s: str) -> int:
        def delete_similar_ends(start, end):
            if start >= end or s[start] != s[end]:
                return end - start + 1
            else:
                l, r = s[start], s[end]

                while start <= end and s[start] == l:
                    start += 1
                while start < end and s[end] == r:
                    end -= 1
            return delete_similar_ends(start, end)
        
        return delete_similar_ends(0, len(s) - 1)
```
