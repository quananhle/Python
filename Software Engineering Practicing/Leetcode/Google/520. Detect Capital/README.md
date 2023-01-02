## 520. Detect Capital

```Tag```: ```Hash Table``` ```Regular Expression```

#### Difficulty: Easy

We define the usage of capitals in a word to be right when one of the following cases holds:

- All letters in this word are capitals, like ```"USA"```.
- All letters in this word are not capitals, like ```"leetcode"```.
- Only the first letter in this word is capital, like ```"Google"```.

Given a string ```word```, return ```true``` if the usage of capitals in it is right.

![image](https://user-images.githubusercontent.com/35042430/210194827-320ab49b-8c88-42c9-93f1-1a5e5a5bd68d.png)

---

__Example 1:__
```
Input: word = "USA"
Output: true
```

__Example 2:__
```
Input: word = "FlaG"
Output: false
```

__Constraints:__
```
1 <= word.length <= 100
word consists of lowercase and uppercase English letters.
```

---

The pattern of case 1 in regex is [A−Z]∗[A-Z]*[A−Z]∗, where [A−Z][A-Z][A−Z] matches one char from 'A' to 'Z', ∗*∗ represents repeat the pattern before it at least 0 times. Therefore, this pattern represents "All capital".

The pattern of case 2 in regex is [a−z]∗[a-z]*[a−z]∗, where similarly, [a−z][a-z][a−z] matches one char from 'a' to 'z'. Therefore, this pattern represents "All not capital".

Similarly, the pattern of case 3 in regex is [A−Z][a−z]∗[A-Z][a-z]*[A−Z][a−z]∗.

Take these three pattern together, we have [A−Z]∗∣[a−z]∗∣[A−Z][a−z]∗[A-Z]*|[a-z]*|[A-Z][a-z]*[A−Z]∗∣[a−z]∗∣[A−Z][a−z]∗, where "|" represents "or".

Still, we can combine case 2 and case 3, and we get .[a−z]∗.[a-z]*.[a−z]∗, where "." can matches any char.

Therefore, the final pattern is [A−Z]∗∣.[a−z]∗[A-Z]*|.[a-z]*[A−Z]∗∣.[a−z]∗.
