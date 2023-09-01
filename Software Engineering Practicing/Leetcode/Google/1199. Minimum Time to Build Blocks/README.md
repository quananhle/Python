## [1199. Minimum Time to Build Blocks](https://leetcode.com/problems/minimum-time-to-build-blocks/)

```Tag```: ```Dynamic Programming``` ```Binary Tree``` ```Priority Queue (Heap)```

#### Difficulty: Hard

You are given a list of blocks, where ```blocks[i] = t``` means that the $i-th$ block needs ```t``` units of time to be built. A block can only be built by exactly one worker.

A worker can either split into two workers (number of workers increases by one) or build a block then go home. Both decisions cost some time.

The time cost of spliting one worker into two workers is given as an integer ```split```. Note that if two workers split at the same time, they split in parallel so the cost would be ```split```.

Output the minimum time needed to build all blocks.

Initially, there is only one worker.

![image](https://github.com/quananhle/Python/assets/35042430/42ec58e4-8bc3-4734-a7b0-493851a2d7d1)

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

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{2})$.
- __Space Complexity__: $\mathcal{O}(N^{2})$.
 
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

#### Bottom-Up Dynamic Programming (Time Limit Exceeded)

![image](https://github.com/quananhle/Python/assets/35042430/7d5a1963-6525-4edb-9597-616478f968a6)

__Algorithm__

1. Sort the ```blocks``` array in descending order.
2. Declare a two-dimensional array ```dp``` of size $(n + 1)$.
3. Fill the first column of ```dp``` with $\infty$, except for the first column of the last row.
4. Fill the last row of ```dp``` with ```0```.
5. Traverse ```i```, the number of blocks state variable from ```N - 1``` to ```0```. For every ```i```, traverse ```worker```, the number of workers state variable from ```N``` to ```1```
  - If ```worker >= n - i```, then we can build all the remaining blocks with the available workers. Hence, the minimum time taken to build the remaining blocks is the maximum time taken to build any of the remaining blocks. This is because we can build all the remaining blocks in parallel. Therefore, fill ```dp[i][worker]``` with ```blocks[i]```.
  - Otherwise, we will fill ```dp[i][worker]``` with the minimum of two terms.
      - The first term is the maximum of ```blocks[i]``` and ```dp[i + 1][worker - 1]```, when we decide to use the current worker to build the current block.
      - The second term would be ```split + dp[i][min(2 * worker, n - i)]``` when we decide to split the current worker into two workers. We need at most ```n - i``` workers to build the remaining blocks, so we will take the minimum of ```2 * worker``` and ```n - i``` workers.
6. Return ```dp[0][1]```. In general, ```dp[i][worker]``` denotes the minimum time taken to build all blocks from index ```i``` to the last block using ```worker``` workers. Thus, ```dp[0][1]``` denotes the minimum time taken to build all blocks from index ```0``` to the last block using ```1``` worker.

> It's worth noting that it is bottom-up because we are moving from the solved base case to the unsolved sub-problems.
> 
> The order of traversal from bottom-row to up has nothing to do with the term bottom-up dynamic programming. Many problems require traversal in a diagonal manner. Thus, critically analyze the Bellman Equation to conclude the order of filling the array.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{2})$.
- __Space Complexity__: $\mathcal{O}(N^{2})$.

```Python
class Solution:
    def minBuildTime(self, blocks: List[int], split: int) -> int:
        n = len(blocks)
        blocks.sort(reverse=True)
        dp = collections.defaultdict()

        for i in range(n):
            dp[(i, 0)] = math.inf

        for worker in range(n + 1):
            dp[(n, worker)] = 0
        
        for i in range(n - 1, -1, -1):
            for worker in range(n, 0, -1):
                if worker >= n - i:
                    dp[(i, worker)] = blocks[i]
                    continue
                
                to_work = max(blocks[i], dp[(i + 1, worker - 1)])
                to_split = split + dp[(i, min(2 * worker, n - i))]

                dp[(i, worker)] = min(to_work, to_split)
            
        return dp[(0, 1)]
```

#### Space Optimized Bottom-Up Dynamic Programming

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{2})$.
- __Space Complexity__: $\mathcal{O}(N)$.

```Python
class Solution:
    def minBuildTime(self, blocks: List[int], split: int) -> int:
        n = len(blocks)
        blocks.sort(reverse=True)
        
        # Initialize the dp array. When all N blocks
        # done, we need 0 time.
        dp = collections.defaultdict()

        # The case when we have no workers.
        dp[0] = float('inf')
        
        # Fill the dp array in a bottom-up fashion.
        for i in range(n - 1, -1, -1):
            for worker in range(n, 0, -1):                
                # If we have more workers than blocks, 
                # Then we can build all the blocks.
                if worker >= n - i:
                    dp[worker] = blocks[i]
                    continue

                # Recurrence relation.
                to_work = max(blocks[i], dp[worker - 1])
                to_split = split + dp[min(2 * worker, n - i)]
                
                # Store the result in the dp array
                dp[worker] = min(to_work, to_split)
        
        # For building all the blocks, with 
        # initially 1 worker.
        return dp[1]
```

---

### Priority Queue

```Python

```
