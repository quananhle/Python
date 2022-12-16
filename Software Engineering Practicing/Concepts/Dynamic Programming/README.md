# Dynamic Programming

## Applying Dynamic Programming to a Problem

While it's _very difficult to be certain_ that there is no greedy algorithm for your interview problem, over time you'll build up an intuition about when to give up. You also don't want to risk spending so long trying to find a greedy algorithm that you run out of time to write a dynamic programming one (and it's also best to make sure you write a working solution!).

Besides, sometimes the process used to develop a dynamic programming solution can lead to a greedy one. So, you might end up being able to further optimize your dynamic programming solution anyway.

Recall that there are two different techniques we can use to implement a dynamic programming solution; memoization and tabulation.

- __Memoization__ is where we add caching to a function (that has no side effects). In dynamic programming, it is typically used on __recursive__ functions for a __top-down__ solution that starts with the initial problem and then recursively calls itself to solve smaller problems.

- __Tabulation__ uses a table to keep track of subproblem results and works in a __bottom-up__ manner: solving the smallest subproblems before the large ones, in an __iterative__ manner. Often, people use the words ```"tabulation"``` and ```"dynamic programming"``` interchangeably.

For most people, it's easiest to start by coming up with a recursive brute-force solution and then adding memoization to it. After that, they then figure out how to convert it into an (often more desired) bottom-up tabulated algorithm.
