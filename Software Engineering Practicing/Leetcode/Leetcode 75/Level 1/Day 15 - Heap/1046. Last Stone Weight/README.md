## 1046. Last Stone Weight



---

```Python
class Solution(object):
    def lastStoneWeight(self, stones):
        """
        :type stones: List[int]
        :rtype: int
        """
        # Sort()
        #### Time Complexity: O(N^2logN), sort operations takes O(NlogN), sort inside the loop every time
        #### Space Complexity: O(N), modify the input list takes O(N) to O(1)        
        """
        while len(stones) > 1:
            stones.sort()
            heaviest = stones.pop()
            second_heaviest = stones.pop()
            if heaviest == second_heaviest:
                continue
            else:
                stones.append(heaviest - second_heaviest)
        return stones[-1] if stones else 0
        """

        # Index()
        #### Time Complexity: O(N^2), sort operations takes O(NlogN), adding the new stone N-1 times while looping through length N of input list
        #### Space Complexity: O(N), modify the input list takes O(N) to O(1)        
        """
        def find_heaviest():
            index_of_largest = stones.index(max(stones))
            stones[index_of_largest], stones[-1] = stones[-1], stones[index_of_largest]
            return stones.pop()

        while len(stones) > 1:
            y = find_heaviest()
            x = find_heaviest()
            if y != x:
                stones.append(y - x)
        return stones[0] if stones else 0
        """

        # Heappify()
        #### Time Complexity: O(NlogN), converting an array into a Heap takes O(N), heappop() and heappush() takes O(logN) time while looping through length N of input list
        #### Space Complexity: O(N) or O(log⁡N), O(N) to heapify() and create priority_queue
        """      
        for i in range(len(stones)):
            stones[i] *= -1
        heapq.heapify(stones)
        while len(stones) > 1:
            print (stones)
            heaviest = heapq.heappop(stones)
            second_heaviest = heapq.heappop(stones)
            if heaviest == second_heaviest:
                continue
            else:
               heapq.heappush(stones, heaviest - second_heaviest)
        return -heapq.heappop(stones) if stones else 0
        """

        # Bucket Sort
        ### This approach is only viable when the maximum stone weight is small, or is at least smaller than the number of stones.
        # Set up the bucket list
        max_weight = max(stones)
        bucket = [0] * (max_weight + 1)
        # Bucket sort
        for stone_weight in stones:
            bucket[stone_weight] += 1
        # Scan through the buckets
        heaviest = 0
        current_weight = max_weight
        # Start from the heaviest stone in bucket
        while current_weight > 0:
            # If there is not any stone at the current weight
            if bucket[current_weight] == 0:
                # Decrement the iteration
                current_weight -= 1
            # Found the current heaviest stone in the bucket
            elif heaviest == 0:
                # Mark the heaviest weight stone in bucket. If there is an even number of same heaviest weight stones, they are canceled out. Otherwise, if there is an odd number
                # Make sure there is only 1 heaviest stone in bucket
                bucket[current_weight] %= 2
                if bucket[current_weight] == 1:
                    # Get the heaviest weight
                    heaviest = current_weight
                # Decrement the iteration
                current_weight -= 1
            # Found the current second heaviest stone in the bucket
            else:
                # Update the number of stone at the current weight in bucket
                bucket[current_weight] -= 1
                # If the heaviest stone still remains heaviest after subtracted the weight of the second heaviest stone
                if heaviest - current_weight > current_weight:
                    # Update the new heaviest weight
                    heaviest -= current_weight
                # If after subtracted the weight of the second heaviest stone, the remaining weight is not heaviest in the bucket
                else:
                # elif heaviest - current_weight <= current_weight:
                    # Update the number of stone with the weight y - x after the smash in the bucket
                    bucket[heaviest - current_weight] += 1
                    # Reset heaviest weight to find the next heaviest weight stone
                    heaviest = 0
        return heaviest
```






