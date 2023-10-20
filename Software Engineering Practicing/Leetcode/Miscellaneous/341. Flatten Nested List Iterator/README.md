## [341. Flatten Nested List Iterator](https://leetcode.com/problems/flatten-nested-list-iterator)

```Tag```:

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
