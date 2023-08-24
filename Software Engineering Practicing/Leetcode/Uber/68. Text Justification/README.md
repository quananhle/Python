## [68. Text Justification](https://leetcode.com/problems/text-justification/)

```Tag```:

#### Difficulty: Hard

Given an array of strings ```words``` and a width ```maxWidth```, format the text such that each line has exactly ```maxWidth``` characters and is fully (left and right) justified.

You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ```' '``` when necessary so that each line has exactly ```maxWidth``` characters.

Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line does not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.

For the last line of text, it should be left-justified, and no extra space is inserted between words.

__Note:__

- A word is defined as a character sequence consisting of non-space characters only.
- Each word's length is guaranteed to be greater than ```0``` and not exceed ```maxWidth```.
- The input array ```words``` contains at least one word.

![image](https://github.com/quananhle/Python/assets/35042430/876c3888-01da-4927-86d0-322acac274e3)

---

__Example 1:__
```
Input: words = ["This", "is", "an", "example", "of", "text", "justification."], maxWidth = 16
Output:
[
   "This    is    an",
   "example  of text",
   "justification.  "
]
```

__Example 2:__
```
Input: words = ["What","must","be","acknowledgment","shall","be"], maxWidth = 16
Output:
[
  "What   must   be",
  "acknowledgment  ",
  "shall be        "
]
Explanation: Note that the last line is "shall be    " instead of "shall     be", because the last line must be left-justified instead of fully-justified.
Note that the second line is also left-justified because it contains only one word.
```

__Example 3:__
```
Input: words = ["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], maxWidth = 20
Output:
[
  "Science  is  what we",
  "understand      well",
  "enough to explain to",
  "a  computer.  Art is",
  "everything  else  we",
  "do                  "
]
```

__Constraints:__

- $1 \le words.length \le 300$
- $1 \le words[i].length \le 20$
- ```words[i]``` consists of only English letters and symbols.
- $1 \le maxWidth \le 100$
- $words[i].length \le maxWidth$

---
