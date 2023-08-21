## [459. Repeated Substring Pattern](https://leetcode.com/problems/repeated-substring-pattern/description/)

```Tag```: ```Array & String```

#### Difficulty: Easy

Given a string ```s```, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

![image](https://github.com/quananhle/Python/assets/35042430/f3f24956-8359-4b85-ba4d-17a2f40f990e)

---

__Example 1:__

```
Input: s = "abab"
Output: true
Explanation: It is the substring "ab" twice.
```

__Example 2:__
```
Input: s = "aba"
Output: false
```

__Example 3:__
```
Input: s = "abcabcabcabc"
Output: true
Explanation: It is the substring "abc" four times or the substring "abcabc" twice.
```

__Constraints:__

- $1 \le s.length \le 10^{4}$
- ```s``` consists of lowercase English letters.

---

### String Matching

#### Using Divisors

__Algorithm__

1. Create an integer variable ```n``` equal to the length of ```s```.
2. Iterate over all the prefix substrings of length ```i = 1``` to ```n / 2```:
    - If ```i``` divides ```n```, we declare an empty string pattern. Use an inner loop that iterates ```n / i``` times to concatenate the substring formed from the first ```i``` characters of ```s```.
    - If pattern equals ```s```, we return ```True```.
3. There is no substring that can be repeated to form ```s```. As a result, we return ```False```.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \cdot \sqrt{n})$.
- __Space Complexity__: $\mathcal{O}(n)$.

```Python
class Solution:
    def repeatedSubstringPattern(self, s: str) -> bool:
        n = len(s)

        for i in range(1, n // 2 + 1):
            if n % i == 0:
                pattern = s[:i] * (n // i)
                if s == pattern:
                    return True

        return False
```

### String Concatenation

![image](https://leetcode.com/problems/repeated-substring-pattern/Figures/459/459-1.png)

![image](https://leetcode.com/problems/repeated-substring-pattern/Figures/459/459-2.png)

__Algorithm__

1. Create a string variable ```t``` and set it to ```s + s```.
2. If the substring formed by removing the first and last character of ```t``` contains ```s```, we return ```True```. Otherwise, return ```False```. Note in our implementation, the ```substr``` function in ```C++``` and the ```substring``` method in ```Java``` both take two parameters. In both languages, the first parameter is the initial index from which our substring begins, while the second parameter works differently. It is the length of the substring in ```C++``` and the index of the last character in ```Java```.

```Python

```
