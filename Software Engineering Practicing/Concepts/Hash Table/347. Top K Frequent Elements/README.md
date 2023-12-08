## [347. Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements)

```Tag```: ```Sort``` ```Hash Table``` ```Quickselect (Hoare's Selection Algorithm)```

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

- $1 \le nums.length \le 10^5$
- $-10^4 \le nums[i] \le 10^4$
- ```k``` is in the range ```[1, the number of unique elements in the array]```.
- It is guaranteed that the answer is unique.


---

### One Liner

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        return [num for num, freq in collections.Counter(nums).most_common(k)]
```

### Sort

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        # Sort
        #### Time Complexity: O(NlogN), sort operations take NlogN time
        #### Space Complexity: O(N), frequency hash map might be as big as the input array if all elements are unique
        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)
        
        sorted_frequency = sorted(counter.items(), key=lambda x:x[1])[::-1]
        res = list()
        for i in range(k):
            res.append(sorted_frequency[i][0])

        return res
```

__Follow up__: Your algorithm's time complexity must be better than ```O(n*log n)```, where ```n``` is the array's size.

### Heap

#### ```Heappush()``` & ```Heappop()```

![image](https://leetcode.com/problems/top-k-frequent-elements/solutions/646157/Figures/347_rewrite/summary.png)

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        # Heap
        #### Time Complexity: O(N * logk), if k < N, and O(1), if k == N  
        #### Space Complexity: O(N + k), to store the hash map and heap
        if k == len(nums):
            return nums

        counter = collections.Counter(nums)
        h = list()
        for key, val in counter.items():
            # Build priority queue based on frequency of elements
            heapq.heappush(h, (val, key))
            if len(h) > k:
                heapq.heappop(h)
    
        return [num[1] for num in h]
```

#### ```nlargest()```

```Python
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        if k == len(nums):
            return nums
        
        counter = collections.Counter(nums)
        return heapq.nlargest(k, counter.keys(), key=counter.get)
```

### Quickselect (Hoare's selection algorithm)

#### Lomuto's Partition Scheme

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
class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        # Quick Select
        ### Lomuto's Partition Scheme
        #### Time Complexity: O(N) on average, O(N^2) worst case 
        #### Space Complexity: O(N),

        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)
        unique = list(counter.keys())

        def partition(left, right, pivot):
            pivot_freq = counter[unique[pivot]]
            # Move pivot to the end
            unique[pivot], unique[right] = unique[right], unique[pivot]
            # Move all less frequent elements to the left
            index = left
            for i in range(left, right):
                if counter[unique[i]] < pivot_freq:
                    unique[index], unique[i] = unique[i], unique[index]
                    index += 1
            # Move more frequen elements to the right
            unique[right], unique[index] = unique[index], unique[right]
            return index
        
        def quick_select(left, right, k):
            # Base case
            if left == right:
                return
            pivot = random.randint(left, right)
            # Get the pivot index from the sorted list
            pivot = partition(left, right, pivot)
            # Check if the pivot is already at the correct position
            if pivot == k:
                return
            # Check if pivot is at the left
            elif k < pivot:
                quick_select(left, pivot - 1, k)
            # Otherwise, check the right
            else:
                quick_select(pivot + 1, right, k)
        
        n = len(unique)
        # After the partitial sort, all the left elements are less frequent, all the right elements are more frequent
        quick_select(0, n-1, n-k)
        # Return the top k elements
        return unique[n-k:]
```

