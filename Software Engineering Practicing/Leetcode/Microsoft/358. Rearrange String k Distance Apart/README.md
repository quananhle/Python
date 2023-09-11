## [358. Rearrange String k Distance Apart](https://leetcode.com/problems/rearrange-string-k-distance-apart/)

```Tag```: ```Priority Queue```

#### Difficulty: Medium

Given a string ```s``` and an integer ```k```, rearrange ```s``` such that the same characters are at least distance ```k``` from each other. If it is not possible to rearrange the string, return an empty string ```""```.

![image](https://github.com/quananhle/Python/assets/35042430/fe61a43d-6106-49e8-8e90-b8bf73eaf46a)

---

__Example 1:__
```
Input: s = "aabbcc", k = 3
Output: "abcabc"
Explanation: The same letters are at least a distance of 3 from each other.
```

__Example 2:__
```
Input: s = "aaabc", k = 3
Output: ""
Explanation: It is not possible to rearrange the string.
```

__Example 3:__
```
Input: s = "aaadbbcc", k = 2
Output: "abacabcd"
Explanation: The same letters are at least a distance of 2 from each other.
```

__Constraints:__

- $1 \le s.length \le 3 * 10^{5}$
- ```s``` consists of only lowercase English letters.
- $0 \le k \le s.length$

---

### Priority Queue

```Python
class Solution:
    def rearrangeString(self, s: str, k: int) -> str:
        if k == 0:
            return s
        
        h = [(-freq, key) for key, freq in Counter(s).items()]
        heapq.heapify(h)
        queue = collections.deque()
        res = list()

        while h:
            freq, key = heapq.heappop(h)
            res.append(key)
            queue.append((freq + 1, key))

            if len(queue) < k:
                continue
            
            freq, key = queue.popleft()
            if freq < 0:
                heapq.heappush(h, (freq, key))
            
        
        while queue:
            freq, key = queue.popleft()
            if freq < 0:
                return ""
        
        return "".join(res)
```
