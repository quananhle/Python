## [225. Implement Stack using Queues](https://leetcode.com/problems/implement-stack-using-queues)

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

---

### Two Queues

```Python
class MyStack:

    def __init__(self):
        self.q1 = collections.deque()
        self.q2 = collections.deque()
        self.t = 0


    def push(self, x: int) -> None:
        self.q1.append(x)
        self.t = x


    def pop(self) -> int:
        while len(self.q1) > 1:
            if len(self.q1) == 2:
                self.t = self.q1[0]
            top = self.q1.popleft()
            self.q2.append(top)
        
        output = self.q1.popleft()
        self.q1, self.q2 = self.q2, self.q1
        return output


    def top(self) -> int:
        return self.t


    def empty(self) -> bool:
        return len(self.q1) == 0        


# Your MyStack object will be instantiated and called as such:
# obj = MyStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()
```

__Follow-up:__ Can you implement the stack using only one queue?

### One Queue

```Python
class MyStack:

    def __init__(self):
        self.queue1 = collections.deque()

    def push(self, x: int) -> None:
        self.queue1.append(x)
        size = len(self.queue1)
        # The top element is stored at the front of the queue
        while size > 1:         # Check for every element except the last one
            # Deque the element and append back to queue
            self.queue1.append(self.queue1.popleft())
            size -= 1

    def pop(self) -> int:
        # The front elenent of the queue is the top element of the stack
        return self.queue1.popleft()

    def top(self) -> int:
        return self.queue1[0]

    def empty(self) -> bool:
        return len(self.queue1) == 0
        
# Your MyStack object will be instantiated and called as such:
# obj = MyStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()

```

