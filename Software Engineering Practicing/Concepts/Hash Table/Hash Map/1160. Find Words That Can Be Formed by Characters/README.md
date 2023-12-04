## [1160. Find Words That Can Be Formed by Characters](https://leetcode.com/problems/find-words-that-can-be-formed-by-characters)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Easy

You are given an array of strings ```words``` and a string ```chars```.

A string is good if it can be formed by characters from chars (each character can only be used once).

Return _the sum of lengths of all good strings in ```words```_.

![image](https://github.com/quananhle/Python/assets/35042430/351e9af9-fbfe-44ba-ad53-85974b8682c3)

---

__Example 1:__
```
Input: words = ["cat","bt","hat","tree"], chars = "atach"
Output: 6
Explanation: The strings that can be formed are "cat" and "hat" so the answer is 3 + 3 = 6.
```

__Example 2:__
```
Input: words = ["hello","world","leetcode"], chars = "welldonehoneyr"
Output: 10
Explanation: The strings that can be formed are "hello" and "world" so the answer is 5 + 5 = 10.
```

__Constraints:__

- $1 \le words.length \le 1000$
- $1 \le words[i].length, chars.length \le 100$
- ```words[i]``` and ```chars``` consist of lowercase English letters.

---

### Array & String

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n + m \cdot k)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        ans = 0
        counter = collections.defaultdict(int)
        for char in chars:
            counter[char] = 1 + counter.get(char, 0)

        def is_contained(counter):
            for _, val in counter.items():
                if val < 0:
                    return False
            return True

        for word in words:
            cnt_temp = counter.copy()
            for c in word:
                cnt_temp[c] -= 1 
            if is_contained(cnt_temp):
                ans += len(word)

        return ans
```

### Hash Map

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n + m \cdot k)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        ans = 0
        counter = collections.defaultdict(int)
        for char in chars:
            counter[char] = 1 + counter.get(char, 0)

        def is_contained(counter):
            for _, val in counter.items():
                if val < 0:
                    return False
            return True

        for word in words:
            cnt_temp = counter.copy()
            for c in word:
                cnt_temp[c] -= 1 
            if is_contained(cnt_temp):
                ans += len(word)

        return ans
```

```Python
class Solution:
    def countCharacters(self, words: List[str], chars: str) -> int:
        counter = collections.Counter(chars)
        ans = 0

        for word in words:
            word_counter = collections.Counter(word)
            good = True
            for key, freq in word_counter.items():
                if counter[key] < freq:
                    good = not good
                    break
            
            if good:
                ans += len(word)
        
        return ans
```

