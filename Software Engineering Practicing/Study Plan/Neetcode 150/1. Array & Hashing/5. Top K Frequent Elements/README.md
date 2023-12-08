## [Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements)

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        counter = collections.Counter(nums)
        
        freq = collections.defaultdict(list)
        for key, val in counter.items():
            freq[val].append(key)
        
        res = list()
        while k:
            top_key = max(freq.keys())
            for num in freq[top_key]:
                res.append(num)
                k -= 1
            del freq[top_key]
        
        return res
```

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        counter = collections.Counter(nums)
        if k == len(nums):
            return nums
        
        h = list()
        for num, freq in counter.items():
            heapq.heappush(h, (freq, num))
            if len(h) > k:
                heapq.heappop(h)
        
        return [num[1] for num in h]
```
