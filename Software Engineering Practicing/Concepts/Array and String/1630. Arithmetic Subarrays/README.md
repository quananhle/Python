## [1630. Arithmetic Subarrays](https://leetcode.com/problems/arithmetic-subarrays)

```Tag```: ```Sorted List``` ```Sort``` ```Math```

#### Difficulty: Medium

A sequence of numbers is called arithmetic if it consists of at least two elements, and the difference between every two consecutive elements is the same. More formally, a sequence ```s``` is arithmetic if and only if ```s[i+1] - s[i] == s[1] - s[0]``` for all valid ```i```.

For example, these are arithmetic sequences:
```
1, 3, 5, 7, 9
7, 7, 7, 7
3, -1, -5, -9
```

The following sequence is not arithmetic:
```
1, 1, 2, 5, 7
```

You are given an array of ```n``` integers, ```nums```, and two arrays of ```m``` integers each, ```l``` and ```r```, representing the ```m``` range queries, where the $i^{th}$ query is the range ```[l[i], r[i]]```. All the arrays are __0-indexed__.

Return _a list of boolean elements answer, where ```answer[i]``` is ```True``` if the subarray ```nums[l[i]], nums[l[i]+1], ... , nums[r[i]]``` can be rearranged to form an arithmetic sequence, and ```False``` otherwise_.

![image](https://github.com/quananhle/Python/assets/35042430/1ac906d9-5de8-45bd-8117-85d4390bb0ff)

---

__Example 1:__
```
Input: nums = [4,6,5,9,3,7], l = [0,0,2], r = [2,3,5]
Output: [true,false,true]
Explanation:
In the 0th query, the subarray is [4,6,5]. This can be rearranged as [6,5,4], which is an arithmetic sequence.
In the 1st query, the subarray is [4,6,5,9]. This cannot be rearranged as an arithmetic sequence.
In the 2nd query, the subarray is [5,9,3,7]. This can be rearranged as [3,5,7,9], which is an arithmetic sequence.
```

__Example 2:__
```
Input: nums = [-12,-9,-3,-12,-6,15,20,-25,-20,-15,-10], l = [0,1,6,4,8,7], r = [4,4,9,7,9,10]
Output: [false,true,false,false,true,true]
```

__Constraints:__

- $n == nums.length$
- $m == l.length$
- $m == r.length$
- $2 \le n \le 500$
- $1 \le m \le 500$
- $0 \le l[i] \lt r[i] \lt n$
- $-10^5 \le nums[i] \le 10^5$

---

### Brute Force

#### ```SortedList()```

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n \cdot \log{}n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
from sortedcontainers import SortedList

class Solution:
    def checkArithmeticSubarrays(self, nums: List[int], l: List[int], r: List[int]) -> List[bool]:
        res = list()

        for i in range(len(l)):                                     # O(m)
            sorted_list = SortedList()
            for num in nums[l[i]:r[i] + 1]:                         # O(n)
                sorted_list.add(num)                                # O(log(n))
            
            if len(sorted_list) < 2:
                res.append(False)
                continue

            diff = sorted_list[1] - sorted_list[0]
            
            for i in range(2, len(sorted_list)):                    # O(n)
                if sorted_list[i] - sorted_list[i - 1] != diff:
                    res.append(False)
                    break
            else:
                res.append(True)


        return res
```

### Sort

![image](https://leetcode.com/problems/arithmetic-subarrays/Figures/1630/1.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n \cdot \log{}n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def checkArithmeticSubarrays(self, nums: List[int], l: List[int], r: List[int]) -> List[bool]:
        def check(arr):
            arr.sort()
            diff = arr[1] - arr[0]
            for i in range(2, len(arr)):
                if arr[i] - arr[i - 1] != diff:
                    return False
            return True

        res = list()
        for i in range(len(l)):
            arr = nums[l[i]:r[i] + 1][:]
            res.append(check(arr))

        return res
```

---

### Math

![image](https://leetcode.com/problems/arithmetic-subarrays/Figures/1630/3.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def checkArithmeticSubarrays(self, nums: List[int], l: List[int], r: List[int]) -> List[bool]:
        def check(arr):
            min_num = min(arr)
            max_num = max(arr)

            # Check if the differences are evenly divided
            if (max_num - min_num) % (len(arr) - 1) != 0:
                return False
            
            diff = (max_num - min_num) / (len(arr) - 1) != 0
            arr_set = set(arr)
            curr = min_num + diff

            while curr < max_element:
                if not curr in arr_set:
                    return False
                curr += diff
            
            return True


        res = list()
        for i in range(len(l)):
            arr = nums[l[i]:r[i] + 1][:]
            res.append(check(arr))

        return res
```
