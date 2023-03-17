## [155. Min Stack](https://leetcode.com/problems/min-stack/)

```Tag```: ```Monotonic Stack```

#### Difficulty: Medium

Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

Implement the ```MinStack``` class:

- ```MinStack()``` initializes the stack object.
- ```void push(int val)``` pushes the element val onto the stack.
- ```void pop()``` removes the element on the top of the stack.
- ```int top()``` gets the top element of the stack.
- ```int getMin()``` retrieves the minimum element in the stack.

You must implement a solution with ```O(1)``` time complexity for each function.

![image](https://user-images.githubusercontent.com/35042430/225944941-189aab63-bdef-469c-895c-e46e20b1e890.png)

---

__Example 1:__

```
Input
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]

Output
[null,null,null,null,-3,null,0,-2]

Explanation
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin(); // return -3
minStack.pop();
minStack.top();    // return 0
minStack.getMin(); // return -2
```

__Constraints__:

- -2<sup>31</sup> <= ```val``` <= 2<sup>31 - 1</sup>
- Methods ```pop```, ```top``` and ```getMin``` operations will always be called on non-empty stacks.
- At most 3 * 10<sup>4</sup> calls will be made to ```push```, ```pop```, ```top```, and ```getMin```.

---
