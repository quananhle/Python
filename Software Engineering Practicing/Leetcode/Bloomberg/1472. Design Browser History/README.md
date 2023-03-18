## [1472. Design Browser History](https://leetcode.com/problems/design-browser-history/)

```Tag```: ```Stack & Queue``` ```Design```

#### Difficulty: Medium

You have a browser of one tab where you start on the ```homepage``` and you can visit another ```url```, get back in the history number of ```steps``` or move forward in the history number of ```steps```.

Implement the ```BrowserHistory``` class:

- ```BrowserHistory(string homepage)``` Initializes the object with the ```homepage``` of the browser.
- ```void visit(string url)``` Visits ```url``` from the current page. It clears up all the forward history.
- ```string back(int steps)``` Move ```steps``` back in history. If you can only return ```x``` steps in the history and ```steps > x```, you will return only ```x``` steps. Return the current ```url``` after moving back in history at most ```steps```.
- ```string forward(int steps)``` Move ```steps``` forward in history. If you can only forward ```x``` steps in the history and ```steps > x```, you will forward only ```x``` steps. Return the current ```url``` after forwarding in history at most ```steps```.

![image](https://user-images.githubusercontent.com/35042430/226085923-a02e8161-d0f2-4c0b-b662-82bfee464d56.png)

---

__Example:__
```
Input:
["BrowserHistory","visit","visit","visit","back","back","forward","visit","forward","back","back"]
[["leetcode.com"],["google.com"],["facebook.com"],["youtube.com"],[1],[1],[1],["linkedin.com"],[2],[2],[7]]
Output:
[null,null,null,null,"facebook.com","google.com","facebook.com",null,"linkedin.com","google.com","leetcode.com"]

Explanation:
BrowserHistory browserHistory = new BrowserHistory("leetcode.com");
browserHistory.visit("google.com");       // You are in "leetcode.com". Visit "google.com"
browserHistory.visit("facebook.com");     // You are in "google.com". Visit "facebook.com"
browserHistory.visit("youtube.com");      // You are in "facebook.com". Visit "youtube.com"
browserHistory.back(1);                   // You are in "youtube.com", move back to "facebook.com" return "facebook.com"
browserHistory.back(1);                   // You are in "facebook.com", move back to "google.com" return "google.com"
browserHistory.forward(1);                // You are in "google.com", move forward to "facebook.com" return "facebook.com"
browserHistory.visit("linkedin.com");     // You are in "facebook.com". Visit "linkedin.com"
browserHistory.forward(2);                // You are in "linkedin.com", you cannot move forward any steps.
browserHistory.back(2);                   // You are in "linkedin.com", move back two steps to "facebook.com" then to "google.com". return "google.com"
browserHistory.back(7);                   // You are in "google.com", you can move back only one step to "leetcode.com". return "leetcode.com"
```

__Constraints:__

- ```1 <= homepage.length <= 20```
- ```1 <= url.length <= 20```
- ```1 <= steps <= 100```
- ```homepage``` and ```url``` consist of  '.' or lower case English letters.
- At most ```5000``` calls will be made to ```visit```, ```back```, and ```forward```.

---

### Two Stacks

__Algorithm__
1. Initialize variables:
- Two stacks of strings ```history``` and ```future```, to store the URLs.
- A string variable ```current```, to store the currently visited URL, which is initialized with the given ```homepage``` as it is the first visited URL.
2. Implementing ```visit(url)``` method:
- As we will visit a new URL ```url```, we will store ```current``` in the ```history``` stack, and
- make the given ```url``` as ```current```, and clear the ```future``` stack.
3. Implementing ```back(steps)``` method:
- We need to go back by step URLs.
- While there are elements in the ```history``` stack and we haven't popped step elements from it, we will push ```current``` in the ```future stack``` and pop the most recently visited URL from the ```history``` stack and mark it as ```current```.
- At the end, we return ```current```.
4. Implementing ```forward(steps)``` method:
- We need to go forward by step URLs.
- While there are elements in the ```future``` stack and we haven't popped step elements from it, we will push ```current``` in the ```history``` stack and pop the most recently visited URL from the ```future``` stack and mark it as ```current```.
- At the end, we return ```current```.

```Python
class BrowserHistory:
    def __init__(self, homepage: str):
        self.history = list()
        self.future = list()
        self.current = homepage

    def visit(self, url: str) -> None:
        self.history.append(self.current)
        self.current = url
        self.future = list()

    def back(self, steps: int) -> str:
        while steps and self.history:
            self.future.append(self.current)
            self.current = self.history.pop()
            steps -= 1
        return self.current

    def forward(self, steps: int) -> str:
        while steps and self.future:
            self.history.append(self.current)
            self.current = self.future.pop()
            steps -= 1
        return self.current

# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)
```

### Linked List

```Python
class ListNode:
    def __init__(self, url: str):
        self.data = url
        self.prev = None
        self.next = None

class BrowserHistory:

    def __init__(self, homepage: str):
        self.head = ListNode(homepage)
        self.curr = self.head

    def visit(self, url: str) -> None:
        '''
        tmp = self.curr
        self.curr.next = ListNode(url)
        self.curr = self.curr.next
        self.curr.prev = tmp
        '''
        new_node = ListNode(url)
        self.curr.next = new_node
        new_node.prev = self.curr
        self.curr = new_node

    def back(self, steps: int) -> str:
        while steps and self.curr.prev:
            self.curr = self.curr.prev
            steps -= 1
        return self.curr.data

    def forward(self, steps: int) -> str:
        while steps and self.curr.next:
            self.curr = self.curr.next
            steps -= 1
        return self.curr.data


# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)
```

### Dynamic Array

Just like a linked list, a dynamic array can also be used to simulate a stack-like behavior, and just like previous approach we can append elements at end and use pointer to traverse back and forth.

In our dynamic array we can insert as many elements (history links) as we like, we can keep a pointer to point to the current URL and instead of traversing back and forth (incrementing or decrementing pointer index) like on the linked list we can directly return the element at the respective index after making a jump of step elements in the left or right direction, thus implementing the "back" and "forward" operations in more optimized manner.

Whenever we go back we just move our current pointer, and if we visit a new URL we will insert the new element if we are at the end of the array, or overwrite the next element with the new URL if we are not at the end.
We will also need one additional pointer to mark the right boundary in our array as if we overwrite an element there is the possibility that more elements exist past that overwritten element but while doing forward operations we should not visit those old elements. In reality, we should have deleted those old elements but instead, we will use a pointer to stop iterating forward as this will help us to save the time used in deleting those old elements.

```Python
class BrowserHistory:

    def __init__(self, homepage: str):
        self.history = [homepage]
        self.curr = self.last = 0

    def visit(self, url: str) -> None:
        self.curr += 1
        if len(self.history) > self.curr:
            self.history[self.curr] = url
        else:
            self.history.append(url)
        self.last = self.curr

    def back(self, steps: int) -> str:
        self.curr = max(0, self.curr - steps)
        return self.history[self.curr]

    def forward(self, steps: int) -> str:
        self.curr = min(self.last, self.curr + steps)
        return self.history[self.curr]


# Your BrowserHistory object will be instantiated and called as such:
# obj = BrowserHistory(homepage)
# obj.visit(url)
# param_2 = obj.back(steps)
# param_3 = obj.forward(steps)
```

