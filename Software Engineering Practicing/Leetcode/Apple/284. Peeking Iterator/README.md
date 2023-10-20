## [284. Peeking Iterator](https://leetcode.com/problems/peeking-iterator)

```Tag```: ```Design``` ```Array & String```

#### Difficulty: Medium

Design an iterator that supports the ```peek``` operation on an existing iterator in addition to the ```hasNext``` and the ```next``` operations.

Implement the ```PeekingIterator``` class:

- ```PeekingIterator(Iterator<int> nums)```: Initializes the object with the given integer iterator ```iterator```.
- ```int next()```: Returns the next element in the array and moves the pointer to the next element.
- ```boolean hasNext()``` Returns ```True``` if there are still elements in the array.
- ```int peek()```: Returns the next element in the array without moving the pointer.

Note: Each language may have a different implementation of the constructor and ```Iterator```, but they all support the ```int next()``` and ```boolean hasNext()``` functions.

![image](https://github.com/quananhle/Python/assets/35042430/f8f11e01-3758-4ab9-adad-8a184107b769)

---

__Example 1:__
```
Input
["PeekingIterator", "next", "peek", "next", "next", "hasNext"]
[[[1, 2, 3]], [], [], [], [], []]
Output
[null, 1, 2, 2, 3, false]

Explanation
PeekingIterator peekingIterator = new PeekingIterator([1, 2, 3]); // [1,2,3]
peekingIterator.next();    // return 1, the pointer moves to the next element [1,2,3].
peekingIterator.peek();    // return 2, the pointer does not move [1,2,3].
peekingIterator.next();    // return 2, the pointer moves to the next element [1,2,3]
peekingIterator.next();    // return 3, the pointer moves to the next element [1,2,3]
peekingIterator.hasNext(); // return False
```

__Constraints:__

- $1 \le nums.length \le 1000$
- $1 \le nums[i] \le 1000$
- All the calls to ```next``` and ```peek``` are valid.
- At most 1000 calls will be made to ```next```, ```hasNext```, and ```peek```.

---

```Python
# Below is the interface for Iterator, which is already defined for you.
#
# class Iterator:
#     def __init__(self, nums):
#         """
#         Initializes an iterator object to the beginning of a list.
#         :type nums: List[int]
#         """
#
#     def hasNext(self):
#         """
#         Returns true if the iteration has more elements.
#         :rtype: bool
#         """
#
#     def next(self):
#         """
#         Returns the next element in the iteration.
#         :rtype: int
#         """

class PeekingIterator:
    def __init__(self, iterator):               # O(1)
        """
        Initialize your data structure here.
        :type iterator: Iterator
        """
        self.iterator = iterator
        self.curr = 0

    def peek(self):                             # O(1)
        """
        Returns the next element in the iteration without advancing the iterator.
        :rtype: int
        """
        if self.curr == 0:
            if not self.iterator.hasNext():
                raise StopIteration()
            self.curr = self.iterator.next()
        return self.curr

    def next(self):                             # O(1)
        """
        :rtype: int
        """
        if self.curr:
            to_return = self.curr
            self.curr = 0
            return to_return
        
        if not self.iterator.hasNext():
            raise StopIteration()
        
        return self.iterator.next()
        
    def hasNext(self):                          # O(1)
        """
        :rtype: bool
        """
        if self.iterator.hasNext() or self.curr:
            return True
        return False

# Your PeekingIterator object will be instantiated and called as such:
# iter = PeekingIterator(Iterator(nums))
# while iter.hasNext():
#     val = iter.peek()   # Get the next element but not advance the iterator.
#     iter.next()         # Should return the same value as [val].
```

```Python
# Below is the interface for Iterator, which is already defined for you.
#
# class Iterator:
#     def __init__(self, nums):
#         """
#         Initializes an iterator object to the beginning of a list.
#         :type nums: List[int]
#         """
#
#     def hasNext(self):
#         """
#         Returns true if the iteration has more elements.
#         :rtype: bool
#         """
#
#     def next(self):
#         """
#         Returns the next element in the iteration.
#         :rtype: int
#         """

class PeekingIterator:
    def __init__(self, iterator):               # O(1)
        """
        Initialize your data structure here.
        :type iterator: Iterator
        """
        self._next = iterator.next()
        self._iterator = iterator

    def peek(self):                             # O(1)
        """
        Returns the next element in the iteration without advancing the iterator.
        :rtype: int
        """
        return self._next

    def next(self):                             # O(1)
        """
        :rtype: int
        """
        if not self._next:
            raise StopIteration()
        val = self._next
        self._next = None
        if self._iterator.hasNext():
            self._next = self._iterator.next()
        return val
    
    def hasNext(self):                          # O(1)
        """
        :rtype: bool
        """
        return self._next is not None

# Your PeekingIterator object will be instantiated and called as such:
# iter = PeekingIterator(Iterator(nums))
# while iter.hasNext():
#     val = iter.peek()   # Get the next element but not advance the iterator.
#     iter.next()         # Should return the same value as [val].
```
