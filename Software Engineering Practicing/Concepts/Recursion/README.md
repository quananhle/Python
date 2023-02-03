# Recursion

## Principle of Recursion

```Recursion is an approach to solving problems using a function that calls itself as a subroutine.```

The trick is that each time a recursive function calls itself, it reduces the given problem into __subproblems__. The recursion call continues until it reaches a point where the subproblem can be solved without further recursion.

A recursive function should have the following properties so that it does not result in an infinite loop:

  1. A simple __base case__ (or cases) — a terminating scenario that does not use recursion to produce an answer.
  2. A set of rules, also known as __recurrence relation__ that reduces all other cases towards the base case.

