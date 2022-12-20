## 752. Open the Lock

```Tag```: ```Queue``` ```Dynamic Programming```

#### Difficulty: Medium

You have a lock in front of you with 4 circular wheels. Each wheel has 10 slots: ```'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'```. The wheels can rotate freely and wrap around: for example we can turn ```'9'``` to be ```'0'```, or ```'0'``` to be ```'9'```. Each move consists of turning one wheel one slot.

The lock initially starts at ```'0000'```, a string representing the state of the 4 wheels.

You are given a list of ```deadends``` dead ends, meaning if the lock displays any of these codes, the wheels of the lock will stop turning and you will be unable to open it.

Given a ```target``` representing the value of the wheels that will unlock the lock, return the minimum total number of turns required to open the lock, or -1 if it is impossible.

![image](https://user-images.githubusercontent.com/35042430/208697574-8b43819a-6b1e-421a-b44c-f498a1b123f0.png)

---

__Example 1:__
```
Input: deadends = ["0201","0101","0102","1212","2002"], target = "0202"
Output: 6
Explanation: 
A sequence of valid moves would be "0000" -> "1000" -> "1100" -> "1200" -> "1201" -> "1202" -> "0202".
Note that a sequence like "0000" -> "0001" -> "0002" -> "0102" -> "0202" would be invalid,
because the wheels of the lock become stuck after the display becomes the dead end "0102".
```

__Example 2:__
```
Input: deadends = ["8888"], target = "0009"
Output: 1
Explanation: We can turn the last wheel in reverse to move from "0000" -> "0009".
```

__Example 3:__
```
Input: deadends = ["8887","8889","8878","8898","8788","8988","7888","9888"], target = "8888"
Output: -1
Explanation: We cannot reach the target without getting stuck.
```

__Constraints:__
```
1 <= deadends.length <= 500
deadends[i].length == 4
target.length == 4
target will not be in the list deadends.
target and deadends[i] consist of digits only.
```

---

### Breadth-First Search

```Python
class Solution:
    def openLock(self, deadends: List[str], target: str) -> int:
        if "0000" in deadends:
            return -1

        DIRECTIONS = [(1), (-1)]
        queue = collections.deque()
        queue.append(["0000", 0])   # [lock combinations, turns]
        # deadend and visited share the same properties so can be united
        visited = set(deadends)

        def children(lock):
            res = list()
            # For each wheel in 4 wheel
            for n in range(4):
                # Either rotate the wheel forward or backward
                for d in DIRECTIONS:
                    # Rotate forward
                    if d > 0:
                        # E.g.: (1 + 1) % 10 = 2, (9 + 1) % 10 = 0
                        digit = str((int(lock[n]) + d) % 10)
                        # String is immutable so rebuild string
                        res.append(lock[:n] + digit + lock[n+1:])
                    # Rotate backward
                    else:
                        # E.g.: (1 - 1 + 10) % 10 = 0, (0 - 1 + 10) % 10 = 9
                        digit = str((int(lock[n]) + d + 10) % 10)
                        res.append(lock[:n] + digit + lock[n+1:])                 
            return res

        while queue:
            curr, turn = queue.popleft()
            if curr == target:
                return turn
            for child in children(curr):
                if not child in visited:
                    visited.add(child)
                    queue.append([child, turn + 1])
        return -1
```
