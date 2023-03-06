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

![image](https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/Documents/2131/2131_palindromes.drawio.svg)

We see that the last word is the reverse of the first one, the second last word is the reverse of the second one, and so on. The palindrome of odd length contains a word in the middle. We call this word ```center```. All other words except the central one pair with their respective reversed words (e.g., ```ab``` pairs with ```ba```, ```xy``` pairs with ```yx```, ```nn``` pairs with ```nn```):

- A word that is not a palindrome itself, it occurs the same number of times as its reverse in the final string (e.g., the number of occurrences of ```ab``` in the palindrome is the same as the one of ```ba```). The maximum possible number of times such a word occurs in the palindrome is the minimum number of times this word and its reverse occur in the input (e.g., when there are 7 ```ab```'s and 4 ```ba```'s, we can only use 4 occurrences of ```ab``` and ```ba``` in the final string).

- A word that is a palindrome itself (consists of two equal letters), it occurs an odd number of times in the final string if and only if it is a central word because each word except the central one has a pair. Since there can be only one word in the middle, thus there will be only one palindromic word that occurs an odd number of times in the final string.

Have a look at some examples.

![image](https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/Documents/2131/2131_examples.drawio.svg)

There are 4 occurrences of ```aa```, 2 occurrences of ```pp``` and 6 occurrences of ```xx``` in the input. We can take all these words to the answer. The answer will contain 4 + 2 + 6 = 12 words.

There are 7 occurrences of ```mm```, 4 occurrences of ```nn``` and 5 occurrences of ```qq``` in the input. We can use each word an even number of times (6 ```mm```'s, 4 ```nn```'s and 4 ```qq```'s). The total number of used words is 6 + 4 + 4 = 14. But we haven't used all the words. There is one ```mm``` and one ```qq``` unused. We can use one of these as a central word, and the answer will contain 15 words.

![image](https://user-images.githubusercontent.com/35042430/223023160-af9e0687-a8ec-45d1-a962-10355e17e457.png)

### Hash Map

```Python
class Solution:
    def longestPalindrome(self, words: List[str]) -> int:
        ans = 0
        center = False

        counter = collections.defaultdict(int)
        for word in words:
            '''
            if not word in counter:
                counter[word] = 1
            else:
                counter[word] += 1
            '''
            counter[word] = 1 + counter.get(word, 0)

        for key, cnt in counter.copy().items():
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

---

### 2D Matrix

We already know that there are not more than ∣Σ|<sup>2</sup> distinct words. Let's think about which data structure other than a hash map we can use to count the words.

All possible two-letter words can be:

![image](https://leetcode.com/problems/longest-palindrome-by-concatenating-two-letter-words/Documents/2131/2131_matrix.drawio.svg)

![image](https://user-images.githubusercontent.com/35042430/223023187-14d51219-a7f5-4435-bd7f-94c7619911b8.png)

```Python
class Solution:
    def longestPalindrome(self, words: List[str]) -> int:
        alphabet = 26
        ans = 0
        center = False
        combinations = [[0 for _ in range(alphabet)] for _ in range(alphabet)]

        for word in words:
            combinations[ord(word[0]) - ord('a')][ord(word[1]) - ord('a')] += 1

        for i in range(alphabet):
            # Check palindrome word
            if combinations[i][i] % 2 == 0:
                ans += combinations[i][i]
            else:
                ans += combinations[i][i] - 1
                center = True
            # Check non-palindrome word
            for j in range(i + 1, alphabet):
                ans += 2 * min(combinations[i][j], combinations[j][i])

        if center:
            ans += 1
        
        return ans * 2
```
