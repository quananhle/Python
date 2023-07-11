## [424. Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement)

```Tag```: ```Sliding Window``` ```Hash Map``` ```Hash Set```

#### Difficulty: Medium

You are given a string ```s``` and an integer ```k```. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most ```k``` times.

Return _the length of the longest substring containing the same letter you can get after performing the above operations_.

![image](https://user-images.githubusercontent.com/35042430/206975314-edafc2a7-b20c-46d2-9b86-d200c4036249.png)

---

__Example 1:__

```
Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.
```

__Example 2:__
```
Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
```

__Constraints:__
```
1 <= s.length <= 105
s consists of only uppercase English letters.
0 <= k <= s.length
```

---

### Sliding Window

#### Longest Substring Template

```Python

```

```Python

```

### Sliding Window and Hash Table

```Python
class Solution(object):
    def characterReplacement(self, s, k):
        """
        :type s: str
        :type k: int
        :rtype: int
        """
        # Sliding Window and Hash Table
        #### Time Complexity: O(N), traverse through the length of input s
        #### Space Complexity: O(1), hash table keeps up to the size of 26 characters
        count = dict()
        ans = 0
        left = 0
        max_frequency = 0
        for right in range(len(s)):
            '''
            if s[right] not in count:
                count[s[right]] = 1
            else:
                count[s[right]] += 1
            '''
            # Increment the frequency of s[right] by 1. If s[right] not in count before, assign 0                        
            count[s[right]] = 1 + count.get(s[right] , 0) 
            # Check the maximum frequency in counter
            max_frequency = max(max_frequency, count[s[right]])
            # Check if current sliding window is is valid. 
            # Left and right pointers are inclusive in sliding window, hence the size of the window is right - left + 1
            # If sliding window equals to or is smaller than k, expand the window by shifting by incrementing the right pointer
            if (right - left + 1) - max_frequency <= k:
                # Move right pointer to the right
                right += 1
            # If sliding window is bigger than k, shrink the window by incrementing left pointer
            else:
                # Reduce the frequency of element at left pointer in the counter
                count[s[left]] -= 1
                # Move the left pointer to the right
                left += 1
            # Keep up the maximum size of the sliding window
            ans = max(ans, right - left)
        return ans
```

```Python
class Solution(object):
    def characterReplacement(self, s, k):
        """
        :type s: str
        :type k: int
        :rtype: int
        """
        # Sliding Window
        #### Time Complexity: O(N), traverse through the length of input s
        #### Space Complexity: O(1), hash table keeps up to the size of 26 characters        
        start, max_frequency, longest_substring_length = 0, 0, 0
        freq = dict()
        for end in range(len(s)):
            # Frequency counter of characters in s
            if s[end] not in freq:
                freq[s[end]] = 1
            else:
                freq[s[end]] += 1
            # Check the current maximum frequency in counter
            max_frequency = max(max_frequency, freq[s[end]])
            # Check if current sliding window is is valid. 
            # Left and right pointers are inclusive in sliding window, hence the size of the window is right - left + 1
            is_valid = (end + 1 - start - max_frequency <= k)
            # If sliding window is bigger than k, shrink the window by incrementing left pointer
            if not is_valid:
                # Reduce the frequency of element at left pointer in the counter
                freq[s[start]] -= 1
                # Move the left pointer to the right
                start += 1
            # Record the maximum size of the sliding window                
            longest_substring_length = end + 1 - start
        return longest_substring_length
```

### Sliding Window and Hash Set


```Python
class Solution(object):
    def characterReplacement(self, s, k):
        """
        :type s: str
        :type k: int
        :rtype: int
        """
        # Sliding Window and Hash Set
        #### Time Complexity: O(26N), traverse through the length of input s while traversing through up to 26 alphabet characters
        #### Space Complexity: O(1), hash table keeps up to the size of 26 characters        
        
        # Check if window size - count less than k operations
        def helper(start, end, count, k):
            # Start and end pointers are inclusive in sliding window, hence the size of the window is end - start + 1
            return end + 1 - start - count <= k

        hash_set = set(s)
        ans = 0
        for letter in hash_set:
            start = count = 0
            for end in range(len(s)):
                # Increment the frequency
                if s[end] == letter:
                    count += 1
                # If sliding window is bigger than k, shrink the window by incrementing left pointer
                if not helper(start, end, count, k):
                    # Reduce the frequency of element at left pointer in the counter
                    if s[start] == letter:
                        count -= 1
                    # Move the left pointer to the right                        
                    start += 1
                else:
                    # Keep up the maximum size of the sliding window
                    ans = max(ans, end + 1 - start)
        return ans
```
