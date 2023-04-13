## [946. Validate Stack Sequences](https://leetcode.com/problems/validate-stack-sequences/)

```Tag```: ```Stack``` ```Greedy```

#### Difficulty: Medium

Given two integer arrays ```pushed``` and ```popped``` each with distinct values, return _```true``` if this could have been the result of a sequence of push and pop operations on an initially empty stack, or ```false``` otherwise_.

 ![image](https://user-images.githubusercontent.com/35042430/231628687-04d8cf19-13ac-4920-a0e5-b90112603a03.png)

---

__Example 1:__
```
Input: pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
Output: true
Explanation: We might do the following sequence:
push(1), push(2), push(3), push(4),
pop() -> 4,
push(5),
pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1
```

__Example 2:__
```
Input: pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
Output: false
Explanation: 1 cannot be popped before 2.
```

__Constraints:__

- ```1 <= pushed.length <= 1000```
- ```0 <= pushed[i] <= 1000```
- All the elements of ```pushed``` are unique.
- ```popped.length == pushed.length```
- ```popped``` is a permutation of ```pushed```.

---
