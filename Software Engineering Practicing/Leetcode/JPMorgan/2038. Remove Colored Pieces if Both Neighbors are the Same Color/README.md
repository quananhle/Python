## [2038. Remove Colored Pieces if Both Neighbors are the Same Color](https://leetcode.com/problems/remove-colored-pieces-if-both-neighbors-are-the-same-color)

```Tag```: ```Dynamic Programming```

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
