## [1456. Maximum Number of Vowels in a Substring of Given Length](https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/)

```Tag```: ```Sliding Window```

#### Difficulty: Medium

Given a string ```s``` and an integer ```k```, return _the maximum number of vowel letters in any substring of ```s``` with length ```k```_.

__Vowel letters__ in English are ```'a'```, ```'e'```, ```'i'```, ```'o'```, and ```'u'```.

![image](https://user-images.githubusercontent.com/35042430/236581371-82156d4a-b797-46b5-aa50-9344dfa866d5.png)

---

__Example 1:__
```
Input: s = "abciiidef", k = 3
Output: 3
Explanation: The substring "iii" contains 3 vowel letters.
```

__Example 2:__
```
Input: s = "aeiou", k = 2
Output: 2
Explanation: Any substring of length 2 contains 2 vowels.
```

__Example 3:__
```
Input: s = "leetcode", k = 3
Output: 2
Explanation: "lee", "eet" and "ode" contain 2 vowels.
```

__Constraints:__

- 1 <= ```s.length``` <= 10<sup>5</sup>
- ```s``` consists of lowercase English letters.
- ```1 <= k <= s.length```

---

### Two Pointers (Time Limit Exceeded)

![image](https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/Figures/1456/intro.png)

```Python
class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        VOWELS = {'a', 'e', 'i', 'o', 'u'}
        ans = 0
        n = len(s)

        for start in range(n - k + 1):
            curr = 0
            end = start + k
            for c in s[start:end]:
                if c in VOWELS:
                    curr += 1
            ans = max(ans, curr)

        return ans 
```

#### Sliding Window

![image](https://leetcode.com/problems/maximum-number-of-vowels-in-a-substring-of-given-length/Figures/1456/2.png)

```Python
class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        vowels = {'a' , 'e' , 'i' , 'o' , 'u'}
        substring = s[:k]
        curr = sum([1 for c in substring if c in vowels])
        n = len(s)
        ans = curr

        for end in range(k + 1, n + 1):
            start = end - k
            if substring[0] in vowels:
                curr -= 1
            substring = s[start:end]
            if substring[-1] in vowels:
                curr += 1
            ans = max(ans, curr)
        
        return ans
```

__Algorithm__

1. Build a hash set __vowels__ that contains all 5 vowel letters, initialize __answer__ as 0.
2. Record the number of vowel letters in the first __k__ letters as __count__.
3. Now we move the "window" to the right, let ```i``` be the index of its right boundary:
    - If ```s[i]``` is in vowels, increment count by ```1```.
    - If ```s[i - k]``` is in vowels, reduce count by ```1```.
    - Update ```answer``` as the maximum count we have encountered.
4. Return answer after the iteration ends.

```Python
class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        VOWELS = {'a', 'e', 'i', 'o', 'u'}
        ans = count = 0
        n = len(s)
        
        for end in range(n):
            count += 1 if s[end] in VOWELS else 0
            if end >= k:
                count -= 1 if s[end - k] in VOWELS else 0
            ans = max(ans, count)
        
        return ans
```

```Python
class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        VOWELS = {'a', 'e', 'i', 'o', 'u'}
        ans = count = 0
        n = len(s)

        for i in range(k):
            count += int(s[i] in VOWELS)
        ans = count

        for i in range(k, n):
            count += int(s[i] in VOWELS)
            count -= int(s[i - k] in VOWELS)
            ans = max(ans, count)
        
        return ans
```
