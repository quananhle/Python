## 202. Happy Number

```Tag```: ```Hash Set```

#### Difficulty: Easy

Write an algorithm to determine if a number ```n``` is happy.

A __happy number__ is a number defined by the following process:

- Starting with any positive integer, replace the number by the sum of the squares of its digits.
- Repeat the process until the number equals 1 (where it will stay), or it __loops endlessly in a cycle__ which does not include 1.
- Those numbers for which this process ends in 1 are happy.

Return _```true``` if n is a happy number, and ```false``` if not_.

![image](https://user-images.githubusercontent.com/35042430/213296655-e5f5a784-252e-4e67-a5b5-f4bbbd284353.png)

---

__Example 1:__
```
Input: n = 19
Output: true
```

Explanation:

1<sup>2</sup> + 9<sup>2</sup> = 82

8<sup>2</sup> + 2<sup>2</sup> = 68

6<sup>2</sup> + 8<sup>2</sup> = 100

1<sup>2</sup> + 0<sup>2</sup> + 0<sup>2</sup> = 1


__Example 2:__
```
Input: n = 2
Output: false
```

__Constraints:__
```
1 <= n <= 231 - 1
```

---

![image](https://leetcode.com/problems/happy-number/solutions/421162/Figures/202/image1.png)

![image](https://leetcode.com/problems/happy-number/solutions/421162/Figures/202/image2.png)

### Hash Set

```Python
class Solution:
    def isHappy(self, n: int) -> bool:
        # Time Complexity : O(logN), divide n by 10 or traverse through the length of string of n
        # Space Complexity: O(logN)
        seen = set()
        while n != 1:
            if n in seen:
                return False
            seen.add(n)
            n = sum([int(num)**2 for num in str(n)])
        return True
```

```Python
class Solution:
    def isHappy(self, n: int) -> bool:
        # Time Complexity : O(logN), divide n by 10 or traverse through the length of string of n
        # Space Complexity: O(logN)
        def get_next(n):
            total = 0
            while n > 0:
                '''
                n, digit = divmod(n, 10)
                total += digit ** 2
                '''
                mod = n % 10
                total += mod**2
                n //= 10
            return total

        seen = set()
        while n != 1 and not n in seen:
            seen.add(n)
            n = get_next(n)

        return n == 1
```

### Floyd's Cycle-Finding Algorithm

![image](https://user-images.githubusercontent.com/35042430/213306981-d300dfcc-2536-4286-a89c-4d56144505df.png)

Detect the cycle. If there is no cycle, return True.

```Python
class Solution:
    def isHappy(self, n: int) -> bool:
        def get_next(n):
            total = 0
            while n > 0:
                '''
                n, digit = divmod(n, 10)
                total += digit ** 2
                '''
                mod = n % 10
                total += mod**2
                n //= 10
            return total

        slow = n
        fast = get_next(n)
        # If slow meets fast, cycle detected. If there is no circle, eventually fast will be 1
        while slow != 1 and slow != fast:
            # Turtoise moves 1 node at a time. Hare moves 2 nodes at a time
            slow = get_next(slow)
            fast = get_next(get_next(fast))
        return fast == 1
```
