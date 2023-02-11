## 2485. Find the Pivot Integer

```Tag```: ```Prefix Sum``` ```Dynamic Programming```

#### Difficulty: Easy

Given a positive integer ```n```, find the __pivot integer__ ```x``` such that:

- The sum of all elements between ```1``` and ```x``` inclusively equals the sum of all elements between ```x``` and ```n``` inclusively.

Return _the __pivot integer__ ```x```_. If no such integer exists, return ```-1```. It is guaranteed that there will be at most one pivot index for the given input.

![image](https://user-images.githubusercontent.com/35042430/218198561-2b06b830-04af-4872-be29-80b90e748638.png)

---

__Example 1:__
```
Input: n = 8
Output: 6
Explanation: 6 is the pivot integer since: 1 + 2 + 3 + 4 + 5 + 6 = 6 + 7 + 8 = 21.
```

__Example 2:__
```
Input: n = 1
Output: 1
Explanation: 1 is the pivot integer since: 1 = 1.
```

__Example 3:__
```
Input: n = 4
Output: -1
Explanation: It can be proved that no such integer exist.
```

__Constraints:__

- ```1 <= n <= 1000```

---

### Prefix Sum

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        total = 0
        prefix_sum = list()
        for num in range(n + 1):
            total += num
            prefix_sum.append(total)
        return (max(set([idx if num * 2 == total + idx else -1 for idx, num in enumerate(prefix_sum)])))
```

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        '''
        left_sum = right_sum
        left_sum + right_sum = total_sum + pivot
        '''
        total = 0
        for num in range(1, n+1):
            total += num
        left_sum = 0

        for num in range(1, n+1):
            left_sum += num
            if left_sum * 2 - num == total:
                return num
        return -1
```

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        total = 0
        prefix = list()
        for num in range(n + 1):
            total += num
            prefix.append(total)
        
        for idx, num in enumerate(prefix):
            if num * 2 - idx == prefix[-1]:
                return idx
        return -1
```

```Python
class Solution:
    def pivotInteger(self, n: int) -> int:
        nums = [num for num in range(1, n + 1)]
        memo = [sum(nums[:i]) for i in range(len(nums) + 1)]
        for idx, num in enumerate(memo):
            if num * 2 - idx == memo[-1]:
                return idx
        return -1  
```


