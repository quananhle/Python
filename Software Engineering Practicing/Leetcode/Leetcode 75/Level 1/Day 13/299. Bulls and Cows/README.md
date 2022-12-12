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

---

### Hash Table

```Python
class Solution(object):
    def getHint(self, secret, guess):
        """
        :type secret: str
        :type guess: str
        :rtype: str
        """
        # Hash Table
        #### Time Complexity: O(N), traverse through the size of secret or guess
        #### Space Complexity: O(1), size of hashmap has up to 10 digits from 0 to 9
        bulls = cows = 0
        freq_secret, freq_guess = collections.defaultdict(int), collections.defaultdict(int)
        for a,b in zip(secret, guess):
            if a == b:
                bulls += 1
            else:
                freq_secret[a] += 1
                freq_guess[b] += 1
        for key in freq_secret:
            cows += min(freq_secret[key], freq_guess[key])
        return str(bulls) + "A" + str(cows) + "B"
```


### Hash Table

```Python
class Solution(object):
    def getHint(self, secret, guess):
        """
        :type secret: str
        :type guess: str
        :rtype: str
        """
        # Hash Table
        #### Time Complexity: O(N), traverse through the size of secret or guess
        #### Space Complexity: O(1), size of hashmap has up to 10 digits from 0 to 9
        counter = dict()
        for digit in secret:
            if digit not in counter:
                counter[digit] = 1
            else:
                counter[digit] += 1
        bulls = cows = 0
        for index,digit in enumerate(guess):
            if digit in counter:
                # If bull found
                if digit == secret[index]:
                    bulls += 1
                    if counter[digit] <= 0:
                        cows -= 1
                # If cow found
                if digit != secret[index]:
                    if counter[digit] > 0:
                        cows += 1
                # Update counter by decrementing the digit frequency
                counter[digit] -= 1
        return "{}A{}B".format(bulls, cows)
```
