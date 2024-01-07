## [1051. Height Checker](https://leetcode.com/problems/height-checker)

```Tag```: ```Array``` ```Sort```

#### Difficulty: Easy

A school is trying to take an annual photo of all the students. The students are asked to stand in a single file line in __non-decreasing order__ by height. Let this ordering be represented by the integer array ```expected``` where ```expected[i]``` is the expected height of the i<sup>th</sup> student in line.

You are given an integer array ```heights``` representing the __current order__ that the students are standing in. Each ```heights[i]``` is the height of the i<sup>th</sup> student in line (__0-indexed__).

Return _the __number of indices__ where $heights[i] \neq expected[i]$_.

![image](https://user-images.githubusercontent.com/35042430/212827430-2807acb3-d7b8-482a-9798-38872ea9f4f4.png)

---

__Example 1:__
```
Input: heights = [1,1,4,2,1,3]
Output: 3
Explanation: 
heights:  [1,1,4,2,1,3]
expected: [1,1,1,2,3,4]
Indices 2, 4, and 5 do not match.
```

__Example 2:__
```
Input: heights = [5,1,2,3,4]
Output: 5
Explanation:
heights:  [5,1,2,3,4]
expected: [1,2,3,4,5]
All indices do not match.
```

__Example 3:__
```
Input: heights = [1,2,3,4,5]
Output: 0
Explanation:
heights:  [1,2,3,4,5]
expected: [1,2,3,4,5]
All indices match.
```

__Constraints:__

- $1 \le heights.length \le 100$
- $1 \le heights[i] \le 100$

---

### Sort

```Python
class Solution:
    def heightChecker(self, heights: List[int]) -> int:
        # Sorting
        #### Time Complexity : O(NlogN), sort operations take NlogN time
        #### Space Complexity: O(N), sort operations create a copy array
        '''
        count = 0
        sorted_heights = sorted(heights)
        for i in range(len(heights)):
            if sorted_heights[i] != heights[i]:
                count += 1
        return count
        '''
        count = 0
        sorted_heights = sorted(heights)
        for a, b in zip(heights, sorted_heights):
            if a != b:
                count += 1
        return count
```
