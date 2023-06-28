## [373. Find K Pairs with Smallest Sums](https://leetcode.com/problems/find-k-pairs-with-smallest-sums/)

```Tag```: ```Priority Queue```

#### Difficulty: Medium

You are given two integer arrays ```nums1``` and ```nums2``` sorted in ascending order and an integer ```k```.

Define a pair ```(u, v)``` which consists of one element from the first array and one element from the second array.

Return _the ```k``` pairs ```(u1, v1)```, ```(u2, v2)```, ..., ```(uk, vk)``` with the smallest sums_.

![image](https://github.com/quananhle/Python/assets/35042430/78eabdd9-7ed7-4dff-9e96-ddf8230c448f)

---

__Example 1:__
```
Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
Output: [[1,2],[1,4],[1,6]]
Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
```

__Example 2:__
```
Input: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
Output: [[1,1],[1,1]]
Explanation: The first 2 pairs are returned from the sequence: [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]
```

__Example 3:__
```
Input: nums1 = [1,2], nums2 = [3], k = 3
Output: [[1,3],[2,3]]
Explanation: All possible pairs are returned from the sequence: [1,3],[2,3]
```

__Constraints:__

- ```1 <= nums1.length, nums2.length <= 10^5```
- ```-10^9 <= nums1[i], nums2[i] <= 10^9```
- ```nums1``` and ```nums2``` both are sorted in ascending order.
- ```1 <= k <= 10^4```

---

### Priority Queue

This method is very similar to the Dijkstra algorithm in that we find the shortest distance between any two nodes. To find the edge with the smallest weight, we heap all of the edge weights. Then we move on to the next node (using minimum weight edge selected). We add all of the edge weights for the edges connected with the node back to the heap from the current node and choose the edge with the lowest weight from the available edges. We use the edge to move to another unvisited node and continue popping nodes and adding edge weights to the heap until all of the nodes are covered.

__Algorithm__

1. Create two integer variables ```m``` and ```n```. Initialize them to size of ```nums1``` and ```nums2``` respectively.
2. Create a list ```res``` to store the pairs with smallest sums that are to be returned as the answer.
Create a hash set visited to keep track of pairs that are seen. Please note that we used ordered_set in C++ in place of unordered_set because the unordered_set uses hash template to compute hashes for its entries and there is no hash specialization for pairs. Either we define the hash function of pairs or use ordered_set which is a little expensive as it adds log factor. We are using ordered_set here.
Initialize a min heap minHeap that takes a triplet of integers: the sum of the pair, the index in nums1 of the first element of the pair, and the index in nums2 of the second element of the pair.
Push the first element from the both the arrays in minHeap, i.e., we push nums1[0] + nums2[0], 0, 0. We also insert pair (0, 0) in visited.
Iterate till we get k pairs and minHeap is not empty:
Pop the top of minHeap and set i = top[1] and j = top[2].
Push pair (nums1[i], nums2[j]) in ans.
If i + 1 < m and pair (i + 1, j) is not in visited, we push a new pair nums1[i + 1] + nums2[j], i + 1, j into the heap.
If j + 1 < n and pair (i, j + 1) is not in visited, we push a new pair nums1[i] + nums2[j + 1], i, j + 1 into the heap.
Return ans.

```Python
class Solution:
    def kSmallestPairs(self, nums1: List[int], nums2: List[int], k: int) -> List[List[int]]:
        m, n = len(nums1), len(nums2)
        res = list()
        visited = set()

        min_heap = [(nums1[0] + nums2[0], (0, 0))]
        visited.add((0, 0))

        while k > 0 and min_heap:
            val, (i, j) = heapq.heappop(min_heap)
            res.append([nums1[i], nums2[j]])

            if i + 1 < m and not (i + 1, j) in visited:
                heapq.heappush(min_heap, (nums1[i + 1] + nums2[j], (i + 1, j)))
                visited.add((i + 1, j))

            if j + 1 < n and not (i, j + 1) in visited:
                heapq.heappush(min_heap, (nums1[i] + nums2[j + 1],(i, j + 1)))
                visited.add((i, j + 1))

            k -= 1

        return res 
```
