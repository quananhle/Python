## 347. Top K Frequent Elements

```Tag```: ```Sort``` ```Hash Table```

#### Difficulty: Medium

Given an integer array ```nums``` and an integer ```k```, return _the ```k``` most frequent elements_. You may return the answer in __any order__.

![image](https://user-images.githubusercontent.com/35042430/214404324-85f282d5-168b-4417-a3de-7d0b3b3bf73d.png)

---

__Example 1:__
```
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]
```

__Example 2:__
```
Input: nums = [1], k = 1
Output: [1]
```

__Constraints:__
```
1 <= nums.length <= 105
-104 <= nums[i] <= 104
k is in the range [1, the number of unique elements in the array].
It is guaranteed that the answer is unique.
```

---

### Sort

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        # Sort
        #### Time Complexity: O(NlogN), sort operations take NlogN time
        #### Space Complexity: O(N), frequency hash map might be as big as the input array if all elements are unique
        freq = collections.defaultdict(int)
        for num in nums:
            freq[num] = 1 + freq.get(num, 0)
        sorted_frequency = sorted(freq.items(), key=lambda x:x[1])[::-1]
        res = list()
        i = 0
        while k:
            res.append(sorted_frequency[i][0])
            i += 1
            k -= 1
        return res
```

__Follow up__: Your algorithm's time complexity must be better than ```O(n*log n)```, where ```n``` is the array's size.

### Heap

![image](https://leetcode.com/problems/top-k-frequent-elements/solutions/646157/Figures/347_rewrite/summary.png)

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        # Heap
        #### Time Complexity: O(N * logk), if k < N, and O(1), if k == N  
        #### Space Complexity: O(N + k), to store the hash map and heap
        if k == len(nums):
            return nums
        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)
        h = list()
        for num, cnt in counter.items():
            # Build priority queue based on frequency of elements
            heapq.heappush(h, (cnt, num))
            if len(h) > k:
                heapq.heappop(h)
        res = list()
        for cnt, num in h:
            res.append(num)
        return res
```
