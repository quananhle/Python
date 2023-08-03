## [17. Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number)

```Tag```: ```Recursion``` ```Backtracking``` ```Breadth-First Search``` ```Depth-First Search``` ```Sorted List```

#### Difficulty: Medium

Given a string containing digits from ```2-9``` inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![image](https://assets.leetcode.com/uploads/2022/03/15/1200px-telephone-keypad2svg.png)

![image](https://user-images.githubusercontent.com/35042430/217920480-109d7aee-9eec-4d09-90d5-bb30af6cbf0d.png)

---

__Example 1:__
```
Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
```

__Example 2:__
```
Input: digits = ""
Output: []
```

__Example 3:__
```
Input: digits = "2"
Output: ["a","b","c"]
```

__Constraints:__

- $0 \le digits.length \le 4$
- ```digits[i]``` is a digit in the range ```['2', '9']```.

---

### Backtracking

In this particular problem, the length of the input is extremely small, ```0 <= digits.length <= 4```. With such small input sizes, we can safely assume that a brute force solution in which we generate all combinations of letters will be accepted.

Whenever you have a problem where you need to ```generate all combinations/permutations``` of some ```group of letters/numbers```, the first thought you should have is ```backtracking```. Backtracking algorithms can often keep the space complexity linear with the input size.

__Time Complexity__: O(4<sup>N</sup> * N), where ```N``` is the length of digits. Note that ```4``` in this expression is referring to the maximum value length in the hash map, and not to the length of the input.

__Space Complexity__: O(N), N is the length of the digits input. Not counting space used for the output, the extra space we use relative to input size is the space occupied by the recursion call stack. It will only go as deep as the number of digits in the input since whenever we reach that depth, we backtrack.

```Python
class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        res = list()

        if not digits:
            return res

        letter_map = collections.defaultdict(list)
        letter_map['2'] = ['a', 'b', 'c']
        letter_map['3'] = ['d', 'e', 'f']
        letter_map['4'] = ['g', 'h', 'i']
        letter_map['5'] = ['j', 'k', 'l']
        letter_map['6'] = ['m', 'n', 'o']
        letter_map['7'] = ['p', 'q', 'r', 's']
        letter_map['8'] = ['t', 'u', 'v']
        letter_map['9'] = ['w', 'x', 'y', 'z']

        
        def backtrack(index, combination):
            # Base case
            if len(combination) == len(digits):
                res.append("".join(combination))
                return

            # Get the mapping letters of the current digit
            letters = letter_map[digits[index]]

            for letter in letters:
                # Append the letter to the combination
                combination.append(letter)
                # Move on to the next digit
                backtrack(index + 1, combination)
                # Backtracking
                combination.pop()

        backtrack(0, [])

        return res
```

#### Sorted List

```Python
from sortedcontainers import SortedList

class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        phone_dictionary = {
            '2': {'a', 'b', 'c'},
            '3': {'d', 'e', 'f'},
            '4': {'g', 'h', 'i'},
            '5': {'j', 'k', 'l'},
            '6': {'m', 'n', 'o'},
            '7': {'p', 'q', 'r', 's'},
            '8': {'t', 'u', 'v'},
            '9': {'w', 'x', 'y', 'z'}
        }

        n = len(digits)
        res = SortedList()

        def backtrack(curr, combination):
            # Base case
            if len(combination) == n:
                res.add("".join(combination))
                return

            letters = phone_dictionary[digits[curr]]

            for letter in letters:
                combination.append(letter)
            
                backtrack(curr + 1, combination)

                combination.pop()

        if not digits:
            return res

        backtrack(0, [])
        return res
```

---

### Depth-First Search

#### Iterative Approach

```Python
class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        res = list()

        if not digits:
            return res

        letter_map = collections.defaultdict(list)
        letter_map['2'] = ['a', 'b', 'c']
        letter_map['3'] = ['d', 'e', 'f']
        letter_map['4'] = ['g', 'h', 'i']
        letter_map['5'] = ['j', 'k', 'l']
        letter_map['6'] = ['m', 'n', 'o']
        letter_map['7'] = ['p', 'q', 'r', 's']
        letter_map['8'] = ['t', 'u', 'v']
        letter_map['9'] = ['w', 'x', 'y', 'z']

        
        for digit in digits:
            res.append(letter_map[digit])
        
        print (res)

        while len(res) > 1:
            letters_1, letters_2 =  res.pop(), res.pop()
            combination = list()
            for l1 in letters_1:
                for l2 in letters_2:
                    combination.append(l2 + l1)
            res.append(combination)

        return res[0]
```
