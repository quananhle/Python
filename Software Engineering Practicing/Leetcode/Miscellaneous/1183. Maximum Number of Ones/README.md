## [1183. Maximum Number of Ones](https://leetcode.com/problems/maximum-number-of-ones/)

```Tag```: ```Greedy```

#### Difficulty: Hard

Consider a matrix ```M``` with dimensions ```width * height```, such that every cell has value ```0``` or ```1```, and any square sub-matrix of ```M``` of size ```sideLength * sideLength``` has at most ```maxOnes``` ones.

Return _the maximum possible number of ones that the matrix ```M``` can have_.

![image](https://github.com/quananhle/Python/assets/35042430/acc9b3db-b86e-41c3-b128-54b21de3159b)

---

__Example 1:__
```
Input: width = 3, height = 3, sideLength = 2, maxOnes = 1
Output: 4
Explanation:
In a 3*3 matrix, no 2*2 sub-matrix can have more than 1 one.
The best solution that has 4 ones is:
[1,0,1]
[0,0,0]
[1,0,1]
```

__Example 2:__
```
Input: width = 3, height = 3, sideLength = 2, maxOnes = 2
Output: 6
Explanation:
[1,0,1]
[1,0,1]
[1,0,1]
```

__Constraints:__

- $1 \le width, height \le 100$
- $1 \le sideLength \le width, height$
- $0 \le maxOnes \le sideLength \cdot sideLength$

---

### Greedy

![image](https://leetcode.com/problems/maximum-number-of-ones/Figures/1183/2.png)

This is equivalent to tiling the given matrix with duplicates of the top-left window.

![image](https://leetcode.com/problems/maximum-number-of-ones/Figures/1183/5.png)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(1)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def maximumNumberOfOnes(self, width: int, height: int, sideLength: int, maxOnes: int) -> int:
        m, n = height, width
        ans = maxOnes * ((m // sideLength) * (n // sideLength))
        curr = maxOnes

        side_square = min((m % sideLength) * (n % sideLength), curr)
        ans += ((m // sideLength) + (n // sideLength) + 1) * side_square
        curr -= side_square

        if m // sideLength > n // sideLength:
            side_square2 = min(((n % sideLength) * sideLength) - ((m % sideLength) * (n % sideLength)), curr)
            ans += (m // sideLength) * side_square2
            curr -= side_square2
            side_square3 = min(((m % sideLength) * sideLength) - ((m % sideLength) * (n % sideLength)), curr)
            ans += (n // sideLength) * side_square3
            curr -= side_square3
        else:
            side_square2 = min(((m % sideLength) * sideLength) - ((m % sideLength) * (n % sideLength)), curr)
            ans += (n // sideLength) * side_square2
            curr -= side_square2
            side_square3 = min(((n % sideLength) * sideLength) - ((m % sideLength) * (n % sideLength)), curr)
            ans += (m // sideLength) * side_square3
            curr -= side_square3

        return ans
```

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(\text{sideLength}^2 \cdot\log \text{sideLength}^2)$
- __Space Complexity__: $\mathcal{O}(\text{sideLength}^2)$

```Python
class Solution:
    def maximumNumberOfOnes(self, width: int, height: int, sideLength: int, maxOnes: int) -> int:
        count = []
        
        for row in range(sideLength):
            for col in range(sideLength):
                num = (1 + (width - col - 1) // sideLength) * (1 + (height - row - 1) // sideLength)
                count.append(num)
                
        count.sort(reverse=True)
        return sum(count[:maxOnes])
```
