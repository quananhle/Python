## 651. 4 Keys Keyboard

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Imagine you have a special keyboard with the following keys:

- ```A```: Print one ```'A'``` on the screen.
- ```Ctrl-A```: Select the whole screen.
- ```Ctrl-C```: Copy selection to buffer.
- ```Ctrl-V```: Print buffer on screen appending it after what has already been printed.

Given an integer ```n```, return _the maximum number of ```'A'``` you can print on the screen with at most ```n``` presses on the keys_.

![image](https://github.com/quananhle/Python/assets/35042430/483d12c7-6cd8-4d26-b94e-83a616d014ec)

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

- $1 \le n \le 50$

---
