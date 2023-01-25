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

### Quickselect (Hoare's selection algorithm)

![image](https://leetcode.com/problems/top-k-frequent-elements/solutions/646157/Figures/347_rewrite/details.png)

```Python
def partition(left, right, pivot_index) -> int:
    pivot_frequency = count[unique[pivot_index]]
    # 1. move pivot to the end
    unique[pivot_index], unique[right] = unique[right], unique[pivot_index]  
    
    # 2. move all less frequent elements to the left
    store_index = left
    for i in range(left, right):
        if count[unique[i]] < pivot_frequency:
            unique[store_index], unique[i] = unique[i], unique[store_index]
            store_index += 1

    # 3. move pivot to its final place
    unique[right], unique[store_index] = unique[store_index], unique[right]  
    
    return store_index
```

```Python

```

