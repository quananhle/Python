## [702. Search in a Sorted Array of Unknown Size](https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size)

```Tag```: ```Binary Search``` ```Bitwise Manipulations```

#### Difficulty: Medium

This is an __interactive problem.__

You have a sorted array of __unique__ elements and an __unknown size__. You do not have an access to the array but you can use the ```ArrayReader``` interface to access it. You can call ```ArrayReader.get(i)``` that:

- returns the value at the ```i```<sup>```th```</sup> index (__0-indexed__) of the secret array (i.e., __secret[i]__), or
- returns ```2```<sup>```31```</sup>``` - 1``` if the ```i``` is out of the boundary of the array.

You are also given an integer ```target```.

Return _the index ```k``` of the hidden array where ```secret[k] == target``` or return ```-1``` otherwise_.

You must write an algorithm with ```O(log n)``` runtime complexity.

![image](https://user-images.githubusercontent.com/35042430/230826162-cb7d2f90-f1b3-482c-81d4-315bf8fbdef7.png)

---

__Example 1:__
```
Input: secret = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in secret and its index is 4.
```

__Example 2:__
```
Input: secret = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in secret so return -1.
```

__Constraints:__

- 1 <= ```secret.length``` <= 10<sup>4</sup>
- -10<sup>4</sup> <= ```secret[i]```, ```target``` <= 10<sup>4</sup>
- ```secret``` is sorted in a __strictly increasing__ order.

---

The array is sorted, i.e. one could try to fit into a logarithmic time complexity. That means two subproblems, and both should be done in a logarithmic time:

- Define search limits, i.e. left and right boundaries for the search.
- Perform binary search in the defined boundaries.

![image](https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/Figures/702/way.png)

__Define Search Boundaries__

![image](https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/Figures/702/limits.png)

If the target now is less than the right element, we're done, the boundaries are set. If not, repeat these two steps till the boundaries are established:

- Move the left boundary to the right: ```left = right```.
- Extend the right boundary: ```right = right * 2```.

![image](https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/Figures/702/done.png)

__Perform Binary Search__

- If the ```target``` value is equal to the middle element - we're done.
- If the ```target``` value is smaller - continue to search on the left.
- If the ```target``` value is larger - continue to search on the right.

![IMAGE](https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/Figures/702/binary2.png)

__Prerequisites__: left and right shifts

To speed up, one could use here [bitwise shifts](https://wiki.python.org/moin/BitwiseOperators):

![image](https://user-images.githubusercontent.com/35042430/230841537-5483d52e-5c1e-4ada-bdfd-0740d49849d9.png)

- Left shift: ```x << 1```. The same as __multiplying__ by ```2```: ```x * 2```.
- Right shift: ```x >> 1```. The same as __dividing__ by ```2```: ```x / 2```.

```Python
# """
# This is ArrayReader's API interface.
# You should not implement it, or speculate about its implementation
# """
#class ArrayReader:
#    def get(self, index: int) -> int:

class Solution:
    def search(self, reader: 'ArrayReader', target: int) -> int:
        if reader.get(0) == target:
            return 0
        
        # Define the boundaries
        lo, hi = 0, 1
        while reader.get(hi) < target:
            lo = hi
            '''
            hi = hi * 2
            '''
            hi <<= 1
        
        # Binary search
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            num = reader.get(mi)

            if num == target:
                return mi
            else:
                if num < target:
                    lo = mi + 1
                else:
                    hi = mi - 1
        
        return -1
```
