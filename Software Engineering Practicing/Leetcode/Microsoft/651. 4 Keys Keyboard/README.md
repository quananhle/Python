## [651. 4 Keys Keyboard](https://leetcode.com/problems/4-keys-keyboard/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Imagine you have a special keyboard with the following keys:

- A: Print one ```'A'``` on the screen.
- Ctrl-A: Select the whole screen.
- Ctrl-C: Copy selection to buffer.
- Ctrl-V: Print buffer on screen appending it after what has already been printed.

Given an integer ```n```, return _the maximum number of ```'A'``` you can print on the screen with at most n presses on the keys_.

![image](https://user-images.githubusercontent.com/35042430/228407757-8953d1e5-7b8d-41c8-bf80-eca0368f87d6.png)

---

__Example 1:__
```
Input: n = 3
Output: 3
Explanation: We can at most get 3 A's on screen by pressing the following key sequence:
A, A, A
```

__Example 2:__
```
Input: n = 7
Output: 9
Explanation: We can at most get 9 A's on screen by pressing following key sequence:
A, A, A, Ctrl A, Ctrl C, Ctrl V, Ctrl V
```

__Constraints:__

- ```1 <= n <= 50```

---

###

#### Bottom-Up Dynamic Programming

```Python

```
