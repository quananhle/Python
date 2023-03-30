## [87. Scramble String](https://leetcode.com/problems/scramble-string/)

```Tag```: ```Dynamic Programming``` ```Recursion```

#### Difficulty: Hard

We can scramble a string s to get a string t using the following algorithm:

If the length of the string is 1, stop.

If the length of the string is > 1, do the following:
- Split the string into two non-empty substrings at a random index, i.e., if the string is ```s```, divide it to ```x``` and ```y``` where ```s = x + y```.
- Randomly decide to swap the two substrings or to keep them in the same order. i.e., after this step, ```s``` may become ```s = x + y``` or ```s = y + x```.
- Apply step 1 recursively on each of the two substrings ```x``` and ```y```.

Given two strings ```s1``` and ```s2``` of the same length, return _```true``` if ```s2``` is a scrambled string of ```s1```, otherwise, return ```false```_.

![image](https://user-images.githubusercontent.com/35042430/228712444-385b8984-a848-4f22-9d7b-3849dde16383.png)

---

__Example 1:__
```
Input: s1 = "great", s2 = "rgeat"
Output: true
Explanation: One possible scenario applied on s1 is:
"great" --> "gr/eat" // divide at random index.
"gr/eat" --> "gr/eat" // random decision is not to swap the two substrings and keep them in order.
"gr/eat" --> "g/r / e/at" // apply the same algorithm recursively on both substrings. divide at random index each of them.
"g/r / e/at" --> "r/g / e/at" // random decision was to swap the first substring and to keep the second substring in the same order.
"r/g / e/at" --> "r/g / e/ a/t" // again apply the algorithm recursively, divide "at" to "a/t".
"r/g / e/ a/t" --> "r/g / e/ a/t" // random decision is to keep both substrings in the same order.
The algorithm stops now, and the result string is "rgeat" which is s2.
As one possible scenario led s1 to be scrambled to s2, we return true.
```

__Example 2:__
```
Input: s1 = "abcde", s2 = "caebd"
Output: false
```

__Example 3:__
```
Input: s1 = "a", s2 = "a"
Output: true
```

__Constraints:__

- ```s1.length == s2.length```
- ```1 <= s1.length <= 30```
- ```s1``` and ```s2``` consist of lowercase English letters.

---

### The Framework

#### Top-Down Dynamic Programming

The ```dp``` function takes in two strings ```s1``` and ```s2```, and returns a boolean value indicating whether they are scrambled versions of each other. The function first checks the length of the strings - if they are both of length ```1```, it simply compares the characters. If the sorted characters in the two strings are not equal, it returns ```False```.

Otherwise, the function loops through all possible partitions of ```s1``` and checks if they are valid scrambles of corresponding partitions in ```s2```. The partitions are formed by looping through the length of s1 from index 1 to the end. If a valid partition is found, the function recursively checks the remaining partitions to see if they are also valid scrambles.

If at least one valid partition is found, the function returns ```True``` and stores the result in the ```memo``` dictionary. If no valid partitions are found, the function returns ```False``` and stores the result in the ```memo``` dictionary.

```Python
class Solution:
    def isScramble(self, s1: str, s2: str) -> bool:
        @lru_cache(None)
        def dp(s1, s2):
            # Base cases
            if not sorted(s1) == sorted(s2):
                return False
            if len(s1) == 1:
                return True
            
            for i in range(1, len(s1)):
                if dp(s1[:i], s2[-i:]) and dp(s1[i:], s2[:-i]) or dp(s1[:i], s2[:i]) and dp(s1[i:], s2[i:]):
                    return True
            
            return False

        return dp(s1, s2)
```

```Python
class Solution:
    def isScramble(self, s1: str, s2: str) -> bool:
        memo = collections.defaultdict(bool)

        def dp(s1, s2):
            # Base cases
            if sorted(s1) != sorted(s2):
                return False
            elif len(s1) == 1:
                return True
            elif (s1, s2) in memo:
                return memo[(s1, s2)]
            
            # Recurrence relation
            for i in range(1, len(s1)):
                if dp(s1[i:], s2[:-i]) and dp(s1[:i], s2[-i:]) or dp(s1[i:], s2[i:]) and dp(s1[:i], s2[:i]):
                    memo[(s1, s2)] = True
                    return memo[(s1, s2)]

            memo[(s1, s2)] = False
            return memo[(s1, s2)]

        return dp(s1, s2)
```
