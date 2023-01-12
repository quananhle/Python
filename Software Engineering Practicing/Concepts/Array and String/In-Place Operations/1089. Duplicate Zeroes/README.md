## 1089. Duplicate Zeroes

```Tag```: ```Array``` ```Sliding Window```

Given a fixed-length integer array ```arr```, duplicate each occurrence of zero, shifting the remaining elements to the right.

Note that elements beyond the length of the original array are not written. Do the above modifications to the input array in place and do not return anything.

![image](https://user-images.githubusercontent.com/35042430/211963017-7bc289db-d4d4-4a8f-a2c5-4a918335ae28.png)

---

__Example 1:__
```
Input: arr = [1,0,2,3,0,4,5,0]
Output: [1,0,0,2,3,0,0,4]
Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]
```

__Example 2:__
```
Input: arr = [1,2,3]
Output: [1,2,3]
Explanation: After calling your function, the input array is modified to: [1,2,3]
```

__Constraints:__
```
1 <= arr.length <= 104
0 <= arr[i] <= 9
```

---

```Python
class Solution:
    def duplicateZeros(self, arr: List[int]) -> None:
        # Copy of the array
        #### Time Complexity : O(N), traverse through the input arr
        #### Space Complexity: O(N^2), the worst case is when the entire input only has 0
        """
        res = list()
        n = len(arr)
        for num in arr:
            res.append(num)
            if num == 0:
                res.append(0)
        for i in range(n):
            arr[i] = res[i]
```

```Python
class Solution:
    def duplicateZeros(self, arr: List[int]) -> None:
        # Insert() and Pop()
        #### Time Complexity : O(N), traverse through the input arr
        #### Space Complexity: O(1), constant memory space for pointers
        """
        curr = 0
        while curr < len(arr):
            if arr[curr] == 0:
                arr.pop()
                to_insert = curr + 1
                arr.insert(to_insert, 0)
                curr = to_insert
            curr += 1
```

```Python
class Solution:
    def duplicateZeros(self, arr: List[int]) -> None:
        """
        Do not return anything, modify arr in-place instead.
        """
        # Sliding Window
        #### Time Complexity : O(N), traverse through the input arr
        #### Space Complexity: O(1), constant memory space for pointers        
        zeroes = arr.count(0)
        n = len(arr)
        for i in range(n - 1, -1, -1):
            # Shift the array based on the amount of zeroes in the array, but also keep track of the index i
            if i + zeroes < n:
                arr[i + zeroes] = arr[i]
            # Check if encountering 0
            if arr[i] == 0:
                # Update the number of zeroes counter
                zeroes -= 1
                # Add the zero to the right position
                if i + zeroes < n:
                    arr[i + zeroes] = 0
```
