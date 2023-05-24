## [2542. Maximum Subsequence Score](https://leetcode.com/problems/maximum-subsequence-score/)

```Tag```: ```Priority Queue``` ```Sorting```

#### Difficulty: Medium

You are given two __0-indexed__ integer arrays ```nums1``` and ```nums2``` of equal length ```n``` and a positive integer ```k```. You must choose a subsequence of indices from ```nums1``` of length ```k```.

For chosen indices ```i0```, ```i1```, ```...```, ```ik - 1```, your score is defined as:

- The sum of the selected elements from ```nums1``` multiplied with the minimum of the selected elements from ```nums2```.
- It can defined simply as: ```(nums1[i0] + nums1[i1] +...+ nums1[ik - 1]) * min(nums2[i0] , nums2[i1], ... ,nums2[ik - 1])```.

Return _the maximum possible score_.

A subsequence of indices of an array is a set that can be derived from the set ```{0, 1, ..., n-1}``` by deleting some or no elements.

![image](https://github.com/quananhle/Python/assets/35042430/a814b4d9-e8b7-4453-98d6-6c31f442f466)

---

__Example 1:__
```
Input: nums1 = [1,3,3,2], nums2 = [2,1,3,4], k = 3
Output: 12
Explanation: 
The four possible subsequence scores are:
- We choose the indices 0, 1, and 2 with score = (1+3+3) * min(2,1,3) = 7.
- We choose the indices 0, 1, and 3 with score = (1+3+2) * min(2,1,4) = 6. 
- We choose the indices 0, 2, and 3 with score = (1+3+2) * min(2,3,4) = 12. 
- We choose the indices 1, 2, and 3 with score = (3+3+2) * min(1,3,4) = 8.
Therefore, we return the max score, which is 12.
```

__Example 2:__
```
Input: nums1 = [4,2,3,1,1], nums2 = [7,5,10,9,6], k = 1
Output: 30
Explanation: 
Choosing index 2 is optimal: nums1[2] * nums2[2] = 3 * 10 = 30 is the maximum possible score.
```

__Constraints:__

- ```n == nums1.length == nums2.length```
- ```1 <= n <= 10^5```
- ```0 <= nums1[i], nums2[j] <= 10^5```
- ```1 <= k <= n```

---

 ### Priority Queue
 
 ```Python
 class Solution:
    def maxScore(self, nums1: List[int], nums2: List[int], k: int) -> int:
        pairs = [(a, b) for a, b in zip(nums1, nums2)]
        pairs.sort(key=lambda x:-x[1])

        top_k_heap = [x[0] for x in pairs[:k]]
        top_k_sum = sum(top_k_heap)
        heapq.heapify(top_k_heap)

        print (pairs)
        print (top_k_heap)
        ans = top_k_sum * pairs[k - 1][1]
        
        for i in range(k, len(nums1)):
            top_k_sum -= heapq.heappop(top_k_heap)
            heapq.heappush(top_k_heap, pairs[i][0])
            top_k_sum += pairs[i][0]

            ans = max(ans, top_k_sum * pairs[i][1])

        return ans
```

```Python
class Solution:
    def maxScore(self, nums1: List[int], nums2: List[int], k: int) -> int:
        n = len(nums1)
        pairs = sorted(list(zip(nums1, nums2)), key=lambda x:-x[1])
        ans = 0
        heap = list()
        running_sum = 0

        for num1, min_val in pairs:
            running_sum += num1
            heapq.heappush(heap, num1)
            if len(heap) > k:
                running_sum -= heapq.heappop(heap)
            if len(heap) == k:
                ans = max(ans, running_sum * min_val)
        
        return ans
```
