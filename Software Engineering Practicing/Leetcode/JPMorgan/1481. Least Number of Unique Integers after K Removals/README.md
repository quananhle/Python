## [1481. Least Number of Unique Integers after K Removals](https://leetcode.com/problems/least-number-of-unique-integers-after-k-removals)

```Tag```: ```Priority Queue``` ```Hash Map``` ```Counting Sort``` ```Sorting```

#### Difficulty: Medium

Given an array of integers ```arr``` and an integer ```k```. Find the least number of unique integers after removing exactly ```k``` elements.

![image](https://github.com/quananhle/Python/assets/35042430/3d39e22a-9317-4323-895f-33f007fb319a)

---

__Example 1:__
```
Input: arr = [5,5,4], k = 1
Output: 1
Explanation: Remove the single 4, only 5 is left.
Example 2:
Input: arr = [4,3,1,1,3,3,2], k = 3
Output: 2
Explanation: Remove 4, 2 and either one of the two 1s or three 3s. 1 and 3 will be left.
```

__Constraints:__

- $1 \le arr.length \le 10^5$
- $1 \le arr[i] \le 10^9$
- $0 \le k \le arr.length$

---

### Sorting

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \log{}n)$
- __Space Complexity__: $\mathcal{O}(n)$ or $\mathcal{O}(\log{}n)$

```Python
class Solution:
    def findLeastNumOfUniqueInts(self, arr: List[int], k: int) -> int:
        counter = collections.Counter(arr)
        # Get the frequencies of all unique elements
        freqs = list(counter.values())
        freqs.sort()
        elements_to_remove = 0

        for i in range(len(freqs)):
            # Removing frequencies[i] elements, which equates to removing one unique element
            elements_to_remove += freqs[i]
            # If running frequency is bigger than k, can only remove up to but not including current element
            if elements_to_remove > k:
                return len(freqs) - i
```

### Hash Map & Priority Queue (Min Heap)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \log{}n)$
- __Space Complexity__: $\mathcal{O}(n)$$

```Python
class Solution:
    def findLeastNumOfUniqueInts(self, arr: List[int], k: int) -> int:
        counter = collections.Counter(arr)
        freqs = list(counter.values())
        heapq.heapify(freqs)
        elements_to_remove = 0

        while freqs:
            elements_to_remove += heapq.heappop(freqs)
            if elements_to_remove > k:
                return len(freqs) + 1
```

```Python
class Solution:
    def findLeastNumOfUniqueInts(self, arr: List[int], k: int) -> int:
        counter = collections.defaultdict(int)
        for num in arr:
            counter[num] = 1 + counter.get(num, 0)

        h = list()
        for key, val in counter.items():
            heapq.heappush(h, (val, key))
        
        while k and h:
            count, num = heapq.heappop(h)
            if count == 1:
                del counter[num]
            else:
                heapq.heappush(h, (count-1, num))
            k -= 1
        
        return len(counter)
```

### Counting Sort

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n)$
- __Space Complexity__: $\mathcal{O}(n)$$

```Python
class Solution:
    def findLeastNumOfUniqueInts(self, arr: List[int], k: int) -> int:
        counter = collections.Counter(arr)
        n = len(arr)
        unique_elements = len(counter)
        
        frequency_counter = [0 for _ in range(n + 1)]
        for num in counter.values():
            frequency_counter[num] += 1
        
        for frequency in range(1, n + 1):
            num_elements_to_remove = min(k // frequency, frequency_counter[frequency])
            k -= frequency * num_elements_to_remove
            unique_elements -= num_elements_to_remove
            if k < frequency:
                return unique_elements
```
