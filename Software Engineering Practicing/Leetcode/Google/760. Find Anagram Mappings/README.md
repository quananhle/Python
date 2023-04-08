## [760. Find Anagram Mappings](https://leetcode.com/problems/find-anagram-mappings/)

```Tag```:

#### Difficulty: Easy

You are given two integer arrays ```nums1``` and ```nums2``` where ```nums2``` is an anagram of ```nums1```. Both arrays may contain duplicates.

Return _an index mapping array mapping from ```nums1``` to ```nums2``` where ```mapping[i] = j``` means the ```i```<sup>th</sup> element in ```nums1``` appears in ```nums2``` at index ```j```_. If there are multiple answers, return any of them.

An array ```a``` is an anagram of an array ```b``` means ```b``` is made by randomizing the order of the elements in ```a```.

![image](https://user-images.githubusercontent.com/35042430/230700217-e80fca58-946c-4a79-ae45-e5391c5c8ff3.png)

---

__Example 1:__
```
Input: nums1 = [12,28,46,32,50], nums2 = [50,12,32,46,28]
Output: [1,4,3,2,0]
Explanation: As mapping[0] = 1 because the 0th element of nums1 appears at nums2[1], and mapping[1] = 4 because the 1st element of nums1 appears at nums2[4], and so on.
```

__Example 2:__
```
Input: nums1 = [84,46], nums2 = [84,46]
Output: [0,1]
```

__Constraints:__

- ```1 <= nums1.length <= 100```
- ```nums2.length == nums1.length```
- ```0 <= nums1[i], nums2[i] <= 10^5```
- ```nums2``` is an anagram of ```nums1```.

---

### Brute Force

```Python
class Solution:
    def anagramMappings(self, nums1: List[int], nums2: List[int]) -> List[int]:
        res = [None] * len(nums1)
        for i, num1 in enumerate(nums1):
            for j, num2 in enumerate(nums2):
                if num1 == num2:
                    res[i] = j
                    break

        return res
```

### Hash Map

```Python
class Solution:
    def anagramMappings(self, nums1: List[int], nums2: List[int]) -> List[int]:
        res = list()
        memo = collections.defaultdict(int)

        for idx, num in enumerate(nums2):
            memo[num] = idx
        
        for num in nums1:
            res.append(memo[num])
        
        return res
```

```Python
class Solution:
    def anagramMappings(self, nums1: List[int], nums2: List[int]) -> List[int]:
        memo = collections.defaultdict(int)

        for idx, num in enumerate(nums2):
            memo[num] = idx

        return [memo[num] for num in nums1]
```


