## [Top K Frequent Elements](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Hash%20Table/347.%20Top%20K%20Frequent%20Elements)

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
        if k == len(nums):
            return nums
        
        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)

        h = list()
        for num, freq in counter.items():
            heapq.heappush(h, (freq, num))
            if len(h) > k:
                heapq.heappop(h)
        
        return [elem[1] for elem in h]
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
        
        return [elem[1] for elem in h]
```
