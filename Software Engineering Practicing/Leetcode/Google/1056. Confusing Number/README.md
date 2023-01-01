## 1056. Confusing Number

```Tag```:

#### Difficulty: Easy

![image](https://user-images.githubusercontent.com/35042430/210161363-1bf5f16b-3faa-491a-ae65-c2353a753cb5.png)


---


---

### Invert and Reverse with Hash Table

```Python
class Solution:
    def confusingNumber(self, n: int) -> bool:
        memo = {'0': 0, '1': 1, '6': 9, '8': 8, '9': 6}
        num_str = str(n)
        rotated = ""
        for i in range(len(num_str)-1, -1, -1):
            rotated += num_str[i]
        rotated_num = 0
        for i in range(len(rotated)):
            if not rotated[i] in memo:
                return False
            rotated_num += int(memo[rotated[i]]) * 10**(len(rotated)-1-i)
        return rotated_num != n
```
