## [912. Sort an Array](https://leetcode.com/problems/sort-an-array/)

```Tag```: ```Sorting```

#### Difficulty: Medium

Given an array of integers ```nums```, sort the array in ascending order and return it.

You must solve the problem without using any built-in functions in ```O(nlog(n))``` time complexity and with the smallest space complexity possible.

![image](https://user-images.githubusercontent.com/35042430/222025743-9585838e-c077-4f7f-9ea9-e0897f7b3e0f.png)

---

__Example 1:__
```
Input: nums = [5,2,3,1]
Output: [1,2,3,5]
Explanation: After sorting the array, the positions of some numbers are not changed (for example, 2 and 3), while the positions of other numbers are changed (for example, 1 and 5).
```

__Example 2:__
```
Input: nums = [5,1,1,2,0,0]
Output: [0,0,1,1,2,5]
Explanation: Note that the values of nums are not necessairly unique.
```

__Constraints:__

- 1 <= ```nums.length``` <= 5 * 10<sup>4</sup>
- -5 * 10<sup>4</sup> <= ```nums[i]``` <= 5 * 10<sup>4</sup>

---

There are a variety of sorting algorithms such as __Bubble Sort, Insertion Sort, Selection Sort, Merge Sort, Heap Sort, Quick Sort, Counting Sort, Radix Sort__, and others.

### Merge Sort

Merge Sort is a divide-and-conquer sorting algorithm. The intuition behind it is to divide the data set into smaller and smaller sub-arrays until it is easy to sort, and then merge the sorted sub-arrays back into a larger sorted array.

- __Time complexity__: ```O(nlog⁡n)```
- __Space complexity__: ```O(n)```

```Python
class Solution:
    def sortArray(self, nums: List[int]) -> List[int]:
        temp_arr = [0] * len(nums)
        
        # Function to merge two sub-arrays in sorted order.
        def merge(left: int, mid: int, right: int):
            # Calculate the start and sizes of two halves.
            start1 = left
            start2 = mid + 1
            n1 = mid - left + 1
            n2 = right - mid

            # Copy elements of both halves into a temporary array.
            for i in range(n1):
                temp_arr[start1 + i] = nums[start1 + i]
            for i in range(n2):
                temp_arr[start2 + i] = nums[start2 + i]

            # Merge the sub-arrays 'in tempArray' back into the original array 'arr' in sorted order.
            i, j, k = 0, 0, left
            while i < n1 and j < n2:
                if temp_arr[start1 + i] <= temp_arr[start2 + j]:
                    nums[k] = temp_arr[start1 + i]
                    i += 1
                else:
                    nums[k] = temp_arr[start2 + j]
                    j += 1
                k += 1

            # Copy remaining elements
            while i < n1:
                nums[k] = temp_arr[start1 + i]
                i += 1
                k += 1
            while j < n2:
                nums[k] = temp_arr[start2 + j]
                j += 1
                k += 1

        # Recursive function to sort an array using merge sort
        def merge_sort(left: int, right: int):
            if left >= right:
                return
            mid = left + (right - left) // 2
            # Sort first and second halves recursively.
            merge_sort(left, mid)
            merge_sort(mid + 1, right)
            # Merge the sorted halves.
            merge(left, mid, right)
    
        merge_sort(0, len(nums) - 1)
        return nums
```

### Heap Sort

The intuition behind Heap Sort is to organize the elements of the data set into a binary heap (a max binary heap, or a min binary heap), which provides a fast way to access the largest (or smallest) element. A max (or min) binary heap is a complete binary tree-based data structure where a parent node must be greater (or smaller) than or equal to its children nodes. This property ensures that the largest (or smallest) element is always at the root node of the max (or min) binary heap.

![image](https://leetcode.com/problems/sort-an-array/Figures/912/Slide3.PNG)

![image](https://leetcode.com/problems/sort-an-array/Figures/912/Slide4.PNG)

- __Time complexity__: ```O(nlogn)```
- __Space complexity__: ```O(logn)```

```Python
class Solution:
    def sortArray(self, nums: List[int]) -> List[int]:
        def heapify(n, i):
            # Initialize largest as root 'i'
            largest = i
            left = 2 * i + 1
            right = 2 * i + 2
            
            # Check if left child larger than root node
            if left < n and nums[left] > nums[largest]:
                largest = left
            # Check if right child larger than root node
            if right < n and nums[right] > nums[largest]:
                largest = right
            # Check if largest is not root, swap
            if largest != i:
                nums[i], nums[largest] = nums[largest], nums[i]
                heapify(n, largest)
        
        def heap_sort():
            n = len(nums)

            # Heapify top-down except leaf nodes
            for i in range(n // 2 - 1, -1, -1):
                heapify(n, i)
            
            # Traverse every node to move current root node to end
            for i in range(n - 1, -1, -1):
                nums[0], nums[i] = nums[i], nums[0]
                heapify(i, 0)
            
        heap_sort()
        return nums
```

### Counting Sort

The intuition behind counting sort is to count the frequency of each element in the input array and then place the elements in their correct positions based on their values and frequencies. Counting sort is a non-comparative sorting algorithm and is useful in situations where the elements in the array have a limited range.

![image](https://leetcode.com/problems/sort-an-array/Figures/912/Slide5.PNG)

- __Time complexity__: ```O(n + k)```
- __Space complexity__: ```O(n)```

```Python
class Solution:
    def sortArray(self, nums: List[int]) -> List[int]:
        def counting_sort():
            # Create the counting hash map
            counter = collections.defaultdict()
            # Find the minimum and maximum values in the array
            min_val, max_val = min(nums), max(nums)
            # Get the frequency
            for val in nums:
                counter[val] = 1 + counter.get(val, 0)

            index = 0
            # Place each element in its correct position in the array
            for val in range(min_val, max_val + 1):
                while counter.get(val, 0) > 0:
                    nums[index] = val
                    index += 1
                    counter[val] -= 1
        
        counting_sort()
        return nums
```

### Radix Sort

The intuition behind radix sort is that it takes advantage of the fact that integers have a finite number of digits and each digit can have a limited number of values (0 to 9). Instead of comparing elements, it sorts elements by the individual digits of the integers.

![image](https://leetcode.com/problems/sort-an-array/Figures/912/Slide6.PNG)

- __Time complexity__: ```O(d⋅(n+b))```
- __Space complexity__: ```O(n+b)```

```Python
class Solution:
    # Radix sort function.
    def radix_sort(self, nums: List[int]) -> List[int]:
        # Find the absolute maximum element to find max number of digits.
        max_element = nums[0]
        for val in nums:
            max_element = max(abs(val), max_element)

        max_digits = 0
        while max_element > 0:
            max_digits += 1
            max_element = max_element // 10

        place_value = 1
        
        # Bucket sort function for each place value digit.
        def bucket_sort():
            buckets = [[] for i in range(10)]
            # Store the respective number based on it's digit.
            for val in nums:
                digit = abs(val) / place_value
                digit = int(digit % 10)
                buckets[digit].append(val)

            # Overwrite 'nums' in sorted order of current place digits.
            index = 0
            for digit in range(10):
                for val in buckets[digit]:
                    nums[index] = val
                    index += 1

        # Radix sort, least significant digit place to most significant.      
        for _ in range(max_digits):
            bucket_sort()
            place_value *= 10

        # Seperate out negatives and reverse them. 
        positives = [val for val in nums if val >= 0]
        negatives = [val for val in nums if val < 0]
        negatives.reverse()

        # Final 'arr' will be 'negative' elements, then 'positive' elements.
        return negatives + positives
            
    def sortArray(self, nums: List[int]) -> List[int]:  
        return self.radix_sort(nums)
```

