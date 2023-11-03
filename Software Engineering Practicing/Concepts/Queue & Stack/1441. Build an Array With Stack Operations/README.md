## [1441. Build an Array With Stack Operations](https://leetcode.com/problems/build-an-array-with-stack-operations)

```Tag```: ```Stack & Queue``` ```Two Pointers```

#### Difficulty: Medium

You are given an integer array ```target``` and an integer ```n```.

You have an empty stack with the two following operations:

- ```"Push"```: pushes an integer to the top of the stack.
- ```"Pop"```: removes the integer on the top of the stack.

You also have a stream of the integers in the range ```[1, n]```.

Use the two stack operations to make the numbers in the stack (from the bottom to the top) equal to target. You should follow the following rules:

- If the stream of the integers is not empty, pick the next integer from the stream and push it to the top of the stack.
- If the stack is not empty, pop the integer at the top of the stack.
- If, at any moment, the elements in the stack (from the bottom to the top) are equal to target, do not read new integers from the stream and do not do more operations on the stack.

Return _the stack operations needed to build ```target``` following the mentioned rules_. If there are multiple valid answers, return any of them.

---

__Example 1:__
```
Input: target = [1,3], n = 3
Output: ["Push","Push","Pop","Push"]
Explanation: Initially the stack s is empty. The last element is the top of the stack.
Read 1 from the stream and push it to the stack. s = [1].
Read 2 from the stream and push it to the stack. s = [1,2].
Pop the integer on the top of the stack. s = [1].
Read 3 from the stream and push it to the stack. s = [1,3].
```

__Example 2:__
```
Input: target = [1,2,3], n = 3
Output: ["Push","Push","Push"]
Explanation: Initially the stack s is empty. The last element is the top of the stack.
Read 1 from the stream and push it to the stack. s = [1].
Read 2 from the stream and push it to the stack. s = [1,2].
Read 3 from the stream and push it to the stack. s = [1,2,3].
```

__Example 3:__
```
Input: target = [1,2], n = 4
Output: ["Push","Push"]
Explanation: Initially the stack s is empty. The last element is the top of the stack.
Read 1 from the stream and push it to the stack. s = [1].
Read 2 from the stream and push it to the stack. s = [1,2].
Since the stack (from the bottom to the top) is equal to target, we stop the stack operations.
The answers that read integer 3 from the stream are not accepted.
```

__Constraints:__

- $1 \le target.length \le 100$
- $1 \le n \le 100$
- $1 \le target[i] \le n$
- ```target``` is strictly increasing.

---

### Two Pointers

```Python
class Solution:
    def buildArray(self, target: List[int], n: int) -> List[str]:
        res = list()
        i = 1

        for num in target:
            while i < n + 1 and i != num:
                i += 1
                res.extend(["Push", "Pop"])
            else:
                if i == n + 2:
                    break
                elif i == num:
                    res.append("Push")
            i += 1
        
        return res
```

```Python
class Solution:
    def buildArray(self, target: List[int], n: int) -> List[str]:
        res = list()
        i = 0

        for num in target:
            while i < num - 1:
                i += 1
                res.extend(["Push", "Pop"])

            res.append("Push")
            i += 1
        
        return res
```
