## 409. Longest Palindrome

#### Difficulty: Easy

Given a string ```s``` which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.

Letters are case sensitive, for example, "Aa" is not considered a palindrome here.

#### Example 1:
```
Input: s = "abccccdd"
Output: 7
Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
```

#### Example 2:
```
Input: s = "a"
Output: 1
Explanation: The longest palindrome that can be built is "a", whose length is 1.
```

#### Constraints:
```
1 <= s.length <= 2000
s consists of lowercase and/or uppercase English letters only.
```

```{Python}
class Solution(object):
    def longestPalindrome(self, s):
        """
        :type s: str
        :rtype: int
        """
        # Greedy Algorithm 
        #### Time complexitY: O(N)
        #### Space complexity: O(1), the space for the count is fixed as the number of alphabet is 26
        """
        counter = dict()
        for i in range(len(s)):
            if s[i] not in counter:
                counter[s[i]] = 1
            else:
                counter[s[i]] += 1
        answer = 0
        for key,val in counter.items():
            answer += (val/2) * 2
            if answer% 2 == 0 and val % 2 == 1:
                answer += 1
        return answer
        """
        #### Time complexitY: O(N)
        #### Space complexity: O(1), the space for the count is fixed as the number of alphabet is 26
        """
        answer = 0
        counter = dict()
        for c in s:
            if c not in counter:
                counter[c] = 1
            else:
                counter.pop(c)
                answer += 2
        if counter:
            answer += 1
        return answer
        """
```
