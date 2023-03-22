## [716. Max Stack](https://leetcode.com/problems/max-stack/)

```Tag```: ```Stack``` ```Linked List``` ```Heap```

#### Difficulty: Hard

Design a max stack data structure that supports the stack operations and supports finding the stack's maximum element.

Implement the ```MaxStack``` class:

- ```MaxStack()``` Initializes the stack object.
- ```void push(int x)``` Pushes element x onto the stack.
- ```int pop()``` Removes the element on top of the stack and returns it.
- ```int top()``` Gets the element on the top of the stack without removing it.
- ```int peekMax()``` Retrieves the maximum element in the stack without removing it.
- ```int popMax()``` Retrieves the maximum element in the stack and removes it. If there is more than one maximum element, only remove the top-most one.

You must come up with a solution that supports ```O(1)``` for each ```top``` call and ```O(logn)``` for each other call.

![image](https://user-images.githubusercontent.com/35042430/226754345-c1c63fe3-c72f-46b2-8b94-59d154750197.png)

---

__Example 1:__
```
Input
["MaxStack", "push", "push", "push", "top", "popMax", "top", "peekMax", "pop", "top"]
[[], [5], [1], [5], [], [], [], [], [], []]
Output
[null, null, null, null, 5, 5, 1, 5, 1, 5]

Explanation
MaxStack stk = new MaxStack();
stk.push(5);   // [5] the top of the stack and the maximum number is 5.
stk.push(1);   // [5, 1] the top of the stack is 1, but the maximum is 5.
stk.push(5);   // [5, 1, 5] the top of the stack is 5, which is also the maximum, because it is the top most one.
stk.top();     // return 5, [5, 1, 5] the stack did not change.
stk.popMax();  // return 5, [5, 1] the stack is changed now, and the top is different from the max.
stk.top();     // return 1, [5, 1] the stack did not change.
stk.peekMax(); // return 5, [5, 1] the stack did not change.
stk.pop();     // return 1, [5] the top of the stack and the max element is now 5.
stk.top();     // return 5, [5] the stack did not change.
```

__Constraints:__

- -10<sup>7</sup> <= ```x``` <= 10<sup>7</sup>
- At most 10<sup>5</sup> calls will be made to ```push```, ```pop```, ```top```, ```peekMax```, and ```popMax```.
- There will be at least one element in the stack when ```pop```, ```top```, ```peekMax```, or ```popMax``` is called.

---

### Two Stacks

```Python
class MaxStack:
    ### Time Limit Exceeded
    def __init__(self):
        self.stack = list()
        self.value = list()
        self.count = 0

    def push(self, x: int) -> None:
        self.stack.append((self.count, x))
        self.value.append((x, self.count))
        self.stack.sort(key=lambda x:x[0])
        self.value.sort(key=lambda x:x[0])
        self.count += 1

    def pop(self) -> int:
        idx, val = self.stack.pop()
        self.value.remove((val, idx))
        return val

    def top(self) -> int:
        return self.stack[-1][1]

    def peekMax(self) -> int:
        return self.value[-1][0]

    def popMax(self) -> int:
        val, idx = self.value.pop()
        self.stack.remove((idx, val))
        return val


# Your MaxStack object will be instantiated and called as such:
# obj = MaxStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.peekMax()
# param_5 = obj.popMax()
```

### Sorted List

```Python
["MaxStack", "push", "push", "push", "top", "popMax", "top", "peekMax", "pop", "top"]
[[], [5], [1], [5], [], [], [], [], [], []]
```

After the first three ```push``` calls, our ```stack``` and ```value``` are sorted as:

```Python
stack = [(id:0, val:5), (id:1, val:1), (id:2, val:5)]
value = [(id:1, val:1), (id:0, val:5), (id:2, val:5)]
```

Then, ```top``` returns the last element in ```stack```, whose value is 5;

```popMax``` is about to remove the last element in value, ```(id:2, val:5)```, in both ```stack``` and ```value```. So after ```popMax``` returns ```5```, the two balanced trees are:

```Python
stack = [(id:0, val:5), (id:1, val:1)]
values = [(id:1, val:1), (id:0, val:5)]
```

Then, ```top``` returns the last element in ```stack```, whose value is ```1```; Similar, the following ```peekMax``` returns the last element in ```value```, whose value is ```5```.

After ```pop``` is called, we remove ```(id:1, val:1)``` and return the value ```5```, so:

```Python
stack = [(id:0, val:5)]
values = [(id:0, val:5)]
```

Finally, the last call of ```top``` gives the only element ```(id:0, val:5)```, whose value is ```5```.

```Python
from sortedcontainers import SortedList
class MaxStack:

    def __init__(self):
        self.stack = SortedList()
        self.value = SortedList()
        self.count = 0

    def push(self, x: int) -> None:         # O(logN)
        self.stack.add((self.count, x))
        self.value.add((x, self.count))
        self.count += 1

    def pop(self) -> int:                   # O(logN)
        idx, val = self.stack.pop()
        self.value.remove((val, idx))
        return val

    def top(self) -> int:                   # O(1)
        return self.stack[-1][1]

    def peekMax(self) -> int:               # O(1)
        return self.value[-1][0]

    def popMax(self) -> int:                # O(logN)
        val, idx = self.value.pop()
        self.stack.remove((idx, val))
        return val


# Your MaxStack object will be instantiated and called as such:
# obj = MaxStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.peekMax()
# param_5 = obj.popMax()
```
