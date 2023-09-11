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

Algorithm

Create a map freq from character to integer (or integer to integer by converting char to ASCII values). This map will store the frequency of each character in the string SSS.

Create a max heap/priority queue free; this queue will have all the characters that can be placed next, with the character having the highest frequency at the top.

Initialize an empty queue busy, which will store the characters that cannot be used as they have been used within previous KKK indices.

Do the following until the length of string ans becomes equal to the length of SSS:

Check if the size of busy is KKK; if yes, remove it from the front of the queue and add the element back to free.

If free is empty, there is no available character to place, and the task is impossible. Return an empty string.

Remove the top character from the heap and append it to ans. Decrement its frequency in freq. If the frequency is not zero, insert it into the busy.

Return ans.

__Complexity Analysis__

- __Time Complexity__: $\mathal{O}((N + K) \log K)$
- __Space Complexity__: $\mathal{O}(K)$

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
