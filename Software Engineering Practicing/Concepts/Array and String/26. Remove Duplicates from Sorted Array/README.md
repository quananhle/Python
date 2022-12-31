## 26. Remove Duplicates from Sorted Array

```Tag```: ```Two Pointers```

Given an integer array ```nums``` sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array ```nums```. More formally, if there are k elements after removing the duplicates, then the first k elements of ```nums``` should hold the final result. It does not matter what you leave beyond the first ```k``` elements.

Return _```k``` after placing the final result in the first k slots of nums_.

Do not allocate extra space for another array. You must do this by modifying the input array in-place with ```O(1)``` extra memory.

__Custom Judge:__

The judge will test your solution with the following code:

```JavaScript
int[] nums = [...]; // Input array
int[] expectedNums = [...]; // The expected answer with correct length

int k = removeDuplicates(nums); // Calls your implementation

assert k == expectedNums.length;
for (int i = 0; i < k; i++) {
    assert nums[i] == expectedNums[i];
}
```

If all assertions pass, then your solution will be accepted.

![image](https://user-images.githubusercontent.com/35042430/210126599-76513a22-5ad8-4eae-8cb4-57e10bbdc877.png)

---

__Example 1:__
```
Input: nums = [1,1,2]
Output: 2, nums = [1,2,_]
Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
```

__Example 2:__
```
Input: nums = [0,0,1,1,1,2,2,3,3,4]
Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
```

__Constraints:__
```
1 <= nums.length <= 3 * 104
-100 <= nums[i] <= 100
nums is sorted in non-decreasing order.
```

---

### Fast and Slow Pointers

```Python
class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        curr = 1
        for i in range(1, len(nums)):
            if nums[i-1] != nums[i]:
                nums[curr] = nums[i]
                curr += 1
        return curr
```

### Three Pointers

```Python

```
