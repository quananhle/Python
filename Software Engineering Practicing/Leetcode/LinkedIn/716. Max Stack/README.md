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
stack = [(idx:0, val:5), (idx:1, val:1), (idx:2, val:5)]
value = [(val:1, idx:1), (val:5, idx:0), (val:5, idx:2)]
```

Then, ```top``` returns the last element in ```stack```, whose value is 5;

```popMax``` is about to remove the last element in value, ```(val:5, idx:2)```, in both ```stack``` and ```value```. So after ```popMax``` returns ```5```, the two balanced trees are:

```Python
stack = [(idx:0, val:5), (idx:1, val:1)]
value = [(val:1, idx:1), (val:5, idx:0)]
```

Then, ```top``` returns the last element in ```stack```, whose value is ```1```; Similar, the following ```peekMax``` returns the last element in ```value```, whose value is ```5```.

After ```pop``` is called, we remove ```(idx:1, val:1)``` and return the value ```5```, so:

```Python
stack = [(idx:0, val:5)]
value = [(val:5, idx:0)]
```

Finally, the last call of ```top``` gives the only element ```(idx:0, val:5)```, whose value is ```5```.

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

### Heap

```Python
["MaxStack", "push", "push", "push", "top", "popMax", "top", "peekMax", "pop", "top"]
[[], [5], [1], [5], [], [], [], [], [], []]
```

After the first three ```push``` calls, our ```stack``` and ```value``` are sorted as:

```Python
stack = [(idx: 0, val: 5), (idx: 1, val: 1), (idx: 2, val: 5)]
heapp = [(val:-5, idx:-2), (val:-5, idx:-0), (val:-1, idx:-1)]
```

Whenever we are requested to operate on ```stack``` or ```heap``` (i.e., ```top```, ```pop```, ```peekMax``` and ```popMax```), we first check the ```ID``` of its top element, if is turns out to be an ```ID``` in ```removed```, that is, it was removed previously, we need to __remove the current top element until its ID is not in__ ```removed``` to make sure the top still exists. After that,

- For ```top```, return the value of the top element in ```stack```.
- For ```peekMax```, return the value of the top element in ```heap```.
- For ```pop```, remove the top element of ```stack```, put its ID into ```removed```, and return _its value_.
- For ```popMax```, remove the top element of ```heap```, put its ID into ```removed```, and return _its value_.

```Python
class MaxStack:

    def __init__(self):
        self.h = list()
        self.idx = 0
        self.stack = list()
        self.removed = set()

    def push(self, x: int) -> None:         # O(logN)
        heapq.heappush(self.h, (-x, -self.idx))
        self.stack.append((x, self.idx))
        self.idx += 1

    def pop(self) -> int:                   # O(logN)
        while self.stack and self.stack[-1][1] in self.removed:
            self.stack.pop()
        num, idx = self.stack.pop()
        self.removed.add(idx)
        return num

    def top(self) -> int:                   # O(logN)
        while self.stack and self.stack[-1][1] in self.removed:
            self.stack.pop()
        return self.stack[-1][0]

    def popMax(self) -> int:                # O(logN)
        while self.h and -self.h[0][1] in self.removed:
            heapq.heappop(self.h)
        num, idx = heapq.heappop(self.h)
        self.removed.add(-idx)
        return -num

    def peekMax(self) -> int:               # O(logN)
        while self.h and -self.h[0][1] in self.removed:
            heapq.heappop(self.h)
        return -self.h[0][0]

# Your MaxStack object will be instantiated and called as such:
# obj = MaxStack()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.peekMax()
# param_5 = obj.popMax()
```
