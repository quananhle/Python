## [1207. Unique Number of Occurrences](https://leetcode.com/problems/unique-number-of-occurrences)

```Tag```: ```Hash Map``` ```Hash Set```

#### Difficulty: Easy

Given an array of integers ```arr```, return ```true``` _if the number of occurrences of each value in the array_ is __unique__ or ```false``` otherwise.

![image](https://github.com/quananhle/Python/assets/35042430/25ff1614-a4d5-4287-a351-dbb203ecad13)

---

__Example 1:__

```
Input: arr = [1,2,2,1,1,3]
Output: true
Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.
```

__Example 2:__

```
Input: arr = [1,2]
Output: false
```

__Example 3:__

```
Input: arr = [-3,0,1,-3,1,1,1,-3,10,0]
Output: true
```

__Constraints:__

- $1 \le arr.length \le 1000$
- $-1000 \le arr[i] \le 1000$

---

### Hash Map and Hash Set

```Python
class Solution(object):
    def uniqueOccurrences(self, arr):
        """
        :type arr: List[int]
        :rtype: bool
        """
        # Hash Map and Hash Set
        #### Time Complexity: O(N), traverse through the size of input arr
        #### Space Complexity: O(N), extra space required to build hash map
        counter = dict()
        for num in arr:
            counter[num] = 1 + counter.get(num, 0)
        return len(set(arr)) == len(set(counter.values()))
```

```Python
class Solution(object):
    def uniqueOccurrences(self, arr):
        """
        :type arr: List[int]
        :rtype: bool
        """
        # Hash Map and Hash Set
        #### Time Complexity: O(N), traverse through the size of input arr
        #### Space Complexity: O(N), extra space required to build hash map
        counter = dict()
        for num in arr:
            counter[num] = 1 + counter.get(num, 0)
        freq_set = set()
        for elem,freq in counter.items():
            freq_set.add(freq)
        return len(freq_set) == len(counter.values())
```

#### ```Counter()```

```Python
class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        counter = collections.Counter(arr)
        values = set(counter.values())

        return len(values) == len(counter.values())
```

#### One Liner

```Python
class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        return len(set(collections.Counter(arr).values())) == len(set(arr))
```
