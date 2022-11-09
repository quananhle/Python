## 204. Count Primes

#### Difficulty: Medium

```
Given an integer n, return the number of prime numbers that are strictly less than n.
```

#### Example 1:
```
Input: n = 10
Output: 4
Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
```

#### Example 2:
```
Input: n = 0
Output: 0
```

#### Example 3:
```
Input: n = 1
Output: 0
```

#### Constraints:
```
0 <= n <= 5 * 106
```
---

Suppose we are required to count the number of primes that are less than ```21```. Start by creating an array that contains ```21``` integers (each index represents an integer).

![image](https://leetcode.com/problems/count-primes/Figures/204/img1.png)
Figure 1. An array of 21 integers which we'll use to mark primes and non-primes.

Now, let's start with the smallest prime number we know, which is ```2```. We mark the multiples of this number as non-primes in the array. To mark a number as non-prime, we set a sentinel value of ```-1``` in the array at the index corresponding to that number. E.g. the number 4 is not a prime number, so we mark ```primes[4] = -1```.

![image](https://leetcode.com/problems/count-primes/Figures/204/img2.png)
Figure 2. Multiples of 2 marked as composites in the array.

Now let's move on to the next available element in the array that has not yet been marked as a composite number. That number is ```3```, which is also a prime. Now, we repeat the same process with 3 i.e. we mark all the multiples (some will be repeats like 6) as composites.

![image](https://leetcode.com/problems/count-primes/Figures/204/img3.png)
Figure 3. Multiples of 3 are marked as composites in the array.

At this point, you may notice that all of the numbers remaining in the array (that are not marked as composites) are primes.

![image](https://leetcode.com/problems/count-primes/Figures/204/img4.png)
Figure 4. Highlighting the remaining numbers as primes.

We can start with the smallest prime number, 2, and mark all of its multiples up to "n" as non-primes. Then we repeat the same process for the next available number in the array that is not marked as composite and so on.

```{Python}
class Solution(object):
    def countPrimes(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Smallest prime number is 2, thus if n = 2, return 0
        if n <= 2:
            return 0
        """
        Generate a list of size n, and assume that all of the numbers in the list are primes.
        If non-prime number found, flag the number. Count the un-flagged for the number of prime numbers
        """
        primers = [True] * n
        """
        For any n > 3, 0 and 1 to be flagged as non-prime numbers, i.e. for n = 10, the list should be like below:
        primers = [False, False, True, True, True, True, True, True, True, True]
        """
        # [False, False] + [True] * (n - 2)
        primers[0:2] = [False, False]
        """
        Since only non-prime numbers are to be searched for, any number in the range of (2,n)
        that are the multiple of 2 or 3 are to be flagged.
        i.e. for n = 10, prime numbers are 2, 3, 5, 7, and non-prime numbers (except 0 and 1) are:
        4 = 2 * 2
        6 = 2 * 3
        8 = 2 * 2 * 2
        9 = 3 * 3
        Hence, it is not necessary to travel through the entire list of size n, only i*i < n
        """
        # loop through n at i^2 steps, starting at 2
        i = 2
        while i*i < n:
            # if prime number found:
            if primers[i]:
                # travel at every i pace
                for j in range(i*i, n, i):
                    # change the flag to non-prime number
                    primers[j] = False
            i += 1
        return sum(primers)
```
