## [451. Sort Characters By Frequency](https://leetcode.com/problems/sort-characters-by-frequency)

```Tag```: ```Hash Map``` ```Priority Queue```

#### Difficulty: Medium

Given a string ```s```, sort it in __decreasing order__ based on the __frequency__ of the characters. The __frequency__ of a character is the number of times it appears in the string.

Return the _sorted string_. If there are multiple answers, return _any_ of them.

![image](https://github.com/quananhle/Python/assets/35042430/bcd529b1-b1e0-4ffb-8bae-915cfd4271d6)

---

__Example 1:__
```
Input: s = "tree"
Output: "eert"
Explanation: 'e' appears twice while 'r' and 't' both appear once.
So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
```

__Example 2:__
```
Input: s = "cccaaa"
Output: "aaaccc"
Explanation: Both 'c' and 'a' appear three times, so both "cccaaa" and "aaaccc" are valid answers.
Note that "cacaca" is incorrect, as the same characters must be together.
```

__Example 3:__
```
Input: s = "Aabb"
Output: "bbAa"
Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
Note that 'A' and 'a' are treated as two different characters.
```

__Constraints:__

- $1 \le s.length \le 5 * 10^5$
- ```s``` consists of uppercase and lowercase English letters and digits.

---

### Hash Map & Priority Queue

#### Complexity Analysis

- __Time Complexity__: $\mathcal{O}(N \cdot \log{}N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def frequencySort(self, s: str) -> str:
        h = list()
        res = list()

        counter = collections.defaultdict(int)
        for c in s:
            counter[c] = 1 + counter.get(c, 0)
        
        for key, val in counter.items():
            heapq.heappush(h, (-val, key))
        
        while h:
            n, c = heapq.heappop(h)
            res.extend([c * (-n)])

        return "".join(res)
```

```Python
class Solution:
    def frequencySort(self, s: str) -> str:
        # Priority Queue with Heap
        
        # Using reverse sliding
        counter = collections.Counter(s)
        priority_queue = list()
        for char, freq in counter.items():
            heapq.heappush(priority_queue, (freq, char))
        res = list()
        for _ in range(len(priority_queue)):
            freq, char = heapq.heappop(priority_queue)
            res += freq*char
        return res[::-1]
```

```Python
class Solution:
    def frequencySort(self, s: str) -> str:
        # Priority Queue with Heap

        # Using negative frequencies
        counter = collections.Counter(s)
        priority_queue = list()
        for char, freq in counter.items():
            heapq.heappush(priority_queue, (-freq, char))
        res = list()
        for _ in range(len(priority_queue)):
            freq, char = heapq.heappop(priority_queue)
            res += (-freq)*char
        return res

```

### Hash Map & Sort

![image](https://leetcode.com/problems/sort-characters-by-frequency/Figures/451/hashmap.png)

![image](https://leetcode.com/problems/sort-characters-by-frequency/Figures/451/hashmap_sorted.png)

#### Complexity Analysis

- __Time Complexity__: $\mathcal{O}(N \cdot \log{}N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution(object):
    def frequencySort(self, s):
        """
        :type s: str
        :rtype: str
        """
        # One Liner
        """
        return "".join([k*v for k,v in sorted(collections.Counter(s).items() , key=lambda item: item[1], reverse=True)])
        """
        # Hash Map and Sort
        #### Time Complexity: O(NlogN), traverse through the length of input s. Sort operation takes O(klogk)
        #### Space Complexity: O(N), constant space required for HashMap to store 26 characters, but output may keep up to the size of input s
        res = list()
        freq = dict()
        for c in s:
            if c not in freq:
                freq[c] = 1
            else:
                freq[c] += 1
        freq = sorted(freq.items() , key=lambda item: item[1], reverse=True)
        for k,v in freq:
            res.append(k*v)
        return "".join(res)
```
```Python
class Solution(object):
    def frequencySort(self, s):
        """
        :type s: str
        :rtype: str
        """
        # Collections Counter
        #### Time Complexity: O(NlogN), traverse through the length of input s. Sort operation takes O(klogk)
        #### Space Complexity: O(N), constant space required for HashMap to store 26 characters, but output may keep up to the size of input s     
        ans = ""
        counter = collections.Counter(s)
        for letter, freq in counter.most_common():
            ans += letter*freq
        return ans
```

### Multiset and Bucket Sort

#### Complexity Analysis

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution(object):
    def frequencySort(self, s):
        """
        :type s: str
        :rtype: str
        """
        # Multiset and Bucket Sort
        #### Time Complexity: O(N), traverse through the length of input s
        #### Space Complexity: O(N), constant space required for HashMap to store 26 characters, but output may keep up to the size of input s
        if not s:
            return s
        counter = collections.Counter(s)
        max_freq = max(counter.values())
        # Bucket sort the characters by frequency
        bucket = [[] for _ in range(max_freq+1)]
        # Extend size to extra 1 for 0th-index placeholder
        for char,freq in counter.items():
            # Sort characters based on frequency
            bucket[freq].append(char)
        ans = ""
        # Get element in decreasing order
        for i in range(len(bucket)-1, 0, -1):
            for c in bucket[i]:
                ans += c * i
        return ans
```
