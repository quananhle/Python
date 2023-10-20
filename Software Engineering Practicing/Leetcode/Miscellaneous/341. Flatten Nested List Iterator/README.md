## [341. Flatten Nested List Iterator](https://leetcode.com/problems/flatten-nested-list-iterator)

```Tag```: ```Design``` ```Array & String``` ```Recursion```

#### Difficulty: Medium

You are given a nested list of integers ```nestedList```. Each element is either an integer or a list whose elements may also be integers or other lists. Implement an iterator to flatten it.

Implement the ```NestedIterator``` class:

- ```NestedIterator(List<NestedInteger> nestedList)```: Initializes the iterator with the nested list ```nestedList```.
- ```int next()```: Returns the next integer in the nested list.
- ```boolean hasNext()```: Returns ```True``` if there are still some integers in the nested list and ```False``` otherwise.

Your code will be tested with the following pseudocode:

```
initialize iterator with nestedList
res = []
while iterator.hasNext()
    append iterator.next() to the end of res
return res
```

If ```res``` matches the expected flattened list, then your code will be judged as correct.

![image](https://github.com/quananhle/Python/assets/35042430/04580604-1aac-40ad-951d-28de1d2cf607)

---

__Example 1__:
```
Input: nestedList = [[1,1],2,[1,1]]
Output: [1,1,2,1,1]
Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,1,2,1,1].
```

__Example 2__:
```
Input: nestedList = [1,[4,[6]]]
Output: [1,4,6]
Explanation: By calling next repeatedly until hasNext returns false, the order of elements returned by next should be: [1,4,6].
```

__Constraints__:

- $1 \le nestedList.length \le 500$
- The values of the integers in the nested list is in the range $[-10^6, 10^6]$.

---

### Recursion

```Python
# """
# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
# """
#class NestedInteger:
#    def isInteger(self) -> bool:
#        """
#        @return True if this NestedInteger holds a single integer, rather than a nested list.
#        """
#
#    def getInteger(self) -> int:
#        """
#        @return the single integer that this NestedInteger holds, if it holds a single integer
#        Return None if this NestedInteger holds a nested list
#        """
#
#    def getList(self) -> [NestedInteger]:
#        """
#        @return the nested list that this NestedInteger holds, if it holds a nested list
#        Return None if this NestedInteger holds a single integer
#        """

class NestedIterator:
    def __init__(self, nestedList: [NestedInteger]):
        def flatten_list(nested_list):

            for elem in nested_list:
                if elem.isInteger():
                    self.list.append(elem.getInteger())
                else:
                    flatten_list(elem.getList())
        self.list = list()
        self.curr = -1
        flatten_list(nestedList)
        self.size = len(self.list)
    
    def next(self) -> int:
        self.curr += 1
        return self.list[self.curr]

    def hasNext(self) -> bool:
        return self.curr + 1 < self.size

# Your NestedIterator object will be instantiated and called as such:
# i, v = NestedIterator(nestedList), []
# while i.hasNext(): v.append(i.next())
```

### Using Generator

```Python
# """
# This is the interface that allows for creating nested lists.
# You should not implement it, or speculate about its implementation
# """
#class NestedInteger:
#    def isInteger(self) -> bool:
#        """
#        @return True if this NestedInteger holds a single integer, rather than a nested list.
#        """
#
#    def getInteger(self) -> int:
#        """
#        @return the single integer that this NestedInteger holds, if it holds a single integer
#        Return None if this NestedInteger holds a nested list
#        """
#
#    def getList(self) -> [NestedInteger]:
#        """
#        @return the nested list that this NestedInteger holds, if it holds a nested list
#        Return None if this NestedInteger holds a single integer
#        """

class NestedIterator:
    def __init__(self, nestedList: [NestedInteger]):
        self.flattened_list = list()
        
        def flatten(nested_list):
            for elem in nested_list:
                if elem.isInteger():
                    yield elem.getInteger()
                else:
                    yield from flatten(elem.getList())

        for num in flatten(nestedList):
            self.flattened_list.append(num)
        self.curr = 0
    
    def next(self) -> int:
        val = self.flattened_list[self.curr]
        self.curr += 1
        return val

    def hasNext(self) -> bool:
        return self.curr < len(self.flattened_list) 

# Your NestedIterator object will be instantiated and called as such:
# i, v = NestedIterator(nestedList), []
# while i.hasNext(): v.append(i.next())
```
