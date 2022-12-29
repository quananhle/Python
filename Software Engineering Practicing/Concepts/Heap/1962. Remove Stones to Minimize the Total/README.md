## 1962. Remove Stones to Minimize the Total

```Tag```: ```Heap``` ```Priority Queue```

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```piles```, where ```piles[i]``` represents the number of stones in the i<sup>th</sup> pile, and an integer ```k```. You should apply the following operation __exactly__ ```k``` times:

- Choose any ```piles[i]``` and remove ```floor(piles[i] / 2)``` stones from it.

__Notice__ that you can apply the operation on the __same__ pile more than once.

Return _the __minimum__ possible total number of stones remaining after applying the ```k``` operations_.

```floor(x)``` is the __greatest__ integer that is __smaller__ than or __equal__ to ```x``` (i.e., rounds ```x``` down).

![image](https://user-images.githubusercontent.com/35042430/209890626-dee79eb3-b16e-4a20-b16d-52e25a69a2bb.png)

---

__Example 1:__
```
Input: piles = [5,4,9], k = 2
Output: 12
Explanation: Steps of a possible scenario are:
- Apply the operation on pile 2. The resulting piles are [5,4,5].
- Apply the operation on pile 0. The resulting piles are [3,4,5].
The total number of stones in [3,4,5] is 12.
```

__Example 2:__
```
Input: piles = [4,3,6,7], k = 3
Output: 12
Explanation: Steps of a possible scenario are:
- Apply the operation on pile 2. The resulting piles are [4,3,3,7].
- Apply the operation on pile 3. The resulting piles are [4,3,3,4].
- Apply the operation on pile 0. The resulting piles are [2,3,3,4].
The total number of stones in [2,3,3,4] is 12.
```

__Constraints:__
```
1 <= piles.length <= 105
1 <= piles[i] <= 104
1 <= k <= 105
```

---

```Python
class Solution:
    def minStoneSum(self, piles: List[int], k: int) -> int:
        # Heap
        heap = list()
        for pile in piles:
            heapq.heappush(heap, -pile)
        while k:
            pile = -heapq.heappop(heap)
            pile -= pile // 2
            heapq.heappush(heap, -pile)
            k -= 1
        return -sum(heap)
```
        
