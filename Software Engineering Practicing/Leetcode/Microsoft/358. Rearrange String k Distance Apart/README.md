  ## [358. Rearrange String k Distance Apart](https://leetcode.com/problems/rearrange-string-k-distance-apart/)

```Tag```: ```Priority Queue``` ```Greedy```

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

__Algorithm__

1. Create a map ```h``` from character to integer (or integer to integer by converting char to ASCII values). This map will store the frequency of each character in the string ```S```.
2. Create a max heap/priority queue ```h```; this queue will have all the characters that can be placed next, with the character having the highest frequency at the top.
3. Initialize an empty queue ```busy```, which will store the characters that cannot be used as they have been used within previous ```K``` indices.
4. Do the following until the length of string ```res``` becomes equal to the length of ```S```:

   a. Check if the size of ```busy``` is ```K```; if yes, remove it from the front of the queue and add the element back to ```h```.

   b. If ```h``` is empty, there is no available character to place, and the task is impossible. Return an empty string.

   c. Remove the top character from the heap and append it to ```res```. Decrement its frequency in ```h```. If the frequency is not zero, insert it into the ```busy```.

6. Return ```res```.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}((N + K) \log K)$
- __Space Complexity__: $\mathcal{O}(K)$

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

### Greedy

```Python
class Solution:
    def rearrangeString(self, s: str, k: int) -> str:
        n = len(s)
        if not k:
            return s
        
        counter = collections.Counter(s)
        max_frequency = max(counter.values())
        max_count = sum(1 for val in counter.values() if val == max_frequency)

        if (max_frequency - 1) * k + max_count > len(s):
            return ""
        
        res = list(s)
        i = (n - 1) % k
        for c in sorted(counter, key=lambda i: -counter[i]):
            for j in range(counter[c]):
                res[i] = c
                i += k
                if i >= n:
                    i = (i - 1) % k
        
        return "".join(res)
```
