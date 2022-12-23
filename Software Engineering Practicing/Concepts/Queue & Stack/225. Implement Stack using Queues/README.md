## 225. Implement Stack using Queues

```Tag```: ```Stack```  ```Design```  ```Queue```

#### Difficulty: Easy

Implement a first in first out (FIFO) queue using only two stacks. The implemented queue should support all the functions of a normal queue (```push```, ```top```, ```pop```, and ```empty```).

Implement the ```MyQueue``` class:

- ```void push(int x)``` Pushes element x to the top of the stack.
- ```int pop()``` Removes the element on the top of the stack and returns it.
- ```int peek()``` Returns the element on the top of the stack.
- ```boolean empty()``` Returns ```true``` if the stack is empty, ```false``` otherwise.

__Notes:__

- You must use only standard operations of a stack, which means only ```push to back```, ```peek/pop from front```, ```size```, and ```is empty``` operations are valid.
- Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue) as long as you use only a queue's standard operations.
 
![image](https://user-images.githubusercontent.com/35042430/209283943-ed2b34c6-e021-4a39-8302-813ceea70073.png)

---

__Example 1:__
```
Input
["MyStack", "push", "push", "top", "pop", "empty"]
[[], [1], [2], [], [], []]
Output
[null, null, null, 2, 2, false]

Explanation
MyStack myStack = new MyStack();
myStack.push(1);
myStack.push(2);
myStack.top(); // return 2
myStack.pop(); // return 2
myStack.empty(); // return False
``` 

__Constraints:__
```
1 <= x <= 9
At most 100 calls will be made to push, pop, top, and empty.
All the calls to pop and top are valid.
```

__Follow-up:__ Can you implement the stack using only one queue?

---

