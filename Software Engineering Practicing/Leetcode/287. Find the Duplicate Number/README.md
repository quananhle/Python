## [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number)

```Tag```: ```Binary Search``` ```Sorting``` ```Hash Set``` ```Hash Table``` ```Bitwise Manipulation```

#### Difficulty: Medium

Given an array of integers nums containing ```n + 1``` integers where each integer is in the range ```[1, n]``` inclusive.

There is only one repeated number in ```nums```, return _this repeated number_.

You must solve the problem without modifying the array nums and uses only constant extra space.

![image](https://user-images.githubusercontent.com/35042430/234982483-9d1d458a-9716-4473-8fea-a3b3e3ce7442.png)

---

__Example 1:__
```
Input: nums = [1,3,4,2,2]
Output: 2
```

__Example 2:__
```
Input: nums = [3,1,3,4,2]
Output: 3
```

__Constraints:__

- 1 <= ```n``` <= 10<sup>5</sup>
- ```nums.length == n + 1```
- ```1 <= nums[i] <= n```
- All the integers in ```nums``` appear only once except for precisely one integer which appears two or more times.

---

__Proof__

Proving that at least one duplicate must exist in ```nums``` is an application of the [pigeonhole principle](https://en.wikipedia.org/wiki/Pigeonhole_principle). Here, each number in ```nums``` is a "```pigeon```" and each distinct number that can appear in ```nums``` is a "```pigeonhole```." Because there are ```n + 1``` numbers and ```n``` distinct possible numbers, the pigeonhole principle implies that if you were to put each of the ```n+1``` pigeons into ```n``` pigeonholes, at least one of the pigeonholes would have ```2``` or more pigeons.

### Sorting & Linear Search

- __Time Complexity__: ```O(n * log⁡n)```
- __Space Complexity__: ```O(log⁡n)``` or ```O(n)```

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        # Sort
        n = len(nums)
        nums.sort()
        for i in range(1, n):
            if nums[i] == nums[i - 1]:
                return nums[i]
```

### Hash Set

- __Time Complexity__: ```O(n)```
- __Space Complexity__: ```O(n)```

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        # Hash Set
        seen = set()
        for num in nums:
            if num in seen:
                return num
            seen.add(num)
```

### Hash Table

- __Time Complexity__: ```O(n)```
- __Space Complexity__: ```O(n)```

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        freq = collections.defaultdict(int)
        for num in nums:
            freq[num] = 1 + freq.get(num, 0)
        for key, val in freq.items():
            if val > 1:
                return key
```

### Recursive Depth-First Search

- __Time Complexity__: ```O(n)```
- __Space Complexity__: ```O(n)```

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        def dfs(curr):
            if curr == nums[curr]:
                return curr
            
            next = nums[curr]
            nums[curr] = curr
            return dfs(next)

        return dfs(0)
```

### Bitwise Manipulation

- __Time Complexity__: ```O(n * logn)```
- __Space Complexity__: ```O(1)```

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        duplicate = 0
        n = len(nums) - 1
        bits = n.bit_length()
        for bit in range(bits):
            '''
            mask = 1 << bit
            '''
            mask = 2 ** bit
            base_count = 0
            nums_count = 0
            for i in range(n + 1):
                # If bit is set in number (i) then add 1 to base_count
                if i & mask:
                    base_count += 1
                    
                # If bit is set in nums[i] then add 1 to nums_count
                if nums[i] & mask:
                    nums_count += 1
                    
            # If the current bit is more frequently set in nums than it is in 
            # the range [1, 2, ..., n] then it must also be set in the duplicate number.
            if nums_count - base_count > 0:
                duplicate |= mask
                
        return duplicate
```

### Binary Search

Consider an array that has ```n``` distinct numbers in the range ```[1,n]````. For example: ```[1,2,3,4,5]```. If we pick any one of these 5 numbers and count how many numbers are less than or equal to it, the answer will be equal to that number. So in ```[1,2,3,4,5]```, if you pick the number ```4```, there's exactly ```4``` numbers that are less than or equal to ```4```. If you pick ```3```, there's exactly ```3``` numbers that are less than or equal to ```3```, and so on. However, when you have duplicates in the array, this count will exceed the number at some point. For example: in ```[4,3,4,5,2,4,1]```, ```3``` has ```3``` numbers less than or equal to it. However, the duplicate number will have a count of numbers less than or equal to itself, that is greater than itself (in this example, ```4```, which is the duplicate, has ```6``` numbers that are less than or equal to it). Hence, the smallest number that satisfies this property is the duplicate number.

Consider an example: ```[4,6,4,2,1,4,3,5]```. This has ```n + 1``` elements where ```n = 7```. Take each number from ```1``` to ```7``` and count how many numbers are less than or equal to it. In our example, ```count(1,2,3,4,5,6,7) = (1,2,3,6,7,8,8)```. If we performed a linear scan, we would find that the number ```4``` is the first number to have its counts exceed the actual number (i.e. 6 > 4) - hence ```4``` is the duplicate. A linear scan based approach would require an overall ```O(n^2)``` time complexity in the worst case, since we'd need to iterate over each of the ```n``` numbers (requiring ```O(n)``` time), and then compare it to every element to generate a count of equal or lower numbers (requiring ```O(n)``` time as well - nested inside the other ```O(n)``` loop). Fortunately, ```count``` is __monotonic__ (it's values are always in non-decreasing order), and hence it is an excellent candidate for binary search.
 
- __Time Complexity__: ```O(n * logn)```
- __Space Complexity__: ```O(1)```

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        n = len(nums)
        lo, hi = 0, n - 1

        while lo <= hi:
            mi = lo + (hi - lo) // 2
            count = 0

            count = sum(num <= mi for num in nums) 

            if count > mi:
                ans = mi
                hi = mi - 1
            else:
                lo = mi + 1
            
        return ans
```

__Follow up:__

- How can we prove that at least one duplicate number must exist in nums?
- Can you solve the problem in linear runtime complexity?

### Iterative Depth-First Search

- __Time Complexity__: ```O(n)```
- __Space Complexity__: ```O(1)```

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        while nums[0] != nums[nums[0]]:
            nums[nums[0]], nums[0] = nums[0], nums[nums[0]]
        return nums[0]
```

### Negative Marking

- __Time Complexity__: ```O(n)```
- __Space Complexity__: ```O(1)```

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        for num in nums:
            curr = abs(num)
            if nums[curr] < 0:
                duplicate = curr
                break
            nums[curr] = -nums[curr]
        
        for num in nums:
            num = abs(num)
        
        return duplicate
```

### Floyd's Tortoise and Hare (Cycle Detection)

![image](https://leetcode.com/problems/find-the-duplicate-number/Figures/287/simple_cycle.png)

![image](https://leetcode.com/problems/find-the-duplicate-number/Figures/287/complex_cycle.png)

![image](https://leetcode.com/problems/find-the-duplicate-number/Figures/287/first_intersection.png)

```Python
class Solution:
    def findDuplicate(self, nums: List[int]) -> int:
        fast = slow = nums[0]
        while True:
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast:
                break

        slow = nums[0]
        while slow != fast:
            slow = nums[slow]
            fast = nums[fast]

        return fast
```
