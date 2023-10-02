## [316. Remove Duplicate Letters](https://leetcode.com/problems/remove-duplicate-letters/)

```Tag```: ```Greedy``` ```Monotonic Stack```

#### Difficulty: Medium

Given a string ```s```, remove duplicate letters so that every letter appears once and only once. You must make sure your result is the smallest in lexicographical order among all possible results.

![image](https://github.com/quananhle/Python/assets/35042430/b07a6a7d-2bb1-454d-a5b5-d26bc42aa8db)

---

__Example 1:__
```
Input: s = "bcabc"
Output: "abc"
```

__Example 2:__
```
Input: s = "cbacdcbc"
Output: "acdb"
``` 

__Constraints:__

- $1 \le s.length \le 10^4$
- ```s``` consists of lowercase English letters.

__Note__: This question is the same as [1081](https://leetcode.com/problems/smallest-subsequence-of-distinct-characters/)

---

### Greedy Algorithm

#### Solving Letter by Letter

__Intuition__

The leftmost letter in the solution will be the smallest letter such that the suffix from that letter contains every other. This is because we know that: 
- The solution must have one copy of every letter, 
- and we know that the solution will have the lexicographically smallest leftmost character possible.

If there are multiple smallest letters in the input string, then we pick the leftmost one in the input string simply because it optimally gives us more options. We can always eliminate more letters later on, so the optimal solution will always remain in our search space.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$, the number of recursive calls is bounded by a constant (26 letters in the alphabet), so we have $\mathcal{O}(N) \cdot C = \mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$.

```Python
class Solution:
    def removeDuplicateLetters(self, s: str) -> str:
        counter = Counter(s)
        pivot = 0
        n = len(s)

        # Search for the candidate with smallest lexicographical order
        for i in range(n):
            # Pick the first encountered or leftmost smallest letter only
            if s[i] < s[pivot]:
                pivot = i
            counter[s[i]] -= 1
            # Once all s[i] letters were encountered, break out of the loop 
            if counter[s[i]] == 0:
                del counter[s[i]]
                break
        
        # Output is the leftmost letter plus the recursive call on the remainder of the string
        # Note: have to get rid of further occurrences of s[pivot] to ensure that there are no duplicates
        return s[pivot] + self.removeDuplicateLetters(s[pivot:].replace(s[pivot], "")) if s else ""
```

### Monotonic Stack

__Intuition__

As we iterate over our string, if character ```i``` is greater than character ```i +`1``` and another occurrence of character ```i``` exists later in the string, deleting character ```i``` will always lead to the optimal solution. Characters that come later in the string ```i``` don't matter in this calculation because ```i``` is in a more significant spot. Even if character ```i + 1``` isn't the best yet, we can always replace it for a smaller character down the line if possible.

```Python
class Solution:
    def removeDuplicateLetters(self, s: str) -> str:
        stack = list()
        seen = set()
        memo = {c:i for i, c in enumerate(s)}

        for i, c in enumerate(s):
            if not c in seen:
                while stack and c < stack[-1] and i < memo[stack[-1]]:
                    seen.discard(stack.pop())
                seen.add(c)
                stack.append(c)
            
        return "".join(stack)
```
