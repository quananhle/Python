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

### Sliding WIndow

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
