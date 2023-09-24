## [496. Next Greater Element I](https://leetcode.com/problems/next-greater-element-i)

```Tag```: ```Monotonic Stack``` ```Hash Map``` ```Queue```

#### Difficulty: Easy

The __next greater element__ of some element ```x``` in an array is the __first greater__ element that is __to the right__ of ```x``` in the same array.

You are given two __distinct 0-indexed__ integer arrays ```nums1``` and ```nums2```, where ```nums1``` is a subset of ```nums2```.

For each ```0 <= i < nums1.length```, find the index ```j``` such that ```nums1[i] == nums2[j]``` and determine the next greater element of ```nums2[j]``` in ```nums2```. If there is no next greater element, then the answer for this query is ```-1```.

Return _an array ans of length ```nums1.length``` such that ```ans[i]``` is the next greater element as described above_. 

![image](https://github.com/quananhle/Python/assets/35042430/361a5b6c-a08a-4e8b-ada0-b479bda1a992)

---

__Example 1:__
```
Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
Output: [-1,3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
- 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
- 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
```

__Example 2:__
```
Input: nums1 = [2,4], nums2 = [1,2,3,4]
Output: [3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 2 is underlined in nums2 = [1,2,3,4]. The next greater element is 3.
- 4 is underlined in nums2 = [1,2,3,4]. There is no next greater element, so the answer is -1.
```

__Constraints:__

- $1 \le nums1.length \le nums2.length \le 1000$
- $0 \le nums1[i], nums2[i] \le 10^{4}$
- All integers in ```nums1``` and ```nums2``` are unique.
- All the integers of ```nums1``` also appear in ```nums2```.

---

### Brute Force

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n)$.
- __Space Complexity__: $\mathcal{O}(1)$.

```Python
class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        m, n = len(nums1), len(nums2)
        res = list()
        for i, num in enumerate(nums1):
            for j in range(n):
                if num == nums2[j]:
                    for k in range(j, n):
                        if num < nums2[k]:
                            res.append(nums2[k])
                            break
                        if k == n - 1:
                            res.append(-1)
        
        return res
```

#### Better Brute Force using Hash Map

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n)$.
- __Space Complexity__: $\mathcal{O}(1)$.

```Python
class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        m, n = len(nums1), len(nums2)
        memo = collections.defaultdict(int)
        for i, num in enumerate(nums2):
            memo[num] = i                   # Only work in distinct integer array

        res = list()
        for i, num in enumerate(nums1):
            for j in range(memo[num], n):   # nums1 is a subset of nums2 -> num is guaranteed to be in nums2
                if num < nums2[j]:
                    res.append(nums2[j])
                    break
                if j == n - 1:
                    res.append(-1)
        
        return res
```

__Follow up__: Could you find an ```O(nums1.length + nums2.length)``` solution?

### Monotonic Stack

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$.
- __Space Complexity__: $\mathcal{O}(n)$.

```Python
class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        stack = list()
        memo = collections.defaultdict(int)
        m, n = len(nums1), len(nums2)
        res = list()

        # Iterate over the nums2 array
        for i in range(n):
            # While stack is not empty and the current element in nums2 is greater than top element in stack
            while stack and nums2[i] > stack[-1]:
                # Next greater element found, record in the map
                memo[stack.pop()] = nums2[i]
            stack.append(nums2[i])

        # If stack is not empty, no greater element found the the rest of elements in stack
        while stack:
            memo[stack.pop()] = - 1

        for i in range(m):
            res.append(memo[nums1[i]])
        
        return res
```


### Queue

```Python
class Solution:
    def nextGreaterElement(self, nums1: List[int], nums2: List[int]) -> List[int]:
        m, n = len(nums1), len(nums2)
        queue = collections.deque()
        res = [-1] * m
        memo = {val:idx for idx, val in enumerate(nums1)}

        for num2 in nums2:
            while queue and queue[0] < num2:
                num = queue.popleft()
                if num in memo:
                    res[memo[num]] = num2
            else:
                queue.appendleft(num2)
        
        return res
```
