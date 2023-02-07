## 438. Find All Anagrams in a String

```Tag```: ```Sliding Window```

#### Difficulty: Medium

Given two strings ```s``` and ```p```, return an array of all the start indices of ```p```'s anagrams in ```s```. You may return the answer in __any order__.

An __Anagram__ is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

![image](https://user-images.githubusercontent.com/35042430/207155100-685a397d-6a97-40c7-8171-13bddaa06f85.png)

---

__Example 1:__

```
Input: s = "cbaebabacd", p = "abc"
Output: [0,6]
Explanation:
The substring with start index = 0 is "cba", which is an anagram of "abc".
The substring with start index = 6 is "bac", which is an anagram of "abc".
```

__Example 2:__

```
Input: s = "abab", p = "ab"
Output: [0,1,2]
Explanation:
The substring with start index = 0 is "ab", which is an anagram of "ab".
The substring with start index = 1 is "ba", which is an anagram of "ab".
The substring with start index = 2 is "ab", which is an anagram of "ab".
```

__Constraints:__
```
1 <= s.length, p.length <= 3 * 104
s and p consist of lowercase English letters.
```

---

### Sliding Window

```Python
class Solution(object):
    def findAnagrams(self, s, p):
        """
        :type s: str
        :type p: str
        :rtype: List[int]
        """
        # Sliding Windows
        #### Time Complexity: O(N), traverse through the length of input string s
        #### Space Complexity: O(1), fixed at 26 lowercase characters
        if len(p) > len(s):
            return []
        p_counter, s_counter = dict(), dict()
        for i in range(len(p)):
            # Calculate the frequency of character p[i] in p
            p_counter[p[i]] = 1 + p_counter.get(p[i], 0)
            # Populate the s_counter with the size equals to p_counter
            s_counter[s[i]] = 1 + s_counter.get(s[i], 0)
        # Check if s_counter == p_counter, then the start index = 0, else an empty list
        res = [0] if s_counter == p_counter else []
        start = 0
        # Check the remaining of the string s
        for end in range(len(p), len(s)):
            # Update the frequency counter
            s_counter[s[end]] = 1 + s_counter.get(s[end], 0)
            # Update the s_counter frequency of the start pointer character as start pointer moving to the right
            s_counter[s[start]] -= 1
            # Check if frequency of the character reduced to 0
            if s_counter[s[start]] == 0:
                # Pop the element out of the s_counter
                s_counter.pop(s[start])
            # Increment start pointer
            start += 1
            # Check the new s_counter == p_counter:
            if s_counter == p_counter:
                res.append(start)
        return res
```

```Python
class Solution(object):
    def findAnagrams(self, s, p):
        """
        :type s: str
        :type p: str
        :rtype: List[int]
        """
        # Sliding Windows
        #### Time Complexity: O(N), traverse through the length of input string s
        #### Space Complexity: O(1), fixed at 26 lowercase characters
        if len(p) > len(s):
            return []
        res = list()
        '''
        p_counter, s_counter = dict(), dict()
        for i in range(len(p)):
            p_counter[p[i]] = 1 + p_counter.get(p[i], 0)
        for i in range(len(s)):
            s_counter[s[i]] = 1 + s_counter.get(s[i], 0)
        '''
        p_counter, s_counter = collections.defaultdict(int), collections.defaultdict(int)
        for i in range(len(p)):
            p_counter[p[i]] += 1
        for end in range(len(s)):
            # Initialize the the start of the sliding window
            # Left and right pointers are inclusive in sliding window, hence the size of the window is end - start + 1            
            start = end - len(p) + 1
            # Calculate the frequency of character in s with right pointer
            s_counter[s[end]] += 1
            # Check the sliding windows when size of the window is larger than p
            if end >= len(p):
                # If the frequency of the character is 1, remove the element
                if s_counter[s[end-len(p)]] == 1:
                    s_counter.pop(s[end-len(p)])
                # If the frequency of the character is larger than 1, decrement the frequency
                else:
                    s_counter[s[end - len(p)]] -= 1
            # Check if s_counter == p_counter, record the start of the sliding window
            if s_counter == p_counter:
                res.append(start)
        return res
```
