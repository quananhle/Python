## [799. Champagne Tower](https://leetcode.com/problems/champagne-tower)

```Tag```: ```Dynamic Programming``` ```Pascal Triangle```

#### Difficulty: Medium

We stack glasses in a pyramid, where the __first__ row has ```1``` glass, the second row has ```2``` glasses, and so on until the $100^{th}$ row.  Each glass holds one cup of champagne.

Then, some champagne is poured into the first glass at the top.  When the topmost glass is full, any excess liquid poured will fall equally to the glass immediately to the left and right of it.  When those glasses become full, any excess champagne will fall equally to the left and right of those glasses, and so on.  (A glass at the bottom row has its excess champagne fall on the floor.)

For example, after one cup of champagne is poured, the top most glass is full.  After two cups of champagne are poured, the two glasses on the second row are half full.  After three cups of champagne are poured, those two cups become full - there are 3 full glasses total now.  After four cups of champagne are poured, the third row has the middle glass half full, and the two outside glasses are a quarter full, as pictured below.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/03/09/tower.png)

Now after pouring some non-negative integer cups of champagne, return _how full the j<sup>th</sup> glass in the i<sup>th</sup> row is (both ```i``` and ```j``` are 0-indexed.)_

![image](https://github.com/quananhle/Python/assets/35042430/2cb37a28-dee4-4566-bc1e-d515dbf1682c)

---

__Example 1:__
```
Input: poured = 1, query_row = 1, query_glass = 1
Output: 0.00000
Explanation: We poured 1 cup of champange to the top glass of the tower (which is indexed as (0, 0)). There will be no excess liquid so all the glasses under the top glass will remain empty.
```

__Example 2:__
```
Input: poured = 2, query_row = 1, query_glass = 1
Output: 0.50000
Explanation: We poured 2 cups of champange to the top glass of the tower (which is indexed as (0, 0)). There is one cup of excess liquid. The glass indexed as (1, 0) and the glass indexed as (1, 1) will share the excess liquid equally, and each will get half cup of champange.
```

__Example 3:__
```
Input: poured = 100000009, query_row = 33, query_glass = 17
Output: 1.00000
```

__Constraints:__

- $0 \le poured \le 10^{9}$
- $0 \le query{\textunderscore}glass \le query_row \lt 100$

---

### Dynamic Programming Framework

#### Top-down Dynamic Programming

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{2})$
- __Space Complexity__: $\mathcal{O}(N^{2})$

```Python

```

#### Bottom-Up Dynamic Programming (2D Array)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{2})$
- __Space Complexity__: $\mathcal{O}(N^{2})$

```Python
class Solution:
    def champagneTower(self, poured: int, query_row: int, query_glass: int) -> float:
        triangle = [[0] * row for row in range(1, 102)]
        # Initialize the base case for the topmost glass
        triangle[0][0] = poured

        # Traverse each row up to the query row
        for row in range(query_row + 1):
            # Traverse each glass in the current level
            for col in range(row + 1):
                # Compute the overflow amount to ditribute to two adjacent glasses
                overflow = (triangle[row][col] - 1.0) / 2.0
                # If there is overflow, distribute it to the two glass directly under the current glass
                if overflow > 0:
                    triangle[row + 1][col] += overflow
                    triangle[row + 1][col + 1] += overflow

        # If there is an overflow in query glass, the glass can only hold at most a full cup of champagne or 1.0
        # If there is not an overflow in query glass, the glass can hold from 0.0 <= poured < 1.0
        return min(1.0, triangle[query_row][query_glass])
```

#### Bottom-Up Dynamic Programming (1D Array)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N^{2})$
- __Space Complexity__: $\mathcal{O}(N^{2})$

```Python
class Solution:
    def champagneTower(self, poured: int, query_row: int, query_glass: int) -> float:
        # Initialize the current level with the poured amount in the top glass
        current_level = [poured]

        # Traverse each row up to the query row
        for row in range(query_row):
            # # Initialize the next level with the appropriate number of glasses for the current row
            next_level = [0.0] * (row + 2)
            # Traverse each glass in the current level
            for glass in range(len(current_level)):
                # Compute the overflow amount to ditribute to two adjacent glasses
                overflow = (current_level[glass] - 1.0) / 2.0
                # If there is overflow, distribute it to the two glass directly under the current glass
                if overflow > 0.0:
                    next_level[glass] += overflow
                    next_level[glass + 1] += overflow
            # Move the next level
            current_level = next_level
        
        # If there is an overflow in query glass, the glass can only hold at most a full cup of champagne or 1.0
        # If there is not an overflow in query glass, the glass can hold from 0.0 <= poured < 1.0
        return min(1.0, current_level[query_glass])
```