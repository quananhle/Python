## 139. Word Break

```Tag```: ```Dynamic Programming```

#### Difficulty: Medium

Given a string ```s``` and a dictionary of strings ```wordDict```, return _```true``` if ```s``` can be segmented into a space-separated sequence of one or more dictionary words_.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

![image](https://user-images.githubusercontent.com/35042430/219778036-477a29ba-d8d6-4d23-a329-111121cf2e9b.png)

---

__Example 1:__
```
Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".
```

__Example 2:__
```
Input: s = "applepenapple", wordDict = ["apple","pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
Note that you are allowed to reuse a dictionary word.
```

__Example 3:__
```
Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false
```

__Constraints:__

- ```1 <= s.length <= 300```
- ```1 <= wordDict.length <= 1000```
- ```1 <= wordDict[i].length <= 20```
- ```s``` and ```wordDict[i]``` consist of only lowercase English letters.
- All the ```strings``` of ```wordDict``` are unique.

---

