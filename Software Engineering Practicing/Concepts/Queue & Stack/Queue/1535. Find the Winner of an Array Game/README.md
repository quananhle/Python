## [1535. Find the Winner of an Array Game](https://leetcode.com/problems/find-the-winner-of-an-array-game)

```Tag```: ```Array & String``` ```Stack & Queue```

#### Difficulty: Medium

Given an integer array ```arr``` of distinct integers and an integer ```k```.

A game will be played between the first two elements of the array (i.e. ```arr[0]``` and ```arr[1]```). In each round of the game, we compare ```arr[0]``` with ```arr[1]```, the larger integer wins and remains at position ```0```, and the smaller integer moves to the end of the array. The game ends when an integer wins ```k``` consecutive rounds.

Return _the integer which will win the game_.

It is guaranteed that there will be a winner of the game.

---

__Example 1:__
```
Input: arr = [2,1,3,5,4,6,7], k = 2
Output: 5
Explanation: Let's see the rounds of the game:
Round |       arr       | winner | win_count
  1   | [2,1,3,5,4,6,7] | 2      | 1
  2   | [2,3,5,4,6,7,1] | 3      | 1
  3   | [3,5,4,6,7,1,2] | 5      | 1
  4   | [5,4,6,7,1,2,3] | 5      | 2
So we can see that 4 rounds will be played and 5 is the winner because it wins 2 consecutive games.
```

__Example 2:__
```
Input: arr = [3,2,1], k = 10
Output: 3
Explanation: 3 will win the first 10 rounds consecutively.
```

__Constraints:__

- $2 \le arr.length \le 10^5$
- $1 \le arr[i] \le 10^6$
- ```arr``` contains distinct integers.
- $1 \le k \le 10^9$

---

If we examine the constraints, we find that ```k``` can be up to 1 billion! If we tried to simulate a billion rounds, we would exceed the time limit. How do we solve this?

We can make another observation: let the player with the largest value in ```arr``` be ```max_element```. Since the elements in the array are all unique, this player will never lose a round, so if the current player ever becomes ```max_element```, it will surely end up winning so many games as long as the simulation continues, no matter how large the required ```k``` is. Thus, if ```curr = max_element```, we can immediately return ```curr``` without actually simulating all the games, because we know that all future games will result in ```curr``` winning!

### Queue

```Python
class Solution:
    def getWinner(self, arr: List[int], k: int) -> int:
        max_element = max(arr)
        queue = collections.deque(arr[1:])
        curr = arr[0]
        win_streak = 0

        while queue:
            opponent = queue.popleft()
            if curr < opponent:
                queue.append(curr)
                curr = opponent
                win_streak = 1
            else:
                queue.append(opponent)
                win_streak += 1
            
            if win_streak == k or curr == max_element:
                return curr
```

### Array & String

If no player can win before seeing the max player, max player will always be a winner, any player that comes after the max player does not matter.

```Python

```
