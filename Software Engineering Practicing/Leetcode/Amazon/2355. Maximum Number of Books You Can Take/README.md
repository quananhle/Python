## [2355. Maximum Number of Books You Can Take](https://leetcode.com/problems/maximum-number-of-books-you-can-take)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

You are given a __0-indexed__ integer array ```books``` of length ```n``` where ```books[i]``` denotes the number of books on the i<sup>th</sup> shelf of a bookshelf.

You are going to take books from a contiguous section of the bookshelf spanning from ```l``` to ```r``` where $0 \le l \le r \lt n$. For each index ```i``` in the range $l \le i \lt r$, you must take strictly fewer books from shelf ```i``` than shelf ```i + 1```.

Return _the __maximum__ number of books you can take from the bookshelf_.

![image](https://github.com/quananhle/Python/assets/35042430/1b8479ac-7f2d-4845-b58e-87e2e61fe7ff)

---

__Example 1:__
```
Input: books = [8,5,2,7,9]
Output: 19
Explanation:
- Take 1 book from shelf 1.
- Take 2 books from shelf 2.
- Take 7 books from shelf 3.
- Take 9 books from shelf 4.
You have taken 19 books, so return 19.
It can be proven that 19 is the maximum number of books you can take.
```

__Example 2:__
```
Input: books = [7,0,3,4,5]
Output: 12
Explanation:
- Take 3 books from shelf 2.
- Take 4 books from shelf 3.
- Take 5 books from shelf 4.
You have taken 12 books so return 12.
It can be proven that 12 is the maximum number of books you can take.
```

__Example 3:__
```
Input: books = [8,2,3,7,3,4,0,1,4,3]
Output: 13
Explanation:
- Take 1 book from shelf 0.
- Take 2 books from shelf 1.
- Take 3 books from shelf 2.
- Take 7 books from shelf 3.
You have taken 13 books so return 13.
It can be proven that 13 is the maximum number of books you can take.
```

__Constraints:__

- $1 \le books.length \le 10^5$
- $0 \le books[i] \le 10^5$

---

### Dynamic Programming Framework

#### Top-Down Dynamic Programming

```Python
class Solution:
    def maximumBooks(self, books: List[int]) -> int:
        n = len(books)
        ans = float("-inf")
        memo = {}

        def dp(i, prev_book_taken):
            if i == n:
                return 0

            if (i, prev_book_taken) in memo:
                return memo[(i, prev_book_taken)]
 
            # DP Transitions
            take = 0
            for j in range(books[i], 0, -1):
                if prev_book_taken >= j:
                    continue

                take = max(take, j + dp(i + 1, j))
            
            memo[(i, prev_book_taken)] = take
            return memo[(i, prev_book_taken)]
        
        for i in range(n):
            ans = max(ans, dp(i, 0))
        return ans
```

![image](https://leetcode.com/problems/maximum-number-of-books-you-can-take/Figures/2355/2355_example_1.drawio.png)

![image](https://github.com/quananhle/Python/assets/35042430/24c5b24b-2eae-4c7c-9771-28222594cb83)

![image](https://leetcode.com/problems/maximum-number-of-books-you-can-take/Figures/2355/2355_constraint.drawio.png)

![image](https://leetcode.com/problems/maximum-number-of-books-you-can-take/Figures/2355/2355_index_j.drawio.png)

![image](https://leetcode.com/problems/maximum-number-of-books-you-can-take/Figures/2355/2355_arithmetic_progressions.drawio.png)

![image](https://github.com/quananhle/Python/assets/35042430/74f675b8-daa5-4dc8-9570-75680e487f18)

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def maximumBooks(self, books: List[int]) -> int:
        n = len(books)

        def calculate_arithmetic_sum(left, right):
            count = min(books[right], right - left + 1)
            return (2 * books[right] - (count - 1)) * count // 2
        
        stack = list()
        dp = [0] * n

        for i in range(n):
            while stack and books[stack[-1]] - stack[-1] >= books[i] - i:
                stack.pop()
            
            if not stack:
                dp[i] = calculate_arithmetic_sum(0, i)
            else:
                j = stack[-1]
                dp[i] = dp[j] + calculate_arithmetic_sum(j + 1, i)
            
            stack.append(i)
        
        return max(dp)
```
