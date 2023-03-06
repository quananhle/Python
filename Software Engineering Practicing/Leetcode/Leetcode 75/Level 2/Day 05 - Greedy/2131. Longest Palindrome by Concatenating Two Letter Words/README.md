## [2131. Longest Palindrome by Concatenating Two Letter Words](https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/)

```Tag```: ```Greedy``` ```Hash Map```

#### Difficulty: Medium

You are given an array of strings ```words```. Each element of ```words``` consists of two lowercase English letters.

Create the __longest possible palindrome__ by selecting some elements from ```words``` and concatenating them in __any order__. Each element can be selected __at most once__.

Return _the __length__ of the longest palindrome that you can create_. If it is impossible to create any palindrome, return ```0```.

A __palindrome__ is a string that reads the same forward and backward.

![image](https://user-images.githubusercontent.com/35042430/223014349-27a8281a-dd3d-4fa2-bebc-0ac671bd7606.png)

---

__Example 1:__
```
Input: words = ["lc","cl","gg"]
Output: 6
Explanation: One longest palindrome is "lc" + "gg" + "cl" = "lcggcl", of length 6.
Note that "clgglc" is another longest palindrome that can be created.
```

__Example 2:__
```
Input: words = ["ab","ty","yt","lc","cl","ab"]
Output: 8
Explanation: One longest palindrome is "ty" + "lc" + "cl" + "yt" = "tylcclyt", of length 8.
Note that "lcyttycl" is another longest palindrome that can be created.
```

__Example 3:__
```
Input: words = ["cc","ll","xx"]
Output: 2
Explanation: One longest palindrome is "cc", of length 2.
Note that "ll" is another longest palindrome that can be created, and so is "xx".
```

__Constraints:__

- 1 <= ```words.length``` <= 10<sup>5</sup>
- ```words[i].length == 2```
- ```words[i]``` consists of lowercase English letters.

---

### Hash Map

```Python
class Solution:
    def longestPalindrome(self, words: List[str]) -> int:
        ans = 0
        center = False
        
        counter = collections.Counter(words)
        for key, cnt in counter.items():
            # Check if the word is a palindrome
            if key[0] == key[1]:
                if cnt % 2 == 0:
                    ans += cnt
                else:
                    ans += cnt - 1
                    center = True
            elif key[0] < key[1]:
                ans += 2 * min(cnt, counter[key[1] + key[0]])
        
        if center:
            ans += 1
            
        return ans*2
```

