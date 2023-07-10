## Longest Substring

__Algorithm__

1. Use a hash map ```memo``` to dynamically record the number of each character in the current window while scanning.
2. Set ```start = 0``` and ```ans = 0```, iterate ```end``` from ```0``` to ```n - 1```, at each step ```end```, increment ```s[end]``` by ```1```:
    - Increment ```memo[s[end]]``` by ```1```.
    - Check hash map for the requirements, such as while ```len(memo) > k``` for substring with at most k distinct character, or ```memo[s[end]] > 1``` for substring without repeating character
        - Decrement ```memo[s[start]]``` by ```1```.
        - Delete ```s[start]``` from ```memo``` if ```memo[s[start] = 0```.
        - Increment ```start``` by ```1```.
    - Now the window is valid, update the maximum size of valid window as ```ans = max(ans, right - left + 1)```.
3. Return ```ans``` when the iteration ends.

---

### [3. Longest Substring Without Repeating Characters](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Study%20Plan/Algorithm/Algorithm%20I/Day%2006%20-%20Sliding%20Window/3.%20Longest%20Substring%20Without%20Repeating%20Characters)

Given a string ```s```, return _the length of the longest substring without repeating characters_.

__Example:__
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

```Python
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        start = 0
        ans = 0

        if n == 1:
            return n

        for end in range(n):
            right = s[end]
            memo[right] = 1 + memo.get(right, 0)

            while memo[right] > 1:
                left = s[start]
                memo[left] -= 1
                
                if memo[left] == 0:
                    del memo[left]

                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```

---

### [159. Longest Substring with At Most Two Distinct Characters](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Bloomberg/159.%20Longest%20Substring%20with%20At%20Most%20Two%20Distinct%20Characters)

Given a string ```s```, return _the length of the longest substring that contains at most two distinct characters_.

__Example:__
```
Input: s = "eceba"
Output: 3
Explanation: The substring is "ece" which its length is 3.
```

```Python
class Solution:
    def lengthOfLongestSubstringTwoDistinct(self, s: str) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        start = 0
        ans = 0

        if n < 3:
            return n
        
        for end in range(n):
            right = s[end]
            memo[right] = 1 + memo.get(right, 0)

            while len(memo) > 2:
                left = s[start]
                memo[left] -= 1

                if memo[left] == 0:
                    del memo[left]

                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```

---

### [340. Longest Substring with At Most K Distinct Characters](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Sliding%20Window/340.%20Longest%20Substring%20with%20At%20Most%20K%20Distinct%20Characters)

Given a string ```s``` and an integer ```k```, return _the length of the longest substring of ```s``` that contains at most ```k``` distinct characters_.

__Example:__
```
Input: s = "eceba", k = 2
Output: 3
Explanation: The substring is "ece" with length 3.
```

```Python
class Solution:
    def lengthOfLongestSubstringKDistinct(self, s: str, k: int) -> int:
        n = len(s)
        memo = collections.defaultdict(int)
        start = 0
        ans = 0

        if n < k:
            return n
        
        for end in range(n):
            right = s[end]
            memo[right] = 1 + memo.get(right, 0)

            while len(memo) > k:
                left = s[start]
                memo[left] -= 1

                if memo[left] == 0:
                    del memo[left]

                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```

### [2024. Maximize the Confusion of an Exam](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Facebook/2024.%20Maximize%20the%20Confusion%20of%20an%20Exam)

You are given a string ```answerKey```, where ```answerKey[i]``` is the original answer to the $i^{th}$ question. In addition, you are given an integer ```k```, the maximum number of times you may perform the following operation:

- Change the answer key for any question to ```'T'``` or ```'F'``` (i.e., set ```answerKey[i]``` to ```'T'``` or ```'F'```).

Return _the maximum number of consecutive ```'T'```s or ```'F'```s in the answer key after performing the operation at most ```k``` times_.

__Example:__
```
Input: answerKey = "TTFF", k = 2
Output: 4
Explanation: We can replace both the 'F's with 'T's to make answerKey = "TTTT".
There are four consecutive 'T's.
```

```Python
class Solution:
    def maxConsecutiveAnswers(self, answerKey: str, k: int) -> int:
        n = len(answerKey)
        counter = collections.Counter()
        start = 0
        ans = 0

        if n == k:
            return n
        
        for end in range(n):
            right = answerKey[end]
            counter[right] += 1

            while min(counter['T'], counter['F']) > k:
                left = answerKey[start]
                counter[left] -= 1

                if counter[left] == 0:
                    del counter[left]
                
                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```

