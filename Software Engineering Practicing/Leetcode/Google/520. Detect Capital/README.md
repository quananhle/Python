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

### Compare Character by Character

#### Counter

```Python
class Solution:
    def detectCapitalUse(self, word: str) -> bool:
        DICTIONARY = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}
        upper_count, lower_count = 0, 0
        for w in word:
            if w in DICTIONARY:
                upper_count += 1
            else:
                lower_count += 1
        if upper_count == len(word) or lower_count == len(word) or (word[0] in DICTIONARY and lower_count == len(word) - 1):
            return True
        return False
```

```Python
class Solution:
    def detectCapitalUse(self, word: str) -> bool:
        upper_count, lower_count = 0, 0
        for w in word:
            if w.isupper():
                upper_count += 1
            elif w.islower():
                lower_count += 1
        if upper_count == len(word) or lower_count == len(word) or (word[0].isupper() and lower_count == len(word) - 1):
            return True
        return False
```

#### Scanning

```Python
class Solution:
    def detectCapitalUse(self, word: str) -> bool:
        '''
        if len(word) == 1:
            return True
        if word[0].isupper():
            if word[1].isupper():
                for i in range(2, len(word)):
                    if not word[i].isupper():
                        return False
            else:
                for i in range(1, len(word)):
                    if word[i].isupper():
                        return False
        else:
            for i in range(1, len(word)):
                if word[i].isupper():
                    return False
        return True
        '''
        # Check if only 1 letter in word, always True uppercase or lowercase
        if len(word) == 1:
            return True
        # Case 1:
        # Check if the first letter is Capital and the second letter is also Capital
        if word[0].isupper() and word[1].isupper():
            # If any lowercase letter found the rest of the word, return False
            for i in range(2, len(word)):
                if not word[i].isupper():
                    return False
        # Case 2 and case 3:
        # Since if not case 1, the first letter does not matter if it is capital as long as the rest of the word is lowercase
        else:
            for i in range(1, len(word)):
                if word[i].isupper():
                    return False
        return True
```

### Regex

The pattern of case 1 in regex is [A−Z]∗[A-Z]*[A−Z]∗, where [A−Z][A-Z][A−Z] matches one char from 'A' to 'Z', ∗*∗ represents repeat the pattern before it at least 0 times. Therefore, this pattern represents "All capital".

The pattern of case 2 in regex is [a−z]∗[a-z]*[a−z]∗, where similarly, [a−z][a-z][a−z] matches one char from 'a' to 'z'. Therefore, this pattern represents "All not capital".

Similarly, the pattern of case 3 in regex is [A−Z][a−z]∗[A-Z][a-z]*[A−Z][a−z]∗.

Take these three pattern together, we have [A−Z]∗∣[a−z]∗∣[A−Z][a−z]∗[A-Z]*|[a-z]*|[A-Z][a-z]*[A−Z]∗∣[a−z]∗∣[A−Z][a−z]∗, where "|" represents "or".

Still, we can combine case 2 and case 3, and we get .[a−z]∗.[a-z]*.[a−z]∗, where "." can matches any char.

Therefore, the final pattern is [A−Z]∗∣.[a−z]∗[A-Z]*|.[a-z]*[A−Z]∗∣.[a−z]∗.

```Python

```
