# Dynamic Programming

## Introduction to Dynamic Programming

__Dynamic Programming (DP)__ is a programming paradigm that can systematically and efficiently explore all possible solutions to a problem. As such, it is capable of solving a wide variety of problems that often have the following characteristics:

1. The problem can be broken down into "__overlapping subproblems__" - smaller versions of the original problem that are re-used multiple times.
2. The problem has an "__optimal substructure__" - an optimal solution can be formed from optimal solutions to the overlapping subproblems of the original problem.

## Top-down and Bottom-up

There are two ways to implement a Dynamic Programming algorithm:

1. __Bottom-up__, also known as __tabulation__.
2. __Top-down__, also known as __memoization__.

![image](https://user-images.githubusercontent.com/35042430/218633374-494d224a-a8e3-426e-b2db-f02becbc708b.png)

__Top-down (Memoization)__

![image](https://leetcode.com/explore/learn/card/Figures/DP1/C1A2_1.png)

```
// Pseudocode example for top-down

memo = hashmap
Function F(integer i):
    if i is 0 or 1: 
        return i
    if i doesn't exist in memo:
        memo[i] = F(i - 1) + F(i - 2)
    return memo[i]
```

#### Which is better?

Any Dynamic Programming algorithm can be implemented with either method, and there are reasons for choosing either over the other. However, each method has one main advantage that stands out:

- A bottom-up implementation's runtime is usually faster, as iteration does not have the overhead that recursion does.
- A top-down implementation is usually much easier to write. This is because with recursion, the ordering of subproblems does not matter, whereas with tabulation, we need to go through a logical ordering of solving subproblems.

### When to Use DP?

Unfortunately, it is hard to identify when a problem fits into these definitions. Instead, let's discuss some common characteristics of DP problems that are easy to identify.

__The first characteristic__ that is common in DP problems is that the problem will ask for the optimum value (maximum or minimum) of something, or the number of ways there are to do something. For example:
```
- What is the minimum cost of doing...
- What is the maximum profit from...
- How many ways are there to do...
- What is the longest possible...
- Is it possible to reach a certain point...
```

When it comes to identifying if a problem should be solved with DP, this first characteristic is not sufficient. Sometimes, a problem in this format (asking for the max/min/longest etc.) is meant to be solved with a __greedy algorithm__. The next characteristic will help us determine whether a problem should be solved using a greedy algorithm or dynamic programming.

__The second characteristic__ that is common in DP problems is that future "decisions" depend on earlier decisions. Deciding to do something at one step may affect the ability to do something in a later step. This characteristic is what makes a greedy algorithm invalid for a DP problem - we need to factor in results from previous decisions. Admittedly, this characteristic is not as well defined as the first one, and the best way to identify it is to go through some examples.

---

## [Framework for DP Problems](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Dynamic%20Programming/The%20Framework/README.md)

### The Framework

To solve a DP problem, we need to combine 3 things:

#### 1. A function or data structure that will compute/contain the answer to the problem for every given state.
#### 2. A recurrence relation to transition between states.
#### 3. Base cases, so that our recurrence relation doesn't go on infinitely.

Problem [Climbing Stairs](https://leetcode.com/problems/climbing-stairs/) as an example, with a top-down (recursive) implementation

#### Top-down Implementation

```Python
class Solution:
    def climbStairs(self, n: int) -> int:
        #### Time complexity: O(n)
        def dp(i):
            if i <= 2: 
                return i
            if i not in memo:
                # Instead of just returning dp(i - 1) + dp(i - 2), calculate it once and then
                # store the result inside a hashmap to refer to in the future.
                memo[i] = dp(i - 1) + dp(i - 2)
            
            return memo[i]
        
        memo = {}
        return dp(n)
```

```
You may notice that a hashmap is overkill for caching here, and an array can be used instead. This is true, 
but using a hashmap isn't necessarily bad practice as some DP problems will require one, and they're hassle-free 
to use as you don't need to worry about sizing an array correctly. Furthermore, when using top-down DP, some 
problems do not require us to solve every single subproblem, in which case an array may use more memory than a hashmap.
```

#### Bottom-Up Implementation

```Python
    def climbStairs(self, n: int) -> int:
        if n == 1:
            return 1
            
        # An array that represents the answer to the problem for a given state
        dp = [0] * (n + 1)
        dp[1] = 1 # Base cases
        dp[2] = 2 # Base cases
        
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2] # Recurrence relation

        return dp[n]
```

---

### Multidimensional DP

The following are common things to look out for in DP problems that require a state variable:

1. An index along some input. This is usually used if an input is given as an array or string. This has been the sole state variable for all the problems that we've looked at so far, and it has represented the answer to the problem if the input was considered only up to that index - for example, if the input is 
```nums = [0, 1, 2, 3, 4, 5, 6]```, then ```dp(4)``` would represent the answer to the problem for the input ```nums = [0, 1, 2, 3, 4]```

2. A second index along some input. Sometimes, you need two index state variables, say ```i``` and ```j```. In some questions, these variables represent the answer to the original problem if you considered the input starting at index ```i``` and ending at index ```j```. Using the same example above, ```dp(1, 3)``` would solve the problem for the input ```nums = [1, 2, 3]```, if the original input was ```[0, 1, 2, 3, 4, 5, 6]```

3. Explicit numerical constraints given in the problem. For example, ```"you are only allowed to complete k transactions"```, or ```"you are allowed to break up to 
k obstacles"```, etc.

4. Variables that describe statuses in a given state. For example ```"true if currently holding a key, false if not"```, ```"currently holding k packages"``` etc.

5. Some sort of data like a tuple or bitmask used to indicate things being "visited" or "used". For example, "bitmask is a mask where the i<sup>th</sup> bit indicates if the i<sup>th</sup> city has been visited". Note that mutable data structures like arrays cannot be used - typically, only immutable data structures like numbers and strings can be hashed, and therefore memoized.

---

### Top-down to Bottom-up

__Usually__ a __top-down algorithm__ is easier to implement than the equivalent __bottom-up__ algorithm. With that being said, it is useful to know how to take a completed top-down algorithm and convert it to bottom-up. There's a number of reasons for this: first, in an interview, if you solve a problem with top-down, you may be asked to rewrite your solution in an iterative manner (using bottom-up) instead. Second, as we mentioned before, bottom-up usually is __more efficient__ than top-down in terms of runtime.

![image](https://user-images.githubusercontent.com/35042430/218861062-78dd5765-e3cb-4c36-9ebb-a40d334a5a12.png)

---

### Time and Space Complexity

![image](https://user-images.githubusercontent.com/35042430/219430186-03668395-5e9f-436b-81d2-74dadd698d7f.png)

---

## Common Pattern

![image](https://user-images.githubusercontent.com/35042430/219432227-697d63c9-e269-4e88-96a5-15bd7dd13d50.png)

### State Transition by Inaction

![image](https://user-images.githubusercontent.com/35042430/219916952-0cdb40d0-e169-4176-9c19-94dd6c0233a5.png)

### State Reduction

Note: state reductions for space complexity usually only apply to bottom-up implementations, while improving time complexity by reducing the number of state variables applies to both implementations.

__Fibonacci number__

```Python
class Solution:
    def fib(self, n: int) -> int:
        if n <= 1: return n
        one_back = 1
        two_back = 0
        for i in range(2, n + 1):
            temp = one_back
            one_back += two_back
            two_back = temp

        return one_back
```

Whenever you notice that values calculated by a DP algorithm are only reused a few times and then never used again, try to see if you can save on space by replacing an array with some variables. A good first step for this is to look at the recurrence relation to see what previous states are used. For example, in Fibonacci, we only refer to the previous two states, so all results before n - 2 can be discarded.

### Counting DP

![image](https://user-images.githubusercontent.com/35042430/220183069-f24b4c0b-e43c-4c15-8efe-309273e3a04c.png)

### Kadane's Algorithm

#### Pseudocode for the algorithm is below:

```
// Given an input array of numbers "nums",
1. best = negative infinity
2. current = 0
3. for num in nums:
    3.1. current = Max(current + num, num)
    3.2. best = Max(best, current)

4. return best
```

---

## DP for Paths in a Matrix

### Pathing Problems

These problems have matrices as part of the input and give rules for "moving" through the matrix in the problem description. Typically, DP will be applicable when the allowed movement is constrained in a way that prevents moving "backwards", for example if we are only allowed to move down and right.

![image](https://leetcode.com/explore/learn/card/Figures/1293/1293_next_steps.png)
If we are allowed to move in all 4 directions, then it might be a graph/BFS problem instead. This pattern is sometimes combined with other patterns we have looked at, such as counting DP.

In terms of difficulty, these problems are usually less difficult than the average DP problem as the recurrence relation is usually directly related to the rules of traversal. Most of these problems are also very similar or are variations of each other, and because of this, knowing a general approach to these problems can go a long way.

---

## Applying Dynamic Programming to a Problem

While it's _very difficult to be certain_ that there is no greedy algorithm for your interview problem, over time you'll build up an intuition about when to give up. You also don't want to risk spending so long trying to find a greedy algorithm that you run out of time to write a dynamic programming one (and it's also best to make sure you write a working solution!).

Besides, sometimes the process used to develop a dynamic programming solution can lead to a greedy one. So, you might end up being able to further optimize your dynamic programming solution anyway.

```
When you're solving a problem on your own and trying to decide if the second characteristic is applicable, assume it isn't, 
then try to think of a counterexample that proves a greedy algorithm won't work. If you can think of an example where earlier 
decisions affect future decisions, then DP is applicable.
```

Recall that there are two different techniques we can use to implement a dynamic programming solution; memoization and tabulation.

- __Memoization__ is where we add caching to a function (that has no side effects). In dynamic programming, it is typically used on __recursive__ functions for a __top-down__ solution that starts with the initial problem and then recursively calls itself to solve smaller problems.

- __Tabulation__ uses a table to keep track of subproblem results and works in a __bottom-up__ manner: solving the smallest subproblems before the large ones, in an __iterative__ manner. Often, people use the words ```"tabulation"``` and ```"dynamic programming"``` interchangeably.

For most people, it's easiest to start by coming up with a recursive brute-force solution and then adding memoization to it. After that, they then figure out how to convert it into an (often more desired) bottom-up tabulated algorithm.

Usually, solving and fully understanding a dynamic programming problem is a 4-step process:

1. Start with the recursive backtracking solution
2. Optimize by using a memoization table (top-down2 dynamic programming)
3. Remove the need for recursion (bottom-up dynamic programming)
4. Apply final tricks to reduce the time / memory complexity

## Problems
