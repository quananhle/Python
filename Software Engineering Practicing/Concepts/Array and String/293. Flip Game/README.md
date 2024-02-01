## [293. Flip Game](https://leetcode.com/problems/flip-game)

```Tag```:

#### Difficulty: Easy

You are playing a Flip Game with your friend.

You are given a string ```currentState``` that contains only ```'+'``` and ```'-'```. You and your friend take turns to flip two consecutive ```"++"``` into ```"--"```. The game ends when a person can no longer make a move, and therefore the other person will be the winner.

Return _all possible states of the string currentState after one valid move_. You may return the answer in any order. If there is no valid move, return an empty list ```[]```.

---

__Example 1:__
```
Input: currentState = "++++"
Output: ["--++","+--+","++--"]
```

__Example 2:__
```
Input: currentState = "+"
Output: []
```

__Constraints:__

- $1 \le currentState.length \le 500$
- ```currentState[i]``` is either ```'+'``` or ```'-'```.

---

