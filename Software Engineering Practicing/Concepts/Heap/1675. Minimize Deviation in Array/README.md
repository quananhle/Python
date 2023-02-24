## 1675. Minimize Deviation in Array

```Tag```: ```Heap``` ```Sliding Window```

#### Difficulty: Hard

You are given an array nums of ```n``` positive integers.

You can perform two types of operations on any element of the array any number of times:

- If the element is even, divide it by ```2```.
  - For example, if the array is ```[1,2,3,4]```, then you can do this operation on the last element, and the array will be ```[1,2,3,2]```.

- If the element is odd, multiply it by ```2```.
  - For example, if the array is ```[1,2,3,4]```, then you can do this operation on the first element, and the array will be ```[2,2,3,4]```.
  
The __deviation__ of the array is the __maximum difference__ between any two elements in the array.

Return _the __minimum deviation__ the array can have after performing some number of operations_.

![image](https://user-images.githubusercontent.com/35042430/221092455-ad92ae65-2f5c-4990-8240-18e59e06f909.png)

---

__Example 1:__
```
Input: nums = [1,2,3,4]
Output: 1
Explanation: You can transform the array to [1,2,3,2], then to [2,2,3,2], then the deviation will be 3 - 2 = 1.
```

__Example 2:__
```
Input: nums = [4,1,5,20,3]
Output: 3
Explanation: You can transform the array after two operations to [4,2,5,5,3], then the deviation will be 5 - 2 = 3.
```

__Example 3:__
```
Input: nums = [2,10,8]
Output: 3
```

__Constraints:__

- ```n == nums.length```
- 2 <= ```n``` <= 5 * 10<sup>4</sup>
- 1 <= ```nums[i]``` <= 10<sup>9</sup>

---

The problem gives two operations:

- If the element is __even__, we can __divide__ it by ```2```.
- If the element is __odd__, we can __multiply__ it by ```2```.

Consequently, we have two insights:

- If the element is even, we can not increase it.
- If the element is odd, we can not decrease it.

![image](https://leetcode.com/problems/minimize-deviation-in-array/Documents/5616/5616_1_1.drawio.svg)

According to the problem description:

_deviation = maximum − minimum_

Hence, there are only two ways to decrease _deviation_: decrease _maximum_, or increase _minimum_.

If we have increased all numbers to their maximum, then we can not increase _minimum_. If we want smaller _deviation_, we can only decrease _maximum_.

![image](https://leetcode.com/problems/minimize-deviation-in-array/Documents/5616/5616_1_2.drawio.svg)

### Heap

#### Algorithm

- __Step 1__: Initialize a max-heap ```max_heap```.

  - For an even number in ```nums```, put it directly into ```max_heap```; for the odd number in ```nums```, multiply by ```2``` and put it into ```max_heap```.

- __Step 2__: Maintain an integer ```val``` to keep tracking the smallest element in ```max_heap```.

- __Step 3__: Take out the maximum number in ```max_heap```. Use the maximum and the maintained ```val``` to update the minimum deviation. If the maximum number is even, divide by 2 and push into ```max_heap```.

- __Step 4__: Repeat Step 3 until the maximum number in ```max_heap``` is odd.

- __Step 5__: Return the minimum deviation.

```Python
class Solution:
    def minimumDeviation(self, nums: List[int]) -> int:
        max_heap = list()
        for num in nums:
            if num % 2 == 0:
                num = -num
            else:
                num = -num * 2
            heapq.heappush(max_heap, num)
            
        ans = float('inf')
        val = -max(max_heap)
        
        while len(nums) == len(max_heap):
            curr = -heapq.heappop(max_heap)
            ans = min(ans, curr - val)
            if curr % 2 == 0:
                val = min(val, curr // 2)
                heapq.heappush(max_heap, -curr // 2)
            else:
                break
        return ans
```
