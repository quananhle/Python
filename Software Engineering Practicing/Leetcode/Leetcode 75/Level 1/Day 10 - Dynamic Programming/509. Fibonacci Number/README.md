## [509. Fibonacci Number](https://leetcode.com/problems/fibonacci-number)

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
    def fib(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Recursion
        #### Time Complexity: O(2^N)
        #### Space Complexity: O(N)
        # Base cases:
        if n == 0:
            return 0
        # Base cases:
        elif n == 1:
            return 1
        else:
            return self.fib(n-1) + self.fib(n-2)
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

#### Complexity Analysis
```
Time complexity: O(N). Each number, starting at 2 up to and including N, is visited, computed and then stored for O(1) access later on.
Space complexity: O(N). The size of the stack in memory is proportional to N. Also, the memoization hash table is used, which occupies O(N) space.
```

### Bottom-Up Approach using Tabulation

#### Algorithm

- If ```N``` is less than or equal to 1, return ```N```
- Otherwise, iterate through ```N```, storing each computed answer in an array along the way.
- Use this array as a reference to the 2 previous numbers to calculate the current Fibonacci number.
- Once we've reached the last number, return it's Fibonacci number.

```Python
class Solution(object):
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

#### Complexity Analysis

```
Time complexity: O(N). Each number, starting at 2 up to and including N, is visited, computed and then stored for O(1) access later on.

Space complexity: O(N). The size of the data structure is proportional to N.
```

### Iterative Bottom-Up

#### Algorithm

- Check if ```N <= 1```, if it is, then we should return ```N```.
- We need 3 variables to store each state ```fib(N)```, ```fib(N-1)```, and ```fib(N-2)```.
- Preset the initial values:
  - Initialize ```current``` with ```0```.
  - Initialize ```prev1``` with ```1```, since this will represent ```fib(N-1)``` when computing the current value.
  - Initialize ```prev2``` with ```0```, since this will represent ```fib(N-2)``` when computing the current value.
- Iterate, incrementally by 1, all the way up to and including ```N```. Starting at 2, since ```0``` and ```1``` are pre-computed.
- Set the ```current``` value to ```prev1 + prev2``` because that is the value we are currently computing.
- Set the ```prev2``` value to ```prev1```.
- Set the ```prev1``` value to ```current```.
- When we reach ```N+1```, we will exit the loop and return the previously set ```current``` value.

```Python
class Solution(object):
    def fib(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Iterative Bottom-Up
        #### Time Complexity: O(N), calculate every number from 2 up to n+1
        #### Space Complexity: O(1), size of pointers
        if n <= 1:
            return n
        curr = 0
        prev1 = 1
        prev2 = 0
        # Since range is exclusive and operations need to perform n so range needs to be n+1
        for _ in range(2, n + 1):
            curr = prev1 + prev2
            prev2 = prev1
            prev1 = curr
        return curr
```

#### Complexity Analysis

```
Time complexity: O(N). Each value from 2 to N is computed once. Thus, the time it takes to find the answer is directly proportional to N where N is the Fibonacci Number we are looking to compute.
Space complexity: O(1). This requires 1 unit of space for the integer N and 3 units of space to store the computed values (current, prev1, and prev2) for every loop iteration. The amount of space used is independent of NNN, so this approach uses a constant amount of space.
```

### Matrix Exponentiation

Use Matrix Exponentiation to get the Fibonacci number from the element at (0, 0) in the resultant matrix.

In order to do this we can rely on the matrix equation for the Fibonacci sequence, to find the ```Nth``` Fibonacci number: 

![image](https://user-images.githubusercontent.com/35042430/206749076-6781e9e9-2d3e-43ab-8c29-6073b4b34f96.png)

#### Algorithm

- Check if ```N``` is less than or equal to ```1```. If it is, return ```N```.
- Use a recursive function, ```matrix_power```, to calculate the power of a given matrix ```A```. The power will be ```N-1```, where ```N``` is the ```Nth``` Fibonacci number.
- The ```matrix_power``` function will be performed for ```N/2``` of the Fibonacci numbers.
- Within ```matrix_power```, call the ```multiply``` function to multiply 2 matrices.
- Once we finish doing the calculations, return ```A[0][0]``` to get the ```Nth``` Fibonacci number.

```Python
class Solution(object):
    def fib(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Matrix Exponentiation
        #### Time Complexity: O(logN), halving the n value in every matrix_power's call to itself
        #### Space Complexity: O(log⁡N), size of the stack in memory is proportional to the function calls to matrix_power, plus the memory used to account for the matrices which use constant space.
        if n <= 1:
            return n

        matrix = [[1,1], [1,0]]
        
        def multiply(a, b):
            x = a[0][0] * b[0][0] + a[0][1] * b[1][0]
            y = a[0][0] * b[0][1] + a[0][1] * b[1][1]
            z = a[1][0] * b[0][0] + a[1][1] * b[1][0]
            w = a[1][0] * b[0][1] + a[1][1] * b[1][1]
            a[0][0] = x
            a[0][1] = y
            a[1][0] = z
            a[1][1] = w

        def matrix_power(a, n):
            if n <= 1:
                return a
            matrix_power(a, n // 2)
            multiply(a, a)
            b = [[1,1],[1,0]]
            if n % 2 != 0:
                multiply(a, b)

        matrix_power(matrix, n - 1)
        return matrix[0][0]
```

#### Complexity Analysis

```
Time complexity: O(log⁡N). By halving the N value in every matrix_power's call to itself, we are halving the work needed to be done.
Space complexity: O(log⁡N). The size of the stack in memory is proportional to the function calls to matrix_power plus the memory used to account for the matrices which use constant space.
```


