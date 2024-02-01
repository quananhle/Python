## [293. Flip Game](https://leetcode.com/problems/flip-game)

```Tag```: ```Array & String```

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

### Linear Iteration

#### ```split``` & ```join```

```Python
class Solution:
    def generatePossibleNextMoves(self, currentState: str) -> List[str]:
        res = list()
        curr_state = [c for c in currentState]
        n = len(curr_state)

        for i in range(1, n):
            if curr_state[i - 1] == '+' and curr_state[i] == '+':
                curr_state[i - 1], curr_state[i] = '-', '-'
                res.append(''.join(curr_state))
                curr_state[i - 1], curr_state[i] = '+', '+'

        return res
```

#### Splice

```Python
class Solution:
    def generatePossibleNextMoves(self, currentState: str) -> List[str]:
        n = len(currentState)
        res = list()

        for i in range(n - 1):
            if currentState[i] == '+' and currentState[i + 1] == '+':
                flip = currentState[:i] + '--' + currentState[i+2:]
                res.append(flip)

        return res
```
