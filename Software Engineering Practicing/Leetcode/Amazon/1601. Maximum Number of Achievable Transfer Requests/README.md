## [1601. Maximum Number of Achievable Transfer Requests](https://leetcode.com/problems/maximum-number-of-achievable-transfer-requests/)

```Tag```: ```Backtracking``` ```Bitmasking``` ```Dynamic Programming``` ```Meet In The Middle```

#### Difficulty: Hard

We have ```n``` buildings numbered from ```0``` to ```n - 1```. Each building has a number of employees. It's transfer season, and some employees want to change the building they reside in.

You are given an array ```requests``` where ```requests[i] = [fromi, toi]``` represents an employee's request to transfer from building ```fromi``` to building ```toi```.

All buildings are full, so a list of requests is achievable only if for each building, the net change in employee transfers is zero. This means the number of employees leaving is equal to the number of employees moving in. For example if ```n = 3``` and two employees are leaving building ```0```, one is leaving building ```1```, and one is leaving building ```2```, there should be two employees moving to building ```0```, one employee moving to building ```1```, and one employee moving to building ```2```.

Return _the maximum number of achievable requests_.

![image](https://github.com/quananhle/Python/assets/35042430/7ce8b675-ceaf-44d9-98c9-66d3b9e3b478)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/09/10/move1.jpg)

```
Input: n = 5, requests = [[0,1],[1,0],[0,1],[1,2],[2,0],[3,4]]
Output: 5
Explantion: Let's see the requests:
From building 0 we have employees x and y and both want to move to building 1.
From building 1 we have employees a and b and they want to move to buildings 2 and 0 respectively.
From building 2 we have employee z and they want to move to building 0.
From building 3 we have employee c and they want to move to building 4.
From building 4 we don't have any requests.
We can achieve the requests of users x and b by swapping their places.
We can achieve the requests of users y, a and z by swapping the places in the 3 buildings.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/09/10/move2.jpg)
```
Input: n = 3, requests = [[0,0],[1,2],[2,1]]
Output: 3
Explantion: Let's see the requests:
From building 0 we have employee x and they want to stay in the same building 0.
From building 1 we have employee y and they want to move to building 2.
From building 2 we have employee z and they want to move to building 1.
We can achieve all the requests.
```

__Example 3:__
```
Input: n = 4, requests = [[0,3],[3,1],[1,2],[2,0]]
Output: 4
```

__Constraints:__

- ```1 <= n <= 20```
- ```1 <= requests.length <= 16```
- ```requests[i].length == 2```
- ```0 <= fromi, toi < n```

---

### Backtracking

__Algorithm__

1. Initialize ```ans``` to ```0```; this will store the maximum requests we can consider.
2. Initialize an array ```indegree``` of size ```N``` with all values as ```0```. This array will store the employee change ```count``` for each building.
3. Start the recursion with ```curr``` and ```count``` as ```0```. The ```count``` here is the number of requests we have considered in the current combination, for each building:
  - i. If we have iterated over all the requests, check if all values in ```indegree``` are zero. If yes, update the variable ```ans``` by comparing it to ```count```. If all values aren't zero, return.
  - ii. For the first option, when we consider this request, update the ```indegree``` for both the buildings the current request involves. And move on to the next request with count as ```count + 1```.
  - iii Revert the changes in ```indegree``` for the request at ```curr```; this is the backtracking step.
  - iv. For the second option, where we ignore the request, make the recursion call with the following index without changing the ```count```.
4. Return ```ans```.

![image](https://github.com/quananhle/Python/assets/35042430/59630813-5552-4367-99b5-9cad6cf6d2b6)

```Python
class Solution:
    def maximumRequests(self, n: int, requests: List[List[int]]) -> int:
        indegree = [0] * n

        ans = 0

        def dfs(curr, count):
            nonlocal ans

            # Base cases:
            if curr == len(requests):.
                # Check if all buildings have an in-degree of 0.
                for i in range(n):
                    if indegree[i] != 0:
                        return

                ans = max(ans, count)
                return
            
            # Consider this request, increment and decrement for the buildings involved.
            indegree[requests[curr][0]] -= 1
            indegree[requests[curr][1]] += 1

            # Move on to the next request and also increment the count of requests.
            dfs(curr + 1, count + 1)

            # Backtracking to the previous values to move back to the original state before the second recursion
            indegree[requests[curr][0]] += 1
            indegree[requests[curr][1]] -= 1

            # Ignore this request and move on to the next request without incrementing the count
            dfs(curr + 1, count)
        
        dfs(0, 0)
        return ans
```

### Bitmasking

![image](https://leetcode.com/problems/maximum-number-of-achievable-transfer-requests/Figures/1601/1601A.png)

```Python
class Solution:
    def maximumRequests(self, n: int, requests: List[List[int]]) -> int:
        m = len(requests)
        res = 0
        left = {}
        l, r = m // 2, m - m // 2

        for mask in range(1 << l):
            ctr = [0] * n
            x = 0
            for i in range(l):
                if mask & (1 << i):
                    ctr[requests[i][0]] -= 1
                    ctr[requests[i][1]] += 1
                    x += 1
            ctr = tuple(ctr)
            if x > left.get(ctr, float('-inf')):
                left[ctr] = x

        for mask in range(1 << r):
            ctr = [0] * n
            x = 0
            for i in range(r):
                if mask & (1 << i):
                    ctr[requests[l + i][0]] += 1
                    ctr[requests[l + i][1]] -= 1
                    x += 1
            ctr = tuple(ctr)
            res = max(res, left.get(ctr, float('-inf')) + x)

        return res
```
