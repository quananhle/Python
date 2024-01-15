## [1165. Single-Row Keyboard](https://leetcode.com/problems/single-row-keyboard)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Easy

There is a special keyboard with all keys in a single row.

Given a string ```keyboard``` of length ```26``` indicating the layout of the keyboard (indexed from ```0``` to ```25```). Initially, your finger is at index ```0```. To type a character, you have to move your finger to the index of the desired character. The time taken to move your finger from index ```i``` to index ```j``` is ```|i - j|```.

You want to type a string ```word```. Write a function to calculate how much time it takes to type it with one finger.

---

__Example 1:__
```
Input: keyboard = "abcdefghijklmnopqrstuvwxyz", word = "cba"
Output: 4
Explanation: The index moves from 0 to 2 to write 'c' then to 1 to write 'b' then to 0 again to write 'a'.
Total time = 2 + 1 + 1 = 4.
```

__Example 2:__
```
Input: keyboard = "pqrstuvwxyzabcdefghijklmno", word = "leetcode"
Output: 73
```

__Constraints:__

- $keyboard.length == 26$
- ```keyboard``` contains each English lowercase letter exactly once in some order.
- $1 \le word.length \le 10^4$
- ```word[i]``` is an English lowercase letter.

---

### Array

```Python
class Solution:
    def calculateTime(self, keyboard: str, word: str) -> int:
        positions = [0] * 26
        for i, c in enumerate(keyboard):
            positions[ord(c) - ord('a')] = i
        n = len(word)

        ans = prev = 0
        for i in range(n):
            ans += abs(positions[ord(word[i]) - ord('a')] - prev)
            prev = positions[ord(word[i]) - ord('a')]
        
        return ans
```

#### ```find```

```Python
class Solution:
    def calculateTime(self, keyboard: str, word: str) -> int:
        ans = keyboard.find(word[0])
        n = len(word)

        for i in range(1, n):
            ans += abs(keyboard.find(word[i]) - keyboard.find(word[i - 1]))

        return ans
```

#### One-Liner

```Python
class Solution:
    def calculateTime(self, keyboard: str, word: str) -> int:
        return sum([abs(keyboard.find(word[i]) - keyboard.find(word[i - 1])) for i in range(1, len(word))]) + keyboard.find(word[0])
```
