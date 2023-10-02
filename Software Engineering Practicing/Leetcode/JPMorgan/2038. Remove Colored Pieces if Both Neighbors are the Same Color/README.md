## [2038. Remove Colored Pieces if Both Neighbors are the Same Color](https://leetcode.com/problems/remove-colored-pieces-if-both-neighbors-are-the-same-color)

```Tag```: ```Array & String```

#### Difficulty: Medium

There are ```n``` pieces arranged in a line, and each piece is colored either by ```'A'``` or by ```'B'```. You are given a string colors of length ```n``` where ```colors[i]``` is the color of the $i^{th}$ piece.

Alice and Bob are playing a game where they take alternating turns removing pieces from the line. In this game, Alice moves first.

- Alice is only allowed to remove a piece colored ```'A'``` if both its neighbors are also colored ```'A'```. She is not allowed to remove pieces that are colored ```'B'```.
- Bob is only allowed to remove a piece colored ```'B'``` if both its neighbors are also colored ```'B'```. He is not allowed to remove pieces that are colored ```'A'```.
- Alice and Bob cannot remove pieces from the edge of the line.
- If a player cannot make a move on their turn, that player loses and the other player wins.

Assuming Alice and Bob play optimally, return _```true``` if Alice wins, or return ```false``` if Bob wins_.

![image](https://github.com/quananhle/Python/assets/35042430/76c9e030-541d-422c-b563-e0f744916a76)

---

__Example 1:__
```
Input: colors = "AAABABB"
Output: true
Explanation:
AAABABB -> AABABB
Alice moves first.
She removes the second 'A' from the left since that is the only 'A' whose neighbors are both 'A'.

Now it's Bob's turn.
Bob cannot make a move on his turn since there are no 'B's whose neighbors are both 'B'.
Thus, Alice wins, so return true.
```

__Example 2:__
```
Input: colors = "AA"
Output: false
Explanation:
Alice has her turn first.
There are only two 'A's and both are on the edge of the line, so she cannot move on her turn.
Thus, Bob wins, so return false.
```

__Example 3:__
```
Input: colors = "ABBBBBBBAAA"
Output: false
Explanation:
ABBBBBBBAAA -> ABBBBBBBAA
Alice moves first.
Her only option is to remove the second to last 'A' from the right.

ABBBBBBBAA -> ABBBBBBAA
Next is Bob's turn.
He has many options for which 'B' piece to remove. He can pick any.

On Alice's second turn, she has no more pieces that she can remove.
Thus, Bob wins, so return false.
```

__Constraints:__

- $1 \le colors.length \le 10^{5}$
- ```colors``` consists of only the letters ```'A'``` and ```'B'```

---

### Count

__Intuition__

There are two very important things to notice about this game that will allow us to easily solve the problem:

1. When one player removes a letter, it will never create a new removal opportunity for the other player. For example, let's say you had ```"ABAA"```. If the ```"B"``` wasn't there, then Alice would have a new removal opportunity. However, the ```"B"``` can never be removed because of the rules of the game. This observation implies that at the start of the game, all moves are already available to both players.
2. The order in which the removals happen is irrelevant. This is a side effect of the previous observation. Let's say there was a section in the middle of the string ```"BAAAAAB"```. Alice has three removal choices here, ```"BA[A]AAAB"```, ```"BAA[A]AAB"```, and ```"BAAA[A]AB"```. However, her choice is irrelevant, because all three choices will result in ```"BAAAAB"```.

We can think of splitting the string into groups. A group consists of three or more of the same character. From observation 2, removals within a group can happen in any order. From observation 1, no two groups can ever "merge".

__Thus, the only thing that matters is the number of moves available to both players at the start of the game.__

The number of moves available to Alice is the number of times the substring ```"AAA"``` appears. Similarly, the number of moves available to Bob is the number of times the substring ```"BBB"``` appears.

As shown below, in the string ```"AAAAA"```, substring ```"AAA"``` appears ```3``` times, indicating ```3``` moves available for Alice.

![image](https://leetcode.com/problems/remove-colored-pieces-if-both-neighbors-are-the-same-color/Figures/2038/1.png)

We can simply iterate over the string and for each index ```i```, check if ```colors[i - 1] == colors[i] == colors[i + 1]```. If so, then we can increment either Alice or Bob's available moves.

Because Alice moves first, she must make at least one move more than Bob to win. That is, Alice wins if ```alice - bob >= 1```. For example, let's say Alice has 3 moves and Bob has 2 moves.

- Turn 1: Alice
- Turn 2: Bob
- Turn 3: Alice
- Turn 4: Bob
- Turn 5: Alice
- Turn 6: Bob has no moves left but it's his turn, Bob loses

__Algorithm__

1. Initialize ```alice = bob = 0```.
2. Iterate i from 1 to colors.length - 1.
  - If colors[i - 1] == colors[i] == colors[i + 1], increment Alice or Bob depending on what colors[i] is. If colors[i] is equal to "A", increment Alice, otherwise, increment Bob.
3. Return alice - bob >= 1

```Python
class Solution:
    def winnerOfGame(self, colors: str) -> bool:
        n = len(colors)
        if n < 3:
            return False

        Alice = Bob = 0

        for i in range(1, n - 1):
            if colors[i - 1] == colors[i] == colors[i + 1]:
                if colors[i] == 'A':
                    Alice += 1
                else:
                    Bob += 1
        
        return Alice - Bob >= 1
```
