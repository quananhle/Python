## [1199. Minimum Time to Build Blocks](https://leetcode.com/problems/minimum-time-to-build-blocks/)

```Tag```: ```Dynamic Programming``` ```Binary Tree``` ```Priority Queue (Heap)```

#### Difficulty: Hard

You are given a list of blocks, where ```blocks[i] = t``` means that the $i-th$ block needs ```t``` units of time to be built. A block can only be built by exactly one worker.

A worker can either split into two workers (number of workers increases by one) or build a block then go home. Both decisions cost some time.

The time cost of spliting one worker into two workers is given as an integer ```split```. Note that if two workers split at the same time, they split in parallel so the cost would be ```split```.

Output the minimum time needed to build all blocks.

Initially, there is only one worker.

---

__Example 1:__
```
Input: blocks = [1], split = 1
Output: 1
Explanation: We use 1 worker to build 1 block in 1 time unit.
```

__Example 2:__
```
Input: blocks = [1,2], split = 5
Output: 7
Explanation: We split the worker into 2 workers in 5 time units then assign each of them to a block so the cost is 5 + max(1, 2) = 7.
```

__Example 3:__
```
Input: blocks = [1,2,3], split = 1
Output: 4
Explanation: Split 1 worker into 2, then assign the first worker to the last block and split the second worker into 2.
Then, use the two unassigned workers to build the first two blocks.
The cost is 1 + max(3, 1 + max(1, 2)) = 4.
```

__Constraints:__

- $1 \le blocks.length \le 1000$
- $1 \le blocks[i] \le 10^{5}$
- $1 \le split \le 100$

---

### The Framework

#### Top-Down Dynamic Programming (Memory Limit Exceeded)

__Algorithm__

1. Sort the ```blocks``` in descending order.
2. Initialize a 2D array ```memo``` of size ```N * (N + 1)``` with ```-1``` or a dictionary ```memo```.
3. Define a function ```dp(i, worker)``` which returns the minimum time taken to finish all the blocks in the suffix array ```blocks[b ~ N-1]``` using ```w``` workers, provided ```blocks``` is sorted in descending order. Apart from ```i``` and ```worker```, it can take other parameters so that we can access the required variables.
  - If ```i == blocks.length```, then we have already built all the blocks. Hence, return ```0```.
  - If ```worker == 0```, then we can't build any block. Hence, return ```Integer.MAX_VALUE```.
  - If ```worker >= blocks.length - i```, then we can build all the remaining blocks without additional workers. Hence, return ```blocks[i]```, the block which will take the maximum time to build out of all the remaining blocks.
  - If ```dp(i, worker)``` is already solved, then return the result from ```dp```. It can be checked by checking if ```memo[i][worker] != -1``` or if ```(i, worker)``` is already in ```memo```.
  - Otherwise, we have two choices:
      - Work here. Save its optimal result in ```work_here```. It would be ```max(blocks[i], dp(i + 1, worker - 1))```.
      - Split here. Save its optimal result in ```split_here```. It would be ```split + dp(i, min(2 * worker, blocks.length - i))```.
  - Save the minimum of ```work_here``` and ```split_here``` in ```memo[i][worker]```.
  - Return ```memo[i][worker]```.
4. Call ```dp(0, 1)``` because we have to finish all the blocks in the suffix array ```blocks[0 ~ N-1]```, and we have only one worker at the beginning.

```Python
class Solution:
    def minBuildTime(self, blocks: List[int], split: int) -> int:
        n = len(blocks)
        blocks.sort(reverse=True)
        memo = collections.defaultdict(int)

        def dp(i, worker):
            # Base cases
            if i == n:
                return 0
            
            if worker == 0:
                return math.inf

            if worker >= n - i:
                return blocks[i]

            if (i, worker) in memo:
                return memo[(i, worker)]
            # DP Transitions: to work or to split here is better?

            # Work: move on to the next block, reduce the number of worker
            to_work = max(blocks[i], dp(i + 1, worker - 1))
            
            # Split: add time to split, split the number of worker, but only use up to sufficient workers for the remaining blocks
            to_split = split + dp(i, min(2 * worker, n - i))

            memo[(i, worker)] = min(to_work, to_split)
            return memo[(i, worker)]
        
        return dp(0, 1)
```

```Python
class Solution:
    def minBuildTime(self, blocks: List[int], split: int) -> int:
        n = len(blocks)
        blocks.sort(reverse=True)

        @functools.lru_cache(maxsize=None)
        def dp(i, worker):
            # Base cases
            if i == n:
                return 0
            
            if worker == 0:
                return math.inf

            if worker >= n - i:
                return blocks[i]

            # DP Transitions: to work or to split here is better?

            # Work: move on to the next block, reduce the number of worker
            to_work = max(blocks[i], dp(i + 1, worker - 1))
            
            # Split: add time to split, split the number of worker, but only use up to sufficient workers for the remaining blocks
            to_split = split + dp(i, min(2 * worker, n - i))

            return min(to_work, to_split)
        
        return dp(0, 1)
```

#### Bottom-Up Dynamic Programming

```Python

```

---

### Priority Queue

```Python

```
