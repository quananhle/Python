## 205. Isomorphic Strings

#### Difficulty: Easy

Given two strings ```s``` and ```t```, determine if they are _isomorphic_.

Two strings ```s``` and ```t``` are _isomorphic_ if the characters in ```s``` can be replaced to get ```t```.

All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

![image](https://user-images.githubusercontent.com/35042430/205199206-d37e438b-bb8a-4645-8721-7610eb1f536c.png)

---

__Example 1:__
```
Input: s = "egg", t = "add"
Output: true
```

__Example 2:__
```
Input: s = "foo", t = "bar"
Output: false
```

__Example 3:__
```
Input: s = "paper", t = "title"
Output: true
```
 
__Constraints:__
```
1 <= s.length <= 5 * 104
t.length == s.length
s and t consist of any valid ascii character.
```

---

### One Liner
        
```Python
class Solution(object):
    def isIsomorphic(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        # One Liner
        # t.length == s.length
        #### Time Complexity:  O(N), travel through length of s and t
        #### Space Complexity: O(1), the size of ASCII character is fixed with 26 characters     
        return len(set(s)) == len(set(t)) == len(set(zip(s, t)))
```

### Character Mapping with Dictionary

```Python
class Solution(object):
    def isIsomorphic(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        # Character Mapping with Dictionary
        #### Time Complexity:  O(N), travel through length of s and t
        #### Space Complexity: O(1), the size of ASCII character is fixed with 26 characters
        s_dict = dict()
        t_dict = dict()
        for i in range(len(s)):
            if s[i] not in s_dict:
                s_dict[s[i]] = t[i]
        for i in range(len(t)):
            if t[i] not in t_dict:
                t_dict[t[i]] = s[i]
        for i in range(len(t)):
            if s_dict[s[i]] != t[i] or t_dict[t[i]] != s[i]:
                return False
        return True
```

```Python
class Solution(object):
    def isIsomorphic(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        s_dict = dict()
        t_dict = dict()                    
        for c1, c2 in zip(s, t):
            if (c1 not in s_dict) and (c2 not in t_dict):
                s_dict[c1] = c2
                t_dict[c2] = c1
            elif s_dict.get(c1) != c2 or t_dict.get(c2) != c1:
                return False
        return True
```

### Index Tracking

```Python
class Solution(object):
    def isIsomorphic(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        # Index Tracking
        #### Time Complexity:  O(N), travel through length of s and t
        #### Space Complexity: O(N), the size of lst can be as big as the size of input
        def helper(s):
            dictionary = dict()
            lst = list()
            for i, e in enumerate(s):
                if e not in dictionary:
                    dictionary[e] = i
                lst.append(str(dictionary[e]))
            return " ".join(lst)
        return helper(s) == helper(t)

