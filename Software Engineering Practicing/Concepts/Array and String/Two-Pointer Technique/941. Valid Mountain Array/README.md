## 941. Valid Mountain Array

```Tag```: ```Two-Pointer```

#### Difficulty: Easy

Given an array of integers ```arr```, return _```true``` if and only if it is a valid mountain array_.

Recall that ```arr``` is a mountain array if and only if:

- ```arr.length``` >= 3
- There exists some ```i``` with ```0 < i < arr.length - 1``` such that:
  - ```arr[0] < arr[1] < ... < arr[i - 1] < arr[i]```
  - ```arr[i] > arr[i + 1] > ... > arr[arr.length - 1]```

![image](https://assets.leetcode.com/uploads/2019/10/20/hint_valid_mountain_array.png)

![image](https://user-images.githubusercontent.com/35042430/212525271-e8ded11a-1753-40af-9607-1b80b2a400de.png)

---

__Example 1:__
```
Input: arr = [2,1]
Output: false
```

__Example 2:__
```
Input: arr = [3,5,5]
Output: false
```

__Example 3:__
```
Input: arr = [0,3,2,1]
Output: true
```

__Constraints:__
```
1 <= arr.length <= 104
0 <= arr[i] <= 104
```

---

### Two Pointers

```Python
class Solution:
    def validMountainArray(self, arr: List[int]) -> bool:
        # Two Pointers
        #### Time Complexity : O(N), traverse through the input array from both side
        #### Space Complexity: O(1), constant memory space for pointers
        if not arr:
            return False
        elif len(arr) == 1:
            return False
        else:
            left, right = 0, len(arr)-1
            # Find peak
            # Traverse from the left
            while left < right:
                if arr[left] < arr[left+1]:
                    left += 1
                else:
                    if left == 0:
                        return False
                    break
            # Traverse from the right
            while right > 0:
                if arr[right-1] > arr[right]:
                    right -= 1
                else:
                    if right == len(arr) - 1:
                        return False
                    break
        return left == right
```
