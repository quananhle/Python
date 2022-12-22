## 1167. Minimum Cost to Connect Sticks



![image](https://user-images.githubusercontent.com/35042430/209078415-ab934670-568d-4f67-a865-823b72b4ce51.png)

---


---

### Heap

```Python
class Solution:
    def connectSticks(self, sticks: List[int]) -> int:
        # Heap
        #### Time Complexity: O(NlogN), traverse through the size N of input array take O(N), add and remove heap node take O(logN) time
        #### Space Complexity: O(N), extra space required to build a priority queue of N nodes

        min_cost = 0
        heapq.heapify(sticks)
        while len(sticks) > 1:
            num1 = heapq.heappop(sticks)
            num2 = heapq.heappop(sticks)
            cost = num1 + num2
            heapq.heappush(sticks, cost)
            min_cost += cost
        return min_cost
```
