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

### Stack of Value/ Minimum Pairs

![image](https://leetcode.com/problems/min-stack/Figures/155/stack_with_mins.png)

![image](https://leetcode.com/problems/min-stack/Figures/155/stack_with_mins_location.png)

Note for Python: Recall that index ```-1``` refers to the last item in in a list. i.e. ```self.stack[-1]``` in Python is equivalent to ```stack.peek()``` in Java and other languages.

```Python
class MinStack:

    def __init__(self):
        self.stack = list()

    def push(self, val: int) -> None:
        if not self.stack:
            self.stack.append((val, val))
        else:
            curr_min = self.stack[-1][1]
            self.stack.append((val, min(val, curr_min)))

    def pop(self) -> None:
        self.stack.pop()

    def top(self) -> int:
        return self.stack[-1][0]

    def getMin(self) -> int:
        return self.stack[-1][1]

# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()
```

### Two Stack

![image](https://leetcode.com/problems/min-stack/Figures/155/two_stacks.png)

```Python
class MinStack:

    def __init__(self):
        self.stack = list()
        self.min_stack = list()

    def push(self, val: int) -> None:
        self.stack.append(val)
        if not self.min_stack or val <= self.min_stack[-1]:
            self.min_stack.append(val)

    def pop(self) -> None:
        if self.min_stack[-1] == self.stack[-1]:
            self.min_stack.pop()
        self.stack.pop()

    def top(self) -> int:
        return self.stack[-1]

    def getMin(self) -> int:
        return self.min_stack[-1]

# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()
```

### Best of Both Worlds

![image](https://leetcode.com/problems/min-stack/Figures/155/improved_two_stacks.png)

```Python
class MinStack:

    def __init__(self):
        self.stack = list()
        self.min_stack = list()

    def push(self, val: int) -> None:
        self.stack.append(val)
        if not self.min_stack or val <= self.min_stack[-1][0]:
            self.min_stack.append([val, 1])
        elif val == self.min_stack[-1][0]:
            self.min_stack[-1][1] += 1

    def pop(self) -> None:
        if self.min_stack[-1][0] == self.stack[-1]:
            self.min_stack[-1][1] -= 1
        if self.min_stack[-1][1] == 0:
            self.min_stack.pop()
        self.stack.pop()

    def top(self) -> int:
        return self.stack[-1]

    def getMin(self) -> int:
        return self.min_stack[-1][0]

# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.getMin()
```
