## [2264. Largest 3-Same-Digit Number in String](https://leetcode.com/problems/largest-3-same-digit-number-in-string)

```Tag```: ```Array & String``` ```Hash Map``` ```Math```

#### Difficulty: Easy

You are given a string ```num``` representing a large integer. An integer is good if it meets the following conditions:

- It is a substring of ```num``` with length ```3```.
- It consists of only one unique digit.

Return _the maximum good integer as a string or an empty string ```""``` if no such integer exists_.

__Note__:

- A substring is a contiguous sequence of characters within a string.
- There may be leading zeroes in ```num``` or a good integer.

---

__Example 1:__
```
Input: num = "6777133339"
Output: "777"
Explanation: There are two distinct good integers: "777" and "333".
"777" is the largest, so we return "777".
```

__Example 2:__
```
Input: num = "2300019"
Output: "000"
Explanation: "000" is the only good integer.
```

__Example 3:__
```
Input: num = "42352338"
Output: ""
Explanation: No substring of length 3 consists of only one unique digit. Therefore, there are no good integers.
```

__Constraints:__

- $3 \le num.length \le 1000$
- ```num``` only consists of digits.

---

### Array & String

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def largestGoodInteger(self, num: str) -> str:
        n = len(num)

        def is_good_substring(arr):
            if len(arr) < 3:
                return False
            return arr[2] == arr[1] == arr[0]

        candidate = -1

        for i in range(2, n):
            if is_good_substring(num[i-2:i+1]):
                candidate = max(candidate, int(num[i]))
        
        return "" if candidate == -1 else str(candidate) * 3
```

---

### Hash Map

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$
- __Space Complexity__: $\mathcal{O}(N)$

```Python
class Solution:
    def largestGoodInteger(self, num: str) -> str:
        counter = collections.defaultdict(list)
        for i, c in enumerate(num):
            counter[c].append(i)
        
        def is_contiguos(arr):
            n = len(arr)
            '''
            for i in range(1, n - 1):
                if (arr[i + 1] - arr[i]) == 1 and (arr[i] - arr[i - 1]) == 1:
            '''
            for i in range(2, n):
                if (arr[i] - arr[i - 1]) == 1 and (arr[i - 1] - arr[i - 2]) == 1:
                    return True
            return False

        candidate = -1

        for key, val in counter.items():
            if is_contiguos(val) and len(val) >= 3:
                candidate = max(candidate, int(key))
        
        return "" if candidate == -1 else str(candidate) * 3
```
