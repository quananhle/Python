## [374. Guess Number Higher or Lower](https://leetcode.com/problems/guess-number-higher-or-lower/)

```Tag```: ```Binary Search```

#### Difficulty: Easy

We are playing the ```Guess Game```. The game is as follows:

I pick a number from ```1 to n```. You have to guess which number I picked.

Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

You call a pre-defined API ```int guess(int num)```, which returns three possible results:

    -1: Your guess is higher than the number I picked (i.e. num > pick).
  
    1: Your guess is lower than the number I picked (i.e. num < pick).
  
    0: your guess is equal to the number I picked (i.e. num == pick).
  
Return the number that I picked.

![image](https://user-images.githubusercontent.com/35042430/229698096-6b71444e-20c7-48cc-8b23-70ecf5de2f19.png)

---

#### Example 1:

```
Input: n = 10, pick = 6
Output: 6
```

#### Example 2:

```
Input: n = 1, pick = 1
Output: 1
```

#### Example 3:

```
Input: n = 2, pick = 1
Output: 1
```

#### Constraints:
```
1 <= n <= 231 - 1
1 <= pick <= n
```

### Linear Search

```Python
# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num: int) -> int:

class Solution:
    def guessNumber(self, n: int) -> int:
        for i in range(1, n):
            if guess(i) == 0:
                return i
        
        return n
```

```Python
# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num):

class Solution(object):
    def guessNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Brute Force (Optimized)
        #### Time complexity: O(N/2) = O(N), loop twice as fast than linear time by doing 2 comparisons at once
        #### Space complexity: O(1), no extra space required
        """
        lo = 1
        hi = n
        '''
        while lo <= hi:
            if guess(lo) != 0 and guess(hi) != 0:
                if guess(lo) > 0:
                    lo += 1
                if guess(hi) < 0:
                    hi -= 1
            else:
                return lo if guess(lo) == 0 else hi
        ''' 
        while guess(lo) > 0 and guess(hi) < 0:
            lo += 1
            hi += 1
        return lo if guess(lo) == 0 else hi
```

### Binary Search

```Python
# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num):

class Solution(object):
    def guessNumber(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Binary Search
        #### Time complexity: O(logN), binary search divide the range (1,n) to 2 for every search
        #### Space complexity: O(1), no extra space required
        lo = 1
        hi = n
        while lo <= hi:
            mid = lo + (hi-lo)/2
            ans = guess(mid)     
            if ans < 0:
                hi = mid - 1
            elif ans > 0:
                lo = mid + 1
            else:
                return mid
```
