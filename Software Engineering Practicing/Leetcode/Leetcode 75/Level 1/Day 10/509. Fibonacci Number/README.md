## 509. Fibonacci Number

#### Difficulty: Easy

The Fibonacci numbers, commonly denoted ```F(n)``` form a sequence, called the __Fibonacci sequence__, such that each number is the sum of the two preceding ones, starting from ```0``` and ```1```. That is,

![image](https://user-images.githubusercontent.com/35042430/206746225-cf630d85-9c02-4493-bbd1-30315a34549e.png)

---

```
F(0) = 0, F(1) = 1
F(n) = F(n - 1) + F(n - 2), for n > 1.
```

Given ```n```, calculate ```F(n)```.

__Example 1:__

```
Input: n = 2
Output: 1
Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
```

__Example 2:__

```
Input: n = 3
Output: 2
Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
```

__Example 3:__

```
Input: n = 4
Output: 3
Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
```

__Constraints:__

```
0 <= n <= 30
```

---

### Recursion

![image](https://leetcode.com/problems/fibonacci-number/solutions/362772/Figures/509/fibonacciRecursion5.png)

#### Algorithm

- Check if the provided input value, N, is less than or equal to 1. If true, return N.

- Otherwise, the function ```fib(int N)``` calls itself, with the result of the 2 previous numbers being added to each other, passed in as the argument. This is derived directly from the ```recurrence relation```: F<sub>n</sub> = F<sub>n−1</sub> + F<sub>n−2</sub>
 
- Do this until all numbers have been computed, then return the resulting answer.

```Python
class Solution(object):
    cache = {0: 0, 1: 1}
    def fib(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Recursion
        #### Time Complexity: O(2^N)
        #### Space Complexity: O(N)
        """
        # Base cases:
        if n == 0:
            return 0
        # Base cases:
        elif n == 1:
            return 1
        else:
            return self.fib(n-1) + self.fib(n-2)
        """
```

#### Complexity Analysis
```
Time complexity: O(2^N), This is the slowest way to solve the Fibonacci Sequence because it takes exponential time. The amount of operations needed, for each level of recursion, grows exponentially as the depth approaches N.

Space complexity: O(N). We need space proportional to N to account for the max size of the stack, in memory. This stack keeps track of the function calls to fib(N). This has the potential to be bad in cases that there isn't enough physical memory to handle the increasingly growing stack, leading to a StackOverflowError. 
```

### Top-Down Dynamic Programming using Memoization

#### Algorithm

- At first, create a map with ```0``` -> ```0``` and ```1``` -> ```1``` pairs.
- Call ```fib(N)``` function.
    - At every recursive call of ```fib(N)```, if ```N``` exists in the map, return the cached value for ```N```.
    - Otherwise, set the key ```N```, in our mapping, to the value of ```fib(N - 1) + fib(N - 2)``` and return the computed value.

```Python
class Solution(object):
    cache = {0: 0, 1: 1}
    def fib(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Top-Down Dynamic Programming using Memoization
        #### Time Complexity: O(N), calculate every number up to n and store into cache dictionary. If number calculated before and stored in cache, omit calculation and return value
        #### Space Complexity: O(N), keep all keys in cache up to n, size of the stack in memory is proportional to N
        if n in self.cache:
            return self.cache[n]
        else:
            self.cache[n] = self.fib(n - 1) + self.fib(n - 2)
        return self.cache[n]
```

### Bottom-Up Approach using Tabulation

#### Algorithm

- If ```N``` is less than or equal to 1, return ```N```
- Otherwise, iterate through ```N```, storing each computed answer in an array along the way.
- Use this array as a reference to the 2 previous numbers to calculate the current Fibonacci number.
- Once we've reached the last number, return it's Fibonacci number.

```Python
class Solution(object):
    cache = {0: 0, 1: 1}
    def fib(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Bottom-Up Dynamic Programming using Tabulation
        #### Time Complexity: O(N), calculate every number from 2 up to n+1
        #### Space Complexity: O(N), hash table size is up to n elements
        if n <= 1:
            return n
        cache = [0] * (n + 1)
        cache[0], cache[1] = 0, 1
        for i in range(2, n + 1):
            cache[i] = cache[i - 1] + cache[i - 2]
        return cache[n]
```
