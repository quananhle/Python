## 299. Bulls and Cows

#### Difficulty: Medium

You are playing the __Bulls and Cows__ game with your friend.

You write down a secret number and ask your friend to guess what the number is. When your friend makes a guess, you provide a hint with the following info:

- The number of "bulls", which are digits in the guess that are in the correct position.
- The number of "cows", which are digits in the guess that are in your secret number but are located in the wrong position. Specifically, the non-bull digits in the guess that could be rearranged such that they become bulls.

Given the secret number ```secret``` and your friend's guess ```guess```, return the _hint for your friend's guess_.

The hint should be formatted as ```"xAyB"```, where ```x``` is the number of bulls and ```y``` is the number of cows. Note that both ```secret``` and ```guess``` may contain duplicate digits.

![image](https://user-images.githubusercontent.com/35042430/207121220-6b250b0c-23f9-4528-81e8-59b77f1d18ac.png)

---

__Example 1:__

```
Input: secret = "1807", guess = "7810"
Output: "1A3B"
Explanation: Bulls are connected with a '|' and cows are underlined:
"1807"
  |
"7810"
```

__Example 2:__

```
Input: secret = "1123", guess = "0111"
Output: "1A1B"
Explanation: Bulls are connected with a '|' and cows are underlined:
"1123"        "1123"
  |      or     |
"0111"        "0111"
Note that only one of the two unmatched 1s is counted as a cow since the non-bull digits can only be rearranged to allow one 1 to be a bull.
```

__Constraints:__
```
1 <= secret.length, guess.length <= 1000
secret.length == guess.length
secret and guess consist of digits only.
```
 
