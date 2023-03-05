## [1345. Jump Game IV](https://leetcode.com/problems/jump-game-iv/)

```Tag```: ```Breadth-First Search```

#### Difficulty: Hard

Given an array of integers ```arr```, you are initially positioned at the first index of the array.

In one step you can jump from index ```i``` to index:

- ```i + 1``` where: ```i + 1 < arr.length```.
- ```i - 1``` where: ```i - 1 >= 0```.
- ```j``` where: ```arr[i] == arr[j]``` and ```i != j```.

Return _the minimum number of steps to reach the last index of the array_.

Notice that you can not jump outside of the array at any time.

![image](https://user-images.githubusercontent.com/35042430/222947239-a571eac0-ef57-40bc-aff9-e3fd18d67d86.png)

---

__Example 1:__
```
Input: arr = [100,-23,-23,404,100,23,23,23,3,404]
Output: 3
Explanation: You need three jumps from index 0 --> 4 --> 3 --> 9. Note that index 9 is the last index of the array.
```

__Example 2:__
```
Input: arr = [7]
Output: 0
Explanation: Start index is the last index. You do not need to jump.
```

__Example 3:__
```
Input: arr = [7,6,9,6,9,6,9,7]
Output: 1
Explanation: You can jump directly from index 0 to index 7 which is last index of the array.
```

__Constraints:__

- 1 <= ```arr.length``` <= 5 * 10<sup>4</sup>
- -10<sup>8</sup> <= ```arr[i]``` <= 10<sup>8</sup>

---

### Breadth-First Search

```Python
class Solution:
    def minJumps(self, arr: List[int]) -> int:
        # Breadth-First Search
        n = len(arr)
        if n <= 1:
            return 0
        
        graph = collections.defaultdict(list)
        for idx, num in enumerate(arr):
            graph[num].append(idx)
        
        queue = collections.deque([0])
        visited = {0}
        ans = 0

        while queue:
            level_size = len(queue)
            for _ in range(level_size):
                i = queue.popleft()
                
                if i == n - 1:
                    return ans
                
                j = graph[arr[i]]
                next, prev = i + 1, i - 1
                
                if 0 <= next < len(arr) and not next in visited:
                    visited.add(next)
                    queue.append(next)

                if 0 <= prev < len(arr) and not prev in visited:
                    visited.add(prev)
                    queue.append(prev)

                if j:
                    for neighbor in j:
                        if not neighbor in visited:
                            visited.add(neighbor)
                            queue.append(neighbor)
                    
                    # Clear cache after finishing exploring the current level to avoid revisit
                    del graph[arr[i]]
            
            ans += 1
        return -1
```

```Python
class Solution:
    def minJumps(self, arr: List[int]) -> int:
        # Breadth-First Search
        n = len(arr)
        if n <= 1:
            return 0
        
        graph = collections.defaultdict(list)
        for i in range(n):
            if arr[i] in graph:
                graph[arr[i]].append(i)
            else:
                graph[arr[i]] = [i]
            
        curr = [0]
        visited = set()
        visited.add(0)
        ans = 0

        while curr:
            next = list()

            for node in curr:
                # CHeck if strictly reached the last index
                if node == n - 1:
                    return ans

                # Check if arr[i] == arr[j]
                for neighbor in graph[arr[node]]:
                    if not neighbor in visited:
                        visited.add(neighbor)
                        next.append(neighbor)
                
                graph[arr[node]].clear()

                # i + 1 where: i + 1 < arr.length.
                # i - 1 where: i - 1 >= 0.
                for neighbor in [node - 1, node + 1]:
                    if not (0 <= neighbor < len(arr) and not neighbor in visited):
                        continue
                    visited.add(neighbor)
                    next.append(neighbor)
            
            curr = next
            ans += 1
        return -1
```
