## [2264. Largest 3-Same-Digit Number in String](https://leetcode.com/problems/largest-3-same-digit-number-in-string)

```Tag```: ```Hash Map```

#### Difficulty: Easy

You are given a string ```num``` representing a large integer. An integer is good if it meets the following conditions:

- It is a substring of ```num``` with length ```3```.
- It consists of only one unique digit.

Return _the maximum good integer as a string or an empty string ```""``` if no such integer exists_.

__Note__:

- A substring is a contiguous sequence of characters within a string.
- There may be leading zeroes in ```num``` or a good integer.

---

__Example 1:__
```
Input: num = "6777133339"
Output: "777"
Explanation: There are two distinct good integers: "777" and "333".
"777" is the largest, so we return "777".
```

__Example 2:__
```
Input: num = "2300019"
Output: "000"
Explanation: "000" is the only good integer.
```

__Example 3:__
```
Input: num = "42352338"
Output: ""
Explanation: No substring of length 3 consists of only one unique digit. Therefore, there are no good integers.
```

__Constraints:__

- $3 \le num.length \le 1000$
- ```num``` only consists of digits.

---
