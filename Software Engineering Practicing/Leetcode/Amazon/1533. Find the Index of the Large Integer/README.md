## 1533. Find the Index of the Large Integer

```Tag```: ```Binary Search```

#### Difficulty: Medium

We have an integer array ```arr```, where all the integers in ```arr``` are equal except for one integer which is larger than the rest of the integers. You will not be given direct access to the array, instead, you will have an __API__ ```ArrayReader``` which have the following functions:

- ```int compareSub(int l, int r, int x, int y)```: where ```0 <= l, r, x, y < ArrayReader.length()```, ```l <= r and x <= y```. The function compares the sum of sub-array ```arr[l..r]``` with the sum of the sub-array ```arr[x..y]``` and returns:
  - ```1``` if ```arr[l]+arr[l+1]+...+arr[r] > arr[x]+arr[x+1]+...+arr[y]```.
  - ```0``` if ```arr[l]+arr[l+1]+...+arr[r] == arr[x]+arr[x+1]+...+arr[y]```.
  - ```-1``` if ```arr[l]+arr[l+1]+...+arr[r] < arr[x]+arr[x+1]+...+arr[y]```.
- ```int length()```: Returns the size of the array.

You are allowed to call ```compareSub()``` __20 times__ at most. You can assume both functions work in ```O(1)``` time.

Return _the index of the array ```arr``` which has the largest integer_.

![image](https://user-images.githubusercontent.com/35042430/212568856-9e45bf9e-a3e5-45e3-a66c-d181b70557b1.png)

---

__Example 1:__
```
Input: arr = [7,7,7,7,10,7,7,7]
Output: 4
Explanation: The following calls to the API
reader.compareSub(0, 0, 1, 1) // returns 0 this is a query comparing the sub-array (0, 0) with the sub array (1, 1), (i.e. compares arr[0] with arr[1]).
Thus we know that arr[0] and arr[1] doesn't contain the largest element.
reader.compareSub(2, 2, 3, 3) // returns 0, we can exclude arr[2] and arr[3].
reader.compareSub(4, 4, 5, 5) // returns 1, thus for sure arr[4] is the largest element in the array.
Notice that we made only 3 calls, so the answer is valid.
```

__Example 2:__
```
Input: nums = [6,6,12]
Output: 2
```

__Constraints:__
```
2 <= arr.length <= 5 * 105
1 <= arr[i] <= 100
All elements of arr are equal except for one element which is larger than all other elements.
```

__Follow up:__
```
What if there are two numbers in arr that are bigger than all other numbers?
What if there is one number that is bigger than other numbers and one number that is smaller than other numbers?
```

---

### Iterative Binary Search

```Python
# """
# This is ArrayReader's API interface.
# You should not implement it, or speculate about its implementation
# """
#class ArrayReader(object):
#	 # Compares the sum of arr[l..r] with the sum of arr[x..y]
#	 # return 1 if sum(arr[l..r]) > sum(arr[x..y])
#	 # return 0 if sum(arr[l..r]) == sum(arr[x..y])
#	 # return -1 if sum(arr[l..r]) < sum(arr[x..y])
#    def compareSub(self, l: int, r: int, x: int, y: int) -> int:
#
#	 # Returns the length of the array
#    def length(self) -> int:
#

class Solution:
    def getIndex(self, reader: 'ArrayReader') -> int:
        # Binary Search
        #### Time Complexity : O(logN), binary search
        #### Space Complexity: O(1), constant memory space for pointers
        lo, hi = 0, reader.length() - 1
        while lo < hi:
            '''
            mid = lo + (hi - lo >> 1)
            '''
            mid = lo + (hi - lo) // 2
            # Check if the size of arr is even
            if (hi - lo + 1) % 2 == 0:
                compare = reader.compareSub(lo, mid, mid + 1, hi)
            else:
                compare = reader.compareSub(lo, mid, mid, hi)
            # Check if compare == -1, largest integer is in the right half of the array
            if compare < 0:
                # Update the boundary of subarray
                lo = mid + 1
            # Check if compare >= 0, largest integer is in the left half of the array
            else:
                hi = mid
        return lo
```

### Recursive Binary Search

```Python
# """
# This is ArrayReader's API interface.
# You should not implement it, or speculate about its implementation
# """
#class ArrayReader(object):
#	 # Compares the sum of arr[l..r] with the sum of arr[x..y]
#	 # return 1 if sum(arr[l..r]) > sum(arr[x..y])
#	 # return 0 if sum(arr[l..r]) == sum(arr[x..y])
#	 # return -1 if sum(arr[l..r]) < sum(arr[x..y])
#    def compareSub(self, l: int, r: int, x: int, y: int) -> int:
#
#	 # Returns the length of the array
#    def length(self) -> int:
#

class Solution:
    def getIndex(self, reader: 'ArrayReader') -> int:
        # Binary Search
        #### Time Complexity : O(logN), binary search
        #### Space Complexity: O(1), constant memory space for pointers
        def binary_search(left: int, right: int) -> int:
            if left == right:
                return left
            mid = (right - left + 1) // 2
            compare = reader.compareSub(left, left + mid - 1, left + mid, left + mid + mid - 1)
            # Check if largest integer is in the lower boundary of the array
            if compare == 1:
                # Shrink the search boundary to the left
                return binary_search(left, left + mid - 1)
            # Check if largest integer is in the upper boundary of the array
            elif compare == -1:
                # Shrink the search boundary to the right
                return binary_search(left + mid, left + mid + mid - 1)
            # Otherwise, found the integer
            else:
                return right

        return binary_search(0, reader.length() - 1)
```
