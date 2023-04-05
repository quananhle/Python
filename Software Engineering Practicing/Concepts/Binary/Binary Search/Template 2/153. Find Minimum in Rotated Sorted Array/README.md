## [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array)

```Tag```: ```Binary Search```

#### Difficulty: Medium

Suppose an array of length ```n``` sorted in ascending order is rotated between ```1``` and ```n``` times. For example, the array ```nums = [0,1,2,4,5,6,7]``` might become:

- ```[4,5,6,7,0,1,2]``` if it was rotated ```4``` times.
- ```[0,1,2,4,5,6,7]``` if it was rotated ```7``` times.

Notice that rotating an array ```[a[0], a[1], a[2], ..., a[n-1]]``` 1 time results in the array ```[a[n-1], a[0], a[1], a[2], ..., a[n-2]]```.

Given the sorted rotated array ```nums``` of unique elements, return _the minimum element of this array_.

You must write an algorithm that runs in ```O(log n)``` time.

![image](https://user-images.githubusercontent.com/35042430/229933500-2edb4528-f294-4600-b2f4-2f028a9ef271.png)

---

__Example 1:__
```
Input: nums = [3,4,5,1,2]
Output: 1
Explanation: The original array was [1,2,3,4,5] rotated 3 times.
```

__Example 2:__
```
Input: nums = [4,5,6,7,0,1,2]
Output: 0
Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
```

__Example 3:__
```
Input: nums = [11,13,15,17]
Output: 11
Explanation: The original array was [11,13,15,17] and it was rotated 4 times. 
```

__Constraints:__

- ```n == nums.length```
- ```1 <= n <= 5000```
- ```-5000 <= nums[i] <= 5000```
- All the integers of ```nums``` are unique.
- ```nums``` is sorted and rotated between ```1``` and ```n``` times.

---

### Binary Search

If the array is not rotated and the array is in ascending order, then ```last element > first element```.

![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/Figures/153/153_Minimum_Rotated_Sorted_Array_1.png)

In the above example ```7 > 2```. This means that the array is still sorted and has no rotation.

![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/Figures/153/153_Minimum_Rotated_Sorted_Array_2.png)

In the above example ```3 < 4```. Hence the array is rotated. This happens because the array was initially ```[2, 3 ,4 ,5 ,6 ,7]```. But after the rotation the smaller elements ```[2,3]``` go at the back. i.e. ```[4, 5, 6, 7, 2, 3]```. Because of this the first element ```[4]``` in the rotated array becomes greater than the last element.

![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/Figures/153/153_Minimum_Rotated_Sorted_Array_3.png)

In this modified version of binary search algorithm, we are looking for this point. In the above example notice the Inflection Point .

    All the elements to the left of inflection point > first element of the array.
    All the elements to the right of inflection point < first element of the array.

__Algorithm__

1. Find the ```mid``` element of the array.
2. If ```mid element > first element``` of array this means that we need to look for the inflection point on the right of ```mid```.
3. If ```mid element < first element``` of array this that we need to look for the inflection point on the left of ```mid```.

![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/Figures/153/153_Minimum_Rotated_Sorted_Array_4.png)

In the above example mid element ```6``` is greater than first element ```4```. Hence we continue our search for the inflection point to the right of ```mid```.

4 . We stop our search when we find the inflection point, when either of the two conditions is satisfied:
    - ```nums[mid] > nums[mid + 1]``` Hence, ```mid + 1``` is the smallest.
    - ```nums[mid - 1] > nums[mid]``` Hence, ```mid``` is the smallest.

![image](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/Figures/153/153_Minimum_Rotated_Sorted_Array_5.png)

In the above example. With the marked left and right pointers. The mid element is ```2```. The element just before ```2``` is ```7``` and ```7 > 2``` i.e. ```nums[mid - 1] > nums[mid]```. Thus we have found the point of inflection and ```2``` is the smallest element.

```Python

```
```Python
class Solution:
    def findMin(self, nums: List[int]) -> int:
        n = len(nums)

        lo, hi = 0, n - 1
        
        while lo < hi:
            mi = lo + (hi - lo) // 2

            if nums[mi] < nums[hi]:
                hi = mi
            else:
                lo = mi + 1
        
        return nums[lo]
```
