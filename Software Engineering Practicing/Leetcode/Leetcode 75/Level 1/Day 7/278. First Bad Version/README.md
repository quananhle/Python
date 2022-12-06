## 278. First Bad Version

#### Difficulty: Easy

You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have ```n``` versions ```[1, 2, ..., n]``` and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API ```bool isBadVersion(version)``` which returns whether ```version``` is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

![image](https://user-images.githubusercontent.com/35042430/205960660-255ca9c2-2c91-4411-bbd7-3d241a62e2f8.png)

---

__Example 1:__
```
Input: n = 5, bad = 4
Output: 4
Explanation:
call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true
Then 4 is the first bad version.
```

__Example 2:__
```
Input: n = 1, bad = 1
Output: 1
```

__Constraints:__
```
1 <= bad <= n <= 231 - 1
```

---

### Binary Search

```Python
# The isBadVersion API is already defined for you.
# @param version, an integer
# @return a bool
# def isBadVersion(version):

class Solution(object):
    def firstBadVersion(self, n):
        """
        :type n: int
        :rtype: int
        """
        # Linear Search
        ### Time Limit Exceeded
        #### Time Complexity: O(N)
        #### Space Complexity: O(1)
        """
        for i in range(n+1):
            if isBadVersion(i):
                 return i
        """
        # Binary Search
        #### Time Complexity: O(logN)
        #### Space Complexity: O(1)
        left, right = 1, n
        while left < right:
            # To avoid overflow of right+left
            mid = left + (right-left) / 2
            if isBadVersion(mid):
                # If mid is bad, narrow the search to the first half
                right = mid
            else:
                # If mid is not bad, narrow the search to the second half
                left = mid + 1
        # Return the first element
        return left
```

```Python
class Solution(object):
    def firstBadVersion(self, n):
        """
        :type n: int
        :rtype: int
        """
        left, right = 0, n
        while left <= right:
            mid = (left+right) // 2
            if isBadVersion(mid):
                # If mid is bad, narrow the search to the first half
                right = mid - 1
                current = mid
            else:
                # If mid is not bad, narrow the search to the second half
                left = mid + 1
        return current
```


