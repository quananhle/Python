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

## Framework for DP Problems

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

#### Bottom-Up Implementation

```Python

```

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
