## [735. Asteroid Collision](https://leetcode.com/problems/asteroid-collision/)

```Tag```: ```Stack```

#### Difficulty: Medium

We are given an array ```asteroids``` of integers representing asteroids in a row.

For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left). Each asteroid moves at the same speed.

Find out the state of the asteroids after all collisions. If two asteroids meet, the smaller one will explode. If both are the same size, both will explode. Two asteroids moving in the same direction will never meet.

![image](https://user-images.githubusercontent.com/35042430/226216224-e4df5132-bef4-48fa-9673-39c2125e502f.png)

---

__Example 1:__
```
Input: asteroids = [5,10,-5]
Output: [5,10]
Explanation: The 10 and -5 collide resulting in 10. The 5 and 10 never collide.
```

__Example 2:__
```
Input: asteroids = [8,-8]
Output: []
Explanation: The 8 and -8 collide exploding each other.
```

__Example 3:__
```
Input: asteroids = [10,2,-5]
Output: [10]
Explanation: The 2 and -5 collide resulting in -5. The 10 and -5 collide resulting in 10.
```

__Constraints:__

- ```2 <= asteroids.length <= 10^4```
- ```-1000 <= asteroids[i] <= 1000```
- ```asteroids[i] != 0```

---

### Stack

![image](https://assets.leetcode.com/users/images/60a52a77-d4f5-43f3-aa24-615bb4b77525_1620089157.483139.gif)

- __Time Complexity__: ```O(N)```
- __Space Complexity__: ```O(N)```

```Python
class Solution:
    def asteroidCollision(self, asteroids: List[int]) -> List[int]:
        ans = list()
        n = len(asteroids)
        for asteroid in asteroids:
            # Check if stack is not empty and the new asteroid is in the opposite direction with the last asteroid of the stack
            while ans and asteroid < 0 < ans[-1]:
                # Check if the last asteroid of the stack is smaller than the new asteroid
                if ans[-1] < -asteroid:
                    # Explode the smaller one in the stack
                    ans.pop()
                    continue                    # [-2,-2,1,-2] -> [-2,-2,-2]
                # Check if the last asteroid is of the same size with the new asteroid 
                elif ans[-1] == -asteroid:
                    # Explode the last asteroid of the stack
                    ans.pop()
                # Break out of the loop
                break
            else:
                ans.append(asteroid)
        return ans
```

```Python
class Solution:
    def asteroidCollision(self, asteroids: List[int]) -> List[int]:
        ans = [-1]
        for asteroid in asteroids:
            while asteroid < 0 < ans[-1]:
                if -asteroid < ans[-1] or -asteroid == ans.pop():
                    break
            else:
                ans.append(asteroid)
        return ans[1:]
```

```Python
class Solution:
    def asteroidCollision(self, asteroids: List[int]) -> List[int]:
        res = list()

        for asteroid in asteroids:
            while res and res[-1] > 0 and asteroid < 0:
                if res[-1] + asteroid < 0:
                    res.pop()
                elif res[-1] + asteroid > 0:
                    break
                else:
                    res.pop()
                    break
            else:
                res.append(asteroid)
                
        return res
```
