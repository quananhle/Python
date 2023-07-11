## [2024. Maximize the Confusion of an Exam](https://leetcode.com/problems/maximize-the-confusion-of-an-exam/)

```Tag```: ```Sliding Window``` ```Binary Search```

#### Difficulty: Medium

A teacher is writing a test with ```n``` true/false questions, with ```'T'``` denoting true and ```'F'``` denoting false. He wants to confuse the students by __maximizing__ the number of consecutive questions with the same answer (multiple trues or multiple falses in a row).

You are given a string ```answerKey```, where ```answerKey[i]``` is the original answer to the $i^{th}$ question. In addition, you are given an integer ```k```, the maximum number of times you may perform the following operation:

- Change the answer key for any question to ```'T'``` or ```'F'``` (i.e., set ```answerKey[i]``` to ```'T'``` or ```'F'```).

Return _the maximum number of consecutive ```'T'```s or ```'F'```s in the answer key after performing the operation at most ```k``` times_.

![image](https://github.com/quananhle/Python/assets/35042430/5fdb85de-c488-45bd-8fe8-3e1d0cfa8157)

---

__Example 1:__
```
Input: answerKey = "TTFF", k = 2
Output: 4
Explanation: We can replace both the 'F's with 'T's to make answerKey = "TTTT".
There are four consecutive 'T's.
```

__Example 2:__
```
Input: answerKey = "TFFT", k = 1
Output: 3
Explanation: We can replace the first 'T' with an 'F' to make answerKey = "FFFT".
Alternatively, we can replace the second 'T' with an 'F' to make answerKey = "TFFF".
In both cases, there are three consecutive 'F's.
```

__Example 3:__
```
Input: answerKey = "TTFTTFTT", k = 1
Output: 5
Explanation: We can replace the first 'F' to make answerKey = "TTTTTFTT"
Alternatively, we can replace the second 'F' to make answerKey = "TTFTTTTT". 
In both cases, there are five consecutive 'T's.
```

__Constraints:__

- $n == answerKey.length$
- $1 <=$ ```n``` $<= 5 * 10^{4}$
- $answerKey[i]$ is either $'T'$ or $'F'$
- $1 <= k <= n$

---

### Sliding Window

![image](https://leetcode.com/problems/maximize-the-confusion-of-an-exam/Figures/2024/3.png)

- Time Complexity : $\mathcal{O}(N)$ where ```N``` is a number of characters in the input string.
- Space Complexity : $\mathcal{O}(1)$ since additional space is used only for a hashmap with at most ```2``` elements.

```Python
class Solution:
    def maxConsecutiveAnswers(self, answerKey: str, k: int) -> int:
        counter = collections.Counter(answerKey[:k])
        n = len(answerKey)
        start = 0
        ans = k

        for end in range(k, n):
            counter[answerKey[end]] += 1
            while min(counter['T'], counter['F']) > k:
                counter[answerKey[start]] -= 1
                start += 1

            ans = max(ans, end - start + 1)
        
        return ans
```

#### Longest Substring Template

```Python
class Solution:
    def maxConsecutiveAnswers(self, answerKey: str, k: int) -> int:
        n = len(answerKey)
        counter = collections.Counter()
        start = 0
        ans = 0

        if n == k:
            return n
        
        for end in range(n):
            right = answerKey[end]
            counter[right] += 1

            while min(counter['T'], counter['F']) > k:
                left = answerKey[start]
                counter[left] -= 1

                if counter[left] == 0:
                    del counter[left]
                
                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```

```Python
class Solution:
    def maxConsecutiveAnswers(self, answerKey: str, k: int) -> int:
        n = len(answerKey)
        counter = collections.Counter()
        start = 0
        ans = highest_frequency = 0

        if n <= k:
            return n
        
        for end in range(n):
            right = answerKey[end]
            counter[right] += 1

            highest_frequency = max(highest_frequency, counter[right])

            while end - start + 1 - highest_frequency > k:
                left = answerKey[start]
                counter[left] -= 1

                if counter[left] == 0:
                    del counter[left]

                start += 1
            
            ans = max(ans, end - start + 1)
        
        return ans
```

### Advanced Sliding Window

![image](https://leetcode.com/problems/maximize-the-confusion-of-an-exam/Figures/2024/s3.png)
![image](https://leetcode.com/problems/maximize-the-confusion-of-an-exam/Figures/2024/s4.png)

- Time Complexity : $\mathcal{O}(N)$ where ```N``` is a number of characters in the input string.
- Space Complexity : $\mathcal{O}(1)$ since additional space is used only for a hashmap with at most ```2``` elements.

```Python
class Solution:
    def maxConsecutiveAnswers(self, answerKey: str, k: int) -> int:
        n = len(answerKey)
        counter = collections.Counter()
        ans = 0

        if n == k:
            return n
        
        for end in range(n):
            right = answerKey[end]
            counter[right] += 1

            if min(counter.get('T', 0), counter.get('F', 0)) <= k:
                ans += 1
            else:
                left = answerKey[end - ans]
                counter[left] -= 1

                if counter[left] == 0:
                    del counter[left]
        
        return ans
```

---

### Binary Search & Fixed Size Sliding Window

![image](https://leetcode.com/problems/maximize-the-confusion-of-an-exam/Figures/2024/1.png)

![image](https://leetcode.com/problems/maximize-the-confusion-of-an-exam/Figures/2024/2.png)

- Time Complexity : $\mathcal{O}(N \cdot logN)$
- Space Complexity : $\mathcal{O}(N)$

```Python
class Solution:
    def maxConsecutiveAnswers(self, answerKey: str, k: int) -> int:
        n = len(answerKey)
        lo, hi = k, n

        def is_valid(size):
            counter = collections.Counter(answerKey[:size])
            if min(counter.get('T', 0), counter.get('F', 0)) <= k:
                return True
            for end in range(size, n):
                left, right = answerKey[end - size], answerKey[end]
                
                counter[right] += 1

                counter[left] -= 1
                if counter[left] == 0:
                    del counter[left]
                
                if min(counter.get('T', 0), counter.get('F', 0)) <= k:
                    return True

            return False

        while lo < hi:
            mi = hi - (hi - lo) // 2

            if is_valid(mi):
                lo = mi
            else:
                hi = mi - 1

        return lo
```
