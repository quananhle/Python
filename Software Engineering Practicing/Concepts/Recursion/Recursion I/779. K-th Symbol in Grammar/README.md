## 779. K-th Symbol in Grammar

```Tag```: ```Recursion```

#### Difficulty: Medium

We build a table of ```n``` rows (__1-indexed__). We start by writing ```0``` in the 1<sup>st</sup> row. Now in every subsequent row, we look at the previous row and replace each occurrence of ```0``` with ```01```, and each occurrence of ```1``` with ```10```.

For example, for ```n = 3```, the 1<sup>st</sup> row is ```0```, the 2<sup>nd</sup> row is ```01```, and the 3<sup>rd</sup> row is ```0110```.
Given two integer ```n``` and ```k```, return _the k<sup>th</sup> (__1-indexed__) symbol in the n<sup>th</sup> row of a table of ```n``` rows_.

![image](https://user-images.githubusercontent.com/35042430/217025342-0682e08f-7e78-4f97-8d11-465bee862b93.png)

---

__Example 1:__
```
Input: n = 1, k = 1
Output: 0
Explanation: row 1: 0
```

__Example 2:__
```
Input: n = 2, k = 1
Output: 0
Explanation: 
row 1: 0
row 2: 01
```

__Example 3:__
```
Input: n = 2, k = 2
Output: 1
Explanation: 
row 1: 0
row 2: 01
```

__Constraints:__

- ```1 <= n <= 30```
- ```1 <= k <= 2^(n - 1)```

---

### Brute Force

```Python
class Solution:
    def kthGrammar(self, n: int, k: int) -> int:
        # Brute Force
        ### Time Limit Exceeded
        col_memo = {"0":"01", "1":"10"}

        '''
        # Base cases
        row_memo[1], row_memo[2], row_memo[3] = "0", "01", "0110"
        '''
        row_memo = ["0", "01", "0110"]

        if n < 3 and len(row_memo[n]) <= k:
            return int(row_memo[n-1][k-1])
        
        for i in range(3, n+1):
            row = list()
            for j in range(len(row_memo[i-1])):
                if row_memo[i-1][j] == "0":
                    row.append(col_memo["0"])
                elif row_memo[i-1][j] == "1":
                    row.append(col_memo["1"])
            row_memo.append(''.join(row))

        return int(row_memo[n-1][k-1])
```

### Recursion

```Python
class Solution:
    def kthGrammar(self, n: int, k: int) -> int:
        '''
        row 1: 0
        row 2: 01
        row 3: 0110
        row 4: 01101001
        row 5: 0110100110010110
        row 6: 01101001100101101001011001101001
        row 7: 0110100110010110100101100110100110010110011010010110100110010110
        ...
        '''
        # Base cases
        if n == 1:
            return 0
        if n == 2:
            if k == 1: return 0
            if k == 2: return 1
        
        # For any nth level, the size of the row is 2**(n-1), and half the size of the current row equals the size of the previous row
        prev_row_size = 2**(n - 2)

        # Check if k index is in the first half of the current row
        if k <= prev_row_size:
            return self.kthGrammar(n - 1, k)
        # Otherwise, k index is in the second half of the current row
        else:
            if self.kthGrammar(n - 1, k - prev_row_size) == 0:
                return 1
            else:
                return 0

        '''
        row 4: 0 1 1 0 1 0 0 1
               | | | | | | | |
               1 2 3 4 5 6 7 8
        row 4 size = 8
        row 3 size = 4
        row 2 size = 2
        row 1 size = 1
        Case 1: k = 3 => k < 4 -> self.kthGrammar(3, 3) -> k > 2 -> self.kthGrammar(2, 1)
                                                                 -> k == 1 -> self.kthGrammar(1, 1) -> n == 1: self.kthGrammar(2, 1) == 0
                                                                 -> return 1
        Case 1: k = 7 => k > 4 -> self.kthGrammar(3, 3)
                               -> k > 2 -> self.kthGrammar(2, 1)
                                        -> k == 1 -> self.kthGrammar(1, 1) -> n == 1: self.kthGrammar(2, 1) == 0
                                        -> self.kthGrammar(3, 3) == 1
                               -> return 0
        '''
```
