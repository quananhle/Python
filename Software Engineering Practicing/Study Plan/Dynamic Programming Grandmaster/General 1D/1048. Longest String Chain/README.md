## [1048. Longest String Chain](https://leetcode.com/problems/longest-string-chain)

```Tag```: ```Dynamic Programming```

####  Difficulty: Medium

You are given an array of ```words``` where each word consists of lowercase English letters.

```wordA``` is a predecessor of ```wordB``` if and only if we can insert exactly one letter anywhere in ```wordA``` without changing the order of the other characters to make it equal to ```wordB```.

For example, ```"abc"``` is a predecessor of ```"abac"```, while ```"cba"``` is not a predecessor of ```"bcad"```.
A word chain is a sequence of words ```[word1, word2, ..., wordk]``` with ```k >= 1```, where ```word1``` is a predecessor of ```word2```, ```word2``` is a predecessor of` ```word3```, and so on. A single word is trivially a word chain with ```k == 1``` .

Return _the __length__ of the __longest possible word chain__ with words chosen from the given list of ```words```_.

![image](https://github.com/quananhle/Python/assets/35042430/f886d9b0-2a88-48aa-8dc7-b1265416adbb)

---

__Example 1__:
```
Input: words = ["a","b","ba","bca","bda","bdca"]
Output: 4
Explanation: One of the longest word chains is ["a","ba","bda","bdca"].
```

__Example 2__:
```
Input: words = ["xbc","pcxbcf","xb","cxbc","pcxbc"]
Output: 5
Explanation: All the words can be put in a word chain ["xb", "xbc", "cxbc", "pcxbc", "pcxbcf"].
```

__Example 3__:
```
Input: words = ["abcd","dbqca"]
Output: 1
Explanation: The trivial word chain ["abcd"] is one of the longest word chains.
["abcd","dbqca"] is not a valid word chain because the ordering of the letters is changed.
```

__Constraints__:

- $1 \le words.length \le 1000$
- $1 \le words[i].length \le 16$
- ```words[i]``` only consists of lowercase English letters.

---

### Longest Increasing Subsequence

1. Firstly, we sort ```words``` in increasing order by their length, to ensure that the length of the previous word is no longer than length of the current word, it means ```len(words[j]) <= len(word[i])```, where ```j < i```.
2. Let ```dp[i]``` be the __longest increasing subsequencep__ which ends at ```words[i]```.
3. To check if ```prev``` is a predecessor of ```curr```, we need to check
  - ```len(prev) + 1``` must equal to ```len(curr)```.
  - ```prev``` must be a subsequence of ```curr```.

```Python
class Solution:
    def longestStrChain(self, words: List[str]) -> int:
        n = len(words)
        words.sort(key=len)
        memo = collections.defaultdict(lambda: 1)
        ans = 1

        def is_predecessor(curr, prev):
            # Base case
            if len(curr) - 1 != len(prev):
                return False

            # Check if the previous word is the subsequence of the current word
            i = 0
            for char in curr:
                if i == len(prev):
                    break
                if prev[i] == char:
                    i += 1
                
            return i == len(prev)

        for i in range(1, n):
            for j in range(i):
                # Check if words[j] is predecessor of words[i]
                if is_predecessor(words[i], words[j]) and memo[i] < memo[j] + 1:
                    memo[i] = memo[j] + 1
            ans = max(ans, memo[i])
        
        return ans
```
