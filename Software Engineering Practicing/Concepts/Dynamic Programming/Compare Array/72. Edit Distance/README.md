## [72. Edit Distance](https://leetcode.com/problems/edit-distance/)

```Tag```: ```Dynamic Programming```

#### Difficulty: Hard

Given two strings ```word1``` and ```word2```, return _the minimum number of operations required to convert ```word1``` to ```word2```_.

You have the following three operations permitted on a word:

- Insert a character
- Delete a character
- Replace a character

![image](https://github.com/quananhle/Python/assets/35042430/cce519e7-4480-4315-b317-ceda2b812196)

---

__Example 1:__

```
Input: word1 = "horse", word2 = "ros"
Output: 3
Explanation: 
horse -> rorse (replace 'h' with 'r')
rorse -> rose (remove 'r')
rose -> ros (remove 'e')
```

__Example 2:__

```
Input: word1 = "intention", word2 = "execution"
Output: 5
Explanation: 
intention -> inention (remove 't')
inention -> enention (replace 'i' with 'e')
enention -> exention (replace 'n' with 'x')
exention -> exection (replace 'n' with 'c')
exection -> execution (insert 'u')
```

__Constraints:__

- $0 \le word1.length, word2.length \le 500$
- ```word1``` and ```word2``` consist of lowercase English letters.

---

__Edit distance__ is a term used in computer science. By definition, __Edit distance__ is a string metric, a way of quantifying how dissimilar two strings (e.g. words) are to one another, measured by counting the minimum number of operations required to transform one string into the other.

![image](https://leetcode.com/problems/edit-distance/Figures/72/transform_example.png)

1. "If the two strings are the same, the edit distance is zero".

```word1 = "abcd"```, ```word2 = "abcd"```

Edit Distance = 0
word1 is equal to word2; no need to add, remove or replace any character.

2. "The operations (add/delete/replace) are performed if and only if a character at a certain position in ```word1``` is not equal to the corresponding character in ```word2"```.

```word1 = "abc"```, ```word2 = "abe"```

In this case, we have to perform some operation in ```word1``` to transform it into ```word2```. There are 3 options,

- Option 1 - Delete ```c``` from ```word1```.

- Option 2 - Insert ```e``` into ```word1```.

- Option 3 - Replace ```c``` with ```e``` in word1.

![image](https://leetcode.com/problems/edit-distance/Figures/72/all_illustrations.png)

From the above illustrations, it is clear that Option 1 and Option 2 transform ```word1``` to ```word2``` in 2 operations. Thus, the edit distance is 2. And, Option 3 transforms ```word1``` to ```word2``` in just 1 operation, thus edit distance is 1.

Thus, in this case, we will choose Option 3 and the edit distance would be 1.

![image](https://github.com/quananhle/Python/assets/35042430/b3e36671-a47e-4b5c-9be1-d522999e8047)

__The +1 in the end, is for the current operation.__

### Brute Force

```Python

```

### Dynamic Programming Framework

1. A function or data structure that will compute/contain the answer to the problem for every given state.

    There are two input strings, ```word1``` and ```word2```. Start by comparing every character in ```word1``` and ```word2```. Let's track the current character index as ```i``` and ```j```. Here, we are comparing the last index of both strings.

2. A recurrence relation to transition between states.

    For every comparison, there are two possibilities,

    - The characters in the current position match

        `word1[i] = word2[j]`

    Move to the next index. No operation is performed.
    
    - The characters in their current position do not match

        `word1[word1Index] != word2[word2Index]`
        
    In this case, we must delete, insert or replace a character in ```word1```. From intuition, we have deduced that we must try all three operations and find the minimum. One of the intuitive ways to implement such problems is by using recursion.
    
        - Replace the character at i in word1 with the character at j in word2.

![image](https://leetcode.com/problems/edit-distance/Figures/72/replace_illustration.png)

  **Recurrence Relation**: ```dp(word1, word2, i - 1, j - 1) + 1```
  
        - Inserting the character at word2Index in word2 in word1.

![image](https://leetcode.com/problems/edit-distance/Figures/72/insert_illustration.png)

  **Recurrence Relation**: ```dp(word1, word2, i, j - 1) + 1```
  
        - Deleting the character at word1Index in word1.
        
![image](https://leetcode.com/problems/edit-distance/Figures/72/delete_illustration.png)

  **Recurrence Relation**: ```dp(word1, word2, i - 1, j) + 1```

![image](https://user-images.githubusercontent.com/35042430/221479477-e7d25223-3be5-436b-a504-2bf9ecba1be9.png)

3. Base cases, so that our recurrence relation doesn't go on infinitely.

![image](https://user-images.githubusercontent.com/35042430/221479514-4d1e2544-d671-42c5-b2a6-443276743f2b.png)

#### Top-Down Dynamic Programming (Recursion)

![image](https://leetcode.com/problems/edit-distance/Figures/72/edit_distance_tree.png)

```Python
class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        n1, n2 = len(word1), len(word2)
        # Top-Down DP (Recursion)

        @lru_cache(None)
        def dp(i, j):
            # Base cases
            # Check if word1 is empty, can only insert characters of word2 in word1
            if i == 0:
                # Return the edit distance is the number of characters in word2
                return j
            # Check if word2 is empty, can only delete remaining characters of word1
            if j == 0:
                # Return the edit distance is the number of characters in word1
                return i
            # Characters in current positions match
            if word1[i - 1] == word2[j - 1]:
                return dp(i - 1, j - 1)

            # Recurrence relation
            return min(dp(i - 1, j), dp(i, j - 1), dp(i - 1, j - 1)) + 1

        return dp(n1, n2)
```

```Python
class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        n1, n2 = len(word1), len(word2)
        # Top-Down DP (Recursion)

        @lru_cache(None)
        def dp(i, j):
            # Base cases
            # Check if word1 is all checked up, can only insert characters of word2 in word1
            if i == len(word1):
                # Return the edit distance is the number of characters in word2
                return len(word2) - j
            # Check if word2 is all checked up, can only delete remaining characters of word1
            if j == len(word2):
                # Return the edit distance is the number of characters in word1
                return len(word1) - i
            # Characters in current positions match
            if word1[i] == word2[j]:
                return dp(i + 1, j + 1)

            # Recurrence relation
            return min(dp(i + 1, j), dp(i, j + 1), dp(i + 1, j + 1)) + 1        # Delete, Insert, Replace

        return dp(0, 0)
```

```Python
class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        n1, n2 = len(word1), len(word2)
        memo = collections.defaultdict(int)
        # Top-Down DP (Recursion)
        def dp(i, j):
            # Base cases
            # Check if word1 is empty, can only insert characters of word2 in word1
            if i == len(word1):
                # Return the edit distance is the number of characters in word2
                return len(word2) - j
            # Check if word2 is empty, can only delete remaining characters of word1
            if j == len(word2):
                # Return the edit distance is the number of characters in word1
                return len(word1) - i
            # Characters in current positions match
            if word1[i] == word2[j]:
                memo[(i, j)] = dp(i + 1, j + 1)

            if (i, j) in memo:
                return memo[(i, j)]

            # Recurrence relation
            memo[(i, j)] = min(dp(i + 1, j), dp(i, j + 1), dp(i + 1, j + 1)) + 1      # Delete, Insert, Replace
            return memo[(i, j)]

        return dp(0, 0)
```

#### Bottom-Up Dynamic Programming (Tabulation)

![image](https://leetcode.com/problems/edit-distance/Figures/72/dp_base_case.png)

![image](https://leetcode.com/problems/edit-distance/Figures/72/dp_equal_characters.png)

![image](https://leetcode.com/problems/edit-distance/Figures/72/dp_all_operations.png)

```Python
class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        n, m = len(word1), len(word2)
        # Bottom-Up DP (Tabulation)
        dp = [[0 for _ in range(m + 1)] for _ in range(n + 1)]

        for i in range(1, n + 1):
            dp[i][0] = i
        for j in range(1, m + 1):
            dp[0][j] = j
        
        for i in range(1, n + 1):
            for j in range(1, m + 1):
                if word1[i - 1] == word2[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
                else:
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1      # Delete, Insert, Replace
                    
        return dp[n][m]
```

```Python
class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        n, m = len(word1), len(word2)
        dp = [[0 for _ in range(m + 1)] for _ in range(n + 1)]
        
        for i in range(n + 1):
            for j in range(m + 1):
                if i == 0:
                    dp[i][j] = j
                elif j == 0:
                    dp[i][j] = i
                elif word1[i - 1] == word2[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1]
                else:
                    dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1      # Delete, Insert, Replace
                    
        return dp[n][m]
```
