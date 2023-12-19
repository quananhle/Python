## [661. Image Smoother](https://leetcode.com/problems/image-smoother)

```Tag```: ```Matrix``` ```Breadth-First Search``` ```Math``` ```Bit Manipulation```

#### Difficulty: Easy

An image smoother is a filter of the size ```3 x 3``` that can be applied to each cell of an image by rounding down the average of the cell and the eight surrounding cells (i.e., the average of the nine cells in the blue smoother). If one or more of the surrounding cells of a cell is not present, we do not consider it in the average (i.e., the average of the four cells in the red smoother).

![image](https://assets.leetcode.com/uploads/2021/05/03/smoother-grid.jpg)

Given an ```m x n``` integer matrix ```img``` representing the grayscale of an image, return _the image after applying the smoother on each cell of it_.

![image](https://github.com/quananhle/Python/assets/35042430/8da342ad-8d18-4d6b-a03a-d9d641502c16)

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/05/03/smooth-grid.jpg)
```
Input: img = [[1,1,1],[1,0,1],[1,1,1]]
Output: [[0,0,0],[0,0,0],[0,0,0]]
Explanation:
For the points (0,0), (0,2), (2,0), (2,2): floor(3/4) = floor(0.75) = 0
For the points (0,1), (1,0), (1,2), (2,1): floor(5/6) = floor(0.83333333) = 0
For the point (1,1): floor(8/9) = floor(0.88888889) = 0
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/05/03/smooth2-grid.jpg)
```
Input: img = [[100,200,100],[200,50,200],[100,200,100]]
Output: [[137,141,137],[141,138,141],[137,141,137]]
Explanation:
For the points (0,0), (0,2), (2,0), (2,2): floor((100+200+200+50)/4) = floor(137.5) = 137
For the points (0,1), (1,0), (1,2), (2,1): floor((200+200+50+200+100+100)/6) = floor(141.666667) = 141
For the point (1,1): floor((50+200+200+200+200+100+100+100+100)/9) = floor(138.888889) = 138
```

__Constraints:__

- $m == img.length$
- $n == img[i].length$
- $1 \le m, n \le 200$
- $0 \le img[i][j] \le 255$

---

To compute the ```smooth_img[i][j]```, we may need to read the following cells from the ```img``` matrix.

- ```img[i][j]```, the cell itself.
- ```img[i - 1][j - 1]```, the cell that shares the top-left corner with this cell.
- ```img[i - 1][j]```, the cell that shares the top edge with this cell.
- ```img[i - 1][j + 1]```, the cell that shares the top-right corner with this cell.
- ```img[i][j - 1]```, the cell that shares the left edge with this cell.
- ```img[i][j + 1]```, the cell that shares the right edge with this cell.
- ```img[i + 1][j - 1]```, the cell that shares the bottom-left corner with this cell.
- ```img[i + 1][j]```, the cell that shares the bottom edge with this cell.
- ```img[i + 1][j + 1]```, the cell that shares the bottom-right corner with this cell.


### Breadth-First Search

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n)$
- __Space Complexity__: $\mathcal{O}(m \cdot n)$

```Python
class Solution:
    def imageSmoother(self, img: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(img), len(img[0])
        # 9 directions including not moving
        DIRECTIONS = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 0), (0, 1), (1, -1), (1, 0), (1, 1)]
        res = [[None] * COLS for _ in range(ROWS)]

        def bfs(row, col, total, count):
            for dx, dy in DIRECTIONS:
                new_row, new_col = row + dx, col + dy
                if not (0 <= new_row < ROWS and 0 <= new_col < COLS):
                    continue
                total += img[new_row][new_col]
                count += 1

            return total // count

        for row in range(ROWS):
            for col in range(COLS):
                res[row][col] = bfs(row, col, 0, 0)
        
        return res
```

```Python
class Solution:
    def imageSmoother(self, img: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(img), len(img[0])
        # 8 neighbor cells
        DIRECTIONS = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
        res = [[None] * COLS for _ in range(ROWS)]

        for row in range(ROWS):
            for col in range(COLS):
                total = img[row][col]
                count = 1

                for dx, dy in DIRECTIONS:
                    new_row, new_col = row + dx, col + dy
                    if not (0 <= new_row < ROWS and 0 <= new_col < COLS):
                        continue
                    total += img[new_row][new_col]
                    count += 1

                res[row][col] = total // count
        
        return res
```

#### Space Optimized BFS

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n)$
- __Space Complexity__: $\mathcal{O}(n)$

```Python
class Solution:
    def imageSmoother(self, img: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(img), len(img[0])
        temp = [None] * COLS

        for row in range(ROWS):
            for col in range(COLS):
                total = count = 0

                # Bottom neighbors
                if row + 1 < ROWS:
                    if col - 1 >= 0:
                        total += img[row + 1][col - 1]
                        count += 1
                    total += img[row + 1][col]
                    count += 1
                    
                    if col + 1 < COLS:
                        total += img[row + 1][col + 1]
                        count += 1
                
                # Right neighbor
                if col + 1 < COLS:
                    total += img[row][col + 1]
                    count += 1
                
                # Current cell
                total += img[row][col]
                count += 1

                # Left neighbor
                if col - 1 >= 0:
                    total += temp[col - 1]
                    count += 1
                
                # Top neighbors
                if row - 1 >= 0:
                    # Left-top corner-sharing neighbor.
                    if col - 1 >= 0:
                        total += prev_val
                        count += 1
                    
                    # Top edge-sharing neighbor.
                    total += temp[col]
                    count += 1

                    # Right-top corner-sharing neighbor.
                    if col + 1 < COLS:
                        total += temp[col + 1]
                        count += 1
                
                # Store the original value of temp[j], which represents original value of img[i - 1][j].
                if row - 1 >= 0:
                    prev_val = temp[col]

                # Save current value of img[i][j] in temp[j].
                temp[col] = img[row][col]
                # Overwrite with smoothed value.
                img[row][col] = total // count
            
        return img
```

#### Constant Space BFS

![image](https://github.com/quananhle/Python/assets/35042430/35c26591-98d4-4c82-815d-d367da71ae83)

![image](https://github.com/quananhle/Python/assets/35042430/6197b921-5b9e-4589-b9f8-9e3e63c7db3d)

![image](https://github.com/quananhle/Python/assets/35042430/5a57cc0c-2ffa-4e86-9dd7-71df560d8e4d)

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def imageSmoother(self, img: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(img), len(img[0])

        for row in range(ROWS):
            for col in range(COLS):
                total = count = 0

                for new_row in (row - 1, row, row + 1):
                    for new_col in (col - 1, col, col + 1): 
                        if not (0 <= new_row < ROWS and 0 <= new_col < COLS):
                            continue
                        # X = 256
                        total += img[new_row][new_col] % 256            # r
                        count += 1

                img[row][col] += (total // count) * 256                 # Y

        for row in range(ROWS):
            for col in range(COLS):
                img[row][col] //= 256                                   # p
            
        return img
```

---

### Bit Manipulation

![image](https://leetcode.com/problems/image-smoother/Figures/661/661_slide_images_used/Slide8.PNG)

This suggests the idea that in these 23 unused bits, we can store the smoothed value of ```img[i][j]```. This we can achieve by using bit-manipulation. In bit manipulation, we use the bit-wise operators.

Now the smoothed value is an average of nine values ranging from ```0``` to ```255```. Hence, the average will also lie between ```0``` to ```255```. Thus, the smoothed value will also require at most 8 bits to represent it. This we can store together as follows.

![image](https://leetcode.com/problems/image-smoother/Figures/661/661_slide_images_used/Slide9.PNG)

__How do we store smoothened corresponding values?__ Let's see.

Initially, the smoothened corresponding value was a separate integer, as shown in the figure below.

![image](https://leetcode.com/problems/image-smoother/Figures/661/661_slide_images_used/Slide10.PNG)

We can left shift (using the ```<<``` operator ) the integer so that the orientation now looks like as follows.

![image](https://leetcode.com/problems/image-smoother/Figures/661/661_slide_images_used/Slide11.PNG)

Now there is a property of bitwise OR ```(|)``` operator. ```x | 0 = x```. In the context of the diagram, doing bitwise OR of both these separate integers

- The most significant 16 bits will remain 0 because both integers have 0 in those bits.
- The least significant 8 bits will store the values of ```img[i][j]```
- The remaining 8 bits will store the values of the smoothened corresponding value.

![image](https://leetcode.com/problems/image-smoother/Figures/661/661_slide_images_used/Slide12.PNG)

__How can we extract the original value of img[i][j] from this mixed integer?__

In other words,

- We wish to set all except the least significant 8 bits to 0. The bitwise AND ```(&)``` operator has property of ```x & 0 = 0```. Thus to set the first 24 bits to 0, we can do bitwise AND with an integer that has the first 24 bits as ```0```.
- We wish to retain the least significant 8 bits as it is. The bitwise AND ```(&)``` operator has property of ```x & 1 = x```. Thus to retain the last 8 bits as it is, we can do bitwise AND with an integer that has the last 8 bits as ```1```.

Thus, the integer with which we can do bitwise AND ```(&)``` to extract the original value of ```img[i][j]``` is ```00000000000000000000000011111111```, which is ```255``` in decimal, and ```11111111``` in binary.

![image](https://leetcode.com/problems/image-smoother/Figures/661/661_slide_images_used/Slide13.PNG)

__How can we extract the smoothened value from this mixed integer, after we are done with computing all the smoothened values?__

As done above, we perhaps can do bitwise AND ```(&)``` with ```00000000000000001111111100000000```, which is ```65280``` in decimal, and ```1111111100000000``` in binary. This will retain the smoothened value bits as it is, turning off all other bits.

After that, to get the smoothened value, we can right shift (using the ```>>``` operator ) the integer by 8 bits (To encode, we did a left shift by 8 bits). This will bring the smoothened value to the least significant 8 bits.

However, readers can appreciate that only the right shift is sufficient to extract the smoothened value.

![image](https://leetcode.com/problems/image-smoother/Figures/661/661_slide_images_used/Slide14.PNG)

> The bit manipulation works because we have only 8 bits per pixel (abbreviated as "bpp"). The "bpp" is the number of bits used to represent the color of a single pixel in a bitmapped image or video frame buffer. Hence, we can use the remaining bits to store the smoothened value.

- Bitwise AND ```(&)``` with 255 $\equiv$ modulo by ```256```
- Left shift ```(<<)``` by 8 bits $\equiv$ multiply by ```256```
- Bitwise OR ```(|)``` of smoothened value with ```img[i][j]``` provided least significant 8 bits of the left-shifted smoothened value are ```0``` $\equiv$ add ```img[i][j]```
- Right shift ```(>>)``` by 8 bits $\equiv$ divide by ```256```

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(m \cdot n)$
- __Space Complexity__: $\mathcal{O}(1)$

```Python
class Solution:
    def imageSmoother(self, img: List[List[int]]) -> List[List[int]]:
        ROWS, COLS = len(img), len(img[0])

        for row in range(ROWS):
            for col in range(COLS):
                total = count = 0

                for new_row in (row - 1, row, row + 1):
                    for new_col in (col - 1, col, col + 1): 
                        if not (0 <= new_row < ROWS and 0 <= new_col < COLS):
                            continue
                        # X = 256
                        total += img[new_row][new_col] & 255            # r
                        count += 1

                img[row][col] |= (total // count) << 8                  # Y

        for row in range(ROWS):
            for col in range(COLS):
                img[row][col] >>= 8                                     # p
            
        return img
```
