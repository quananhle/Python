## [2610. Convert an Array Into a 2D Array With Conditions](https://leetcode.com/problems/convert-an-array-into-a-2d-array-with-conditions)

```Tag```: ```Array & String``` ```Hash Map```

#### Difficulty: Medium

You are given an integer array ```nums```. You need to create a 2D array from ```nums``` satisfying the following conditions:

- The 2D array should contain only the elements of the array ```nums```.
- Each row in the 2D array contains distinct integers.
- The number of rows in the 2D array should be minimal.

Return _the resulting array_. If there are multiple answers, return any of them.

Note that the 2D array can have a different number of elements on each row.

![image](https://github.com/quananhle/Python/assets/35042430/5e13931d-abd9-4dc8-99c3-40d790aea708)

---

__Example 1:__
```
Input: nums = [1,3,4,1,2,3,1]
Output: [[1,3,4,2],[1,3],[1]]
Explanation: We can create a 2D array that contains the following rows:
- 1,3,4,2
- 1,3
- 1
All elements of nums were used, and each row of the 2D array contains distinct integers, so it is a valid answer.
It can be shown that we cannot have less than 3 rows in a valid array.
```

__Example 2:__
```
Input: nums = [1,2,3,4]
Output: [[4,3,2,1]]
Explanation: All elements of the array are distinct, so we can keep all of them in the first row of the 2D array.
```

__Constraints:__

- $1 \le nums.length \le 200$
- $1 \le nums[i] \le nums.length$

---

### Hash Map

#### Frequency Counter

```Python
class Solution:
    def findMatrix(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        counter = collections.defaultdict(int)
        res = list()

        for num in nums:
            if counter[num] >= len(res):
                res.append([])
            res[counter[num]].append(num)
            counter[num] += 1
        
        return res
```

```Python
class Solution:
    def findMatrix(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        counter = [0] * (n + 1)
        res = list()

        for num in nums:
            if counter[num] >= len(res):
                res.append([])
            res[counter[num]].append(num)
            counter[num] += 1
        
        return res
```

#### ```Counter()```

```Python
class Solution:
    def findMatrix(self, nums: List[int]) -> List[List[int]]:
        '''
        Observations:
            - Number of rows = number of most frequent element
        '''
        counter = collections.Counter(nums)
        n = counter.most_common(1)[0][1]
        
        res = list()
        
        for i in range(n):
            curr = list()
            for key, freq in counter.items():
                if freq:
                    curr.append(key)
                    counter[key] -= 1
            res.append(curr)

        return res
```
