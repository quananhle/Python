## [658. Find K Closest Elements](https://leetcode.com/problems/find-k-closest-elements)

```Tag```: ```Binary Search``` ```Sliding Window```

#### Difficulty: Medium

Given a sorted integer array ```arr```, two integers ```k``` and ```x```, return _the ```k``` closest integers to ```x``` in the array_. The result should also be sorted in ascending order.

An integer ```a``` is closer to ```x``` than an integer ```b``` if:

- ```|a - x| < |b - x|```, or
- ```|a - x| == |b - x|``` and ```a < b```

![image](https://user-images.githubusercontent.com/35042430/230222433-051e5057-225b-4e5e-a5fa-eca1c06fb7fc.png)

---
 
__Example 1:__
```
Input: arr = [1,2,3,4,5], k = 4, x = 3
Output: [1,2,3,4]
```

__Example 2:__
```
Input: arr = [1,2,3,4,5], k = 4, x = -1
Output: [1,2,3,4]
```

__Constraints:__

- ```1 <= k <= arr.length```
- 1 <= ```arr.length``` <= 10<sup>4</sup>
- ```arr``` is sorted in ascending order.
- -10<sup>4</sup> <= ```arr[i]```, ```x``` <= 10<sup>4</sup>

---

### Binary Search & Sliding Window

__Algorithm__

1. As a base case, if ```arr.length == k```, return ```arr```.
2. Use binary search to find the index of the closest element to ```x``` in ```arr```. Initailize two pointers ```left``` and ```right```, with ```left``` set equal to this index, and ```right``` equal to this index plus one.
3. While the window's size is less than ```k```, check which number is closer to ```x```: ```arr[left]``` or ```arr[right]```. Whichever pointer has the closer number, move that pointer towards the edge to include that element in our output.
4. Return the elements inside ```arr``` contained within the window defined between ```left``` and ```right```.

```Python
class Solution:
    def findClosestElements(self, arr: List[int], k: int, x: int) -> List[int]:
        n = len(arr)
        
        if len(arr) == k: return arr
        
        '''
        def binary_search(x):
            lo, hi = 0, n - 1
            
            while lo < hi:
                mi = lo + (hi - lo) // 2
                
                if arr[mi] < x:
                    lo = mi + 1
                else:
                    hi = mi

            return lo

        left = binary_search(x) - 1
        right = binary_search(x)
        '''
        
        left = bisect_left(arr, x) - 1
        right = bisect_left(arr, x)

        # While the window's size is less than k
        while right - left - 1 < k:
            # Check if left at the beginning of the array, expand window to the right
            if left == -1:
                right += 1
                continue
            # Check if right at the end of the array, or |a - x| <= |b - x|, expend window to the left
            elif right == n or abs(arr[left] - x) <= abs(arr[right] - x):
                left -= 1
            else:
                right += 1
            
        return arr[left + 1:right]
```

### Binary Search

__Algorithm__

1. Initalize two variables to perform binary search with, ```lo = 0``` and ```hi = len(arr) - k```.
2. Perform a binary search. At each operation, calculate ```mi = lo + (hi - lo) // 2``` and compare the two elements located at ```arr[mi]``` and ```arr[mi + k]```. If the element at ```arr[mi]``` is closer to ```x```, then move the ```hi``` pointer. If the element at ```arr[mi + k]``` is closer to ```x```, then move the ```lo``` pointer. Remember, the smaller element always wins when there is a tie.
3. At the end of the binary search, we have located the leftmost index for the final answer. Return the subarray starting at this index that contains ```k``` elements.

```Python

```
