## [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)

```Tag```: ```Sliding Window``` ```Queue```

#### Difficulty: Hard

You are given an array of integers ```nums```, there is a sliding window of size ```k``` which is moving from the very left of the array to the very right. You can only see the ```k``` numbers in the window. Each time the sliding window moves right by one position.

Return __the max sliding window__.

![image](https://github.com/quananhle/Python/assets/35042430/db529708-b29f-48a2-afc1-54a017f46efd)

---
 
__Example 1:__
```
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation: 
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
```

__Example 2:__
```
Input: nums = [1], k = 1
Output: [1]
```

__Constraints:__

- $1 \le nums.length \le 10^{5}$
- $-10^{4} \le nums[i] \le 10^{4}$
- $1 \le k \le nums.length$

---

### Brute-Force (Time Limit Exceeded)

```Python
class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]:
        start = 0
        n = len(nums)
        res = list()

        for end in range(start + k, max(n, start + k) + 1):
            res.append(max(nums[start:end]))
            start += 1
        
        return res
```

### Monotonic Queue

![image](https://github.com/quananhle/Python/assets/35042430/0ebc95a6-0595-4099-b871-1ec96321e2d3)

![image](https://github.com/quananhle/Python/assets/35042430/65e39312-e2dc-4b51-84c3-d7c2b6d0e97a)

![image](https://github.com/quananhle/Python/assets/35042430/f7ef0192-c2c4-4b42-bd64-52455e052beb)

![image](https://github.com/quananhle/Python/assets/35042430/6de424a1-b655-422d-b4f2-27cbe2ca4d35)

![image](https://github.com/quananhle/Python/assets/35042430/15773761-04c0-4dcf-8f7a-5c2614d74948)

![image](https://github.com/quananhle/Python/assets/35042430/f2ffe253-a187-49d1-b565-4847d22481da)

![image](https://github.com/quananhle/Python/assets/35042430/358dfc4f-9012-4671-afe7-2a6222160007)

![image](https://github.com/quananhle/Python/assets/35042430/26699ba3-b8d0-4931-8e95-96e8f55fd73d)

__Algorithm__

1. Create a deque ```dq``` of integers.
2. Create a list of integers ```res``` to store the answer.
3. Iterate over the first ```k``` elements from ```i = 0``` to ```k - 1``` and perform the following:
  - While ```dq``` is not empty and the current element ```nums[i]``` is greater or equal to ```nums[dq.peekLast()]```, continue to pop the last element.
  - Push ```i``` at the end of ```dq```.
4. Push the largest element of the first window ```nums[dq.peekFirst()]``` to the answer.
5. We iterate over all the remaining elements from ```i = k``` to ```n - 1``` to move to the next windows. We perform the following in this loop:
  - Check if the element at the front of ```dq``` is equal to ```i - k```. If it is equal to ```i - k```, it cannot be included in the current window. We pop this element.
  - While ```dq``` is not empty and the current element ```nums[i]``` is greater or equal to ```nums[dq.back()]```, continue to pop the last element.
  - Push ```i``` at the end of ```dq```.
  - Push the largest element of the current window ```nums[dq.peekFirst()]``` to the answer.
6. Return ```res```.

__Complexity Analysis__

- __Time Complexity__:
- __Space Complexity__:

```Python

```
