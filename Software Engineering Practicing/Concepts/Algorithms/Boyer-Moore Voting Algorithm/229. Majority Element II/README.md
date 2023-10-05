## [229. Majority Element II](https://leetcode.com/problems/majority-element-ii)

```Tag```: ```Hash Map``` ```Boyer-Moore Voting Algorithm```

#### Difficulty: Medium

Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.

![image](https://github.com/quananhle/Python/assets/35042430/bfe778e3-3c3d-4a76-ab02-16a1145ce5cf)

---

__Example 1:__
```
Input: nums = [3,2,3]
Output: [3]
```

__Example 2:__
```
Input: nums = [1]
Output: [1]
```

__Example 3:__
```
Input: nums = [1,2]
Output: [1,2]
```

__Constraints:__

- $1 \le nums.length \le 5 * 10^4$
- -10^9 \le nums[i] \le 10^9

---

### Counter

- __Time Complexity__: \mathcal{O}(N)$
- __Space Complexity__: \mathcal{O}(N)$

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> List[int]:
        n = len(nums)
        res = list()
        counter = collections.defaultdict(int)
        for num in nums:
            counter[num] = 1 + counter.get(num, 0)
            if freq > (n // 3):
                res.append(num)
        return res
```

#### One Liner

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> List[int]:
        return [num for num, freq in collections.Counter(nums).items() if freq > (len(nums) // 3)]
```

__Follow up__: Could you solve the problem in linear time and in ```O(1)``` space?

### Boyer-Moore Voting Algorithm

__Intuition__

To figure out a ```O(1)``` space requirement, we would need to get this simple intuition first. For an array of length ```n```:

- There can be at most __one__ majority element which is more than ```⌊n/2⌋``` times.
- There can be at most __two__ majority elements which are more than ```⌊n/3⌋``` times.
- There can be at most __three__ majority elements which are more than ```⌊n/4⌋``` times.
and so on.

Unless the constraints guaranteed that there is a majority element in the array so the implementation can omit the second pass. Otherwise, in a general case, a second pass is required since an array can have no majority elements at all!

If an element is truly a majority element, it will stick in the potential candidate variable, no matter how it shows up in the array (i.e. all clustered in the beginning of the array, all clustered near the end of the array, or showing up anywhere in the array), after the whole array has been scanned. Of course, while you are scanning the array, the element might be replaced by another element in the process, but the true majority element will definitely remain as the potential candidate in the end.

![image](https://github.com/quananhle/Python/assets/35042430/33a5d413-daf7-4e67-b1a4-359f6bca1426)

![image](https://github.com/quananhle/Python/assets/35042430/0e0e82d8-8afc-4076-85f0-e4ecc12788ff)

- __Time Complexity__: \mathcal{O}(N)$
- __Space Complexity__: \mathcal{O}(1)$

```Python
class Solution:
    def majorityElement(self, nums: List[int]) -> List[int]:
        n = len(nums)
        cnt1 = cnt2 = 0
        num1 = num2 = None

        if not nums:
            return []
        
        for num in nums:
            # If the current element is equal to one of the potential candidate, 
            # the count for that candidate is increased while leaving the count of the other candidate as it is.
            if num == num1:
                cnt1 += 1
            elif num == num2:
                cnt2 += 1
            # If the counter reaches zero, the candidate associated with that counter will be replaced with the next element 
            # if the next element is not equal to the other candidate as well.
            elif cnt1 == 0:
                num1 = num
                cnt1 += 1
            elif cnt2 == 0:
                num2 = num
                cnt2 += 1
            # Both counters are decremented only when the current element is different from both candidates.
            else:
                cnt1 -= 1; cnt2 -= 1
        
        res = list()
        for num in [num1, num2]:
            if nums.count(num) > n // 3:
                res.append(num)
        
        return res
```
