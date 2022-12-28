## 14. Longest Common Prefix

```Tag```: ```Array```

#### Difficulty: Easy

Write a function to find the __longest common prefix__ string amongst an array of strings.

If there is no common prefix, return an empty string ```""```.

![image](https://user-images.githubusercontent.com/35042430/209771318-86468ad4-819a-4975-aded-c0ea44e98017.png)

---

__Example 1:__

```
Input: strs = ["flower","flow","flight"]
Output: "fl"
```

__Example 2:__

```
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
```

__Constraints:__

```
1 <= strs.length <= 200
0 <= strs[i].length <= 200
strs[i] consists of only lowercase English letters.
```

---

### Vertical Scanning

```Python
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        # Vertical scanning
        #### Time Complexity: O(S), S is the sum of all character in the input
        #### Space Complexity: O(1), constant extra space as the size cannot exceed the length of the shortest string in the input
        ans = list()

        for i in range(len(strs[0])):
            for s in strs:
                print (s[i], strs[0][i])
                if i == len(s) or s[i] != strs[0][i]:
                    return ''.join(ans)
            ans.append(s[i])

        return ''.join(ans)
```
