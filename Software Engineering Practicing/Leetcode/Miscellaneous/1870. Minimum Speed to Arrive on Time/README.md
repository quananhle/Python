## [1870. Minimum Speed to Arrive on Time](https://leetcode.com/problems/minimum-speed-to-arrive-on-time/)

```Tag```: ```Binary Search```

#### Difficulty: Medium

You are given a floating-point number ```hour```, representing the amount of time you have to reach the office. To commute to the office, you must take ```n``` trains in sequential order. You are also given an integer array ```dist``` of length ```n```, where ```dist[i]``` describes the distance (in kilometers) of the ```i```<sup>th</sup> train ride.

Each train can only depart at an integer hour, so you may need to wait in between each train ride.

- For example, if the 1<sup>st</sup> train ride takes ```1.5``` hours, you must wait for an additional ```0.5``` hours before you can depart on the 2<sup>nd</sup> train ride at the 2 hour mark.

Return _the minimum positive integer speed (in kilometers per hour) that all the trains must travel at for you to reach the office on time, or ```-1``` if it is impossible to be on time._

Tests are generated such that the answer will not exceed ```10```<sup>7</sup> and ```hour``` will have at most two digits after the decimal point.

![image](https://github.com/quananhle/Python/assets/35042430/b9930612-1610-4125-ad0d-6234b57b206f)

---

__Example 1:__
```
Input: dist = [1,3,2], hour = 6
Output: 1
Explanation: At speed 1:
- The first train ride takes 1/1 = 1 hour.
- Since we are already at an integer hour, we depart immediately at the 1 hour mark. The second train takes 3/1 = 3 hours.
- Since we are already at an integer hour, we depart immediately at the 4 hour mark. The third train takes 2/1 = 2 hours.
- You will arrive at exactly the 6 hour mark.
```

__Example 2:__
```
Input: dist = [1,3,2], hour = 2.7
Output: 3
Explanation: At speed 3:
- The first train ride takes 1/3 = 0.33333 hours.
- Since we are not at an integer hour, we wait until the 1 hour mark to depart. The second train ride takes 3/3 = 1 hour.
- Since we are already at an integer hour, we depart immediately at the 2 hour mark. The third train takes 2/3 = 0.66667 hours.
- You will arrive at the 2.66667 hour mark.
```

__Example 3:__
```
Input: dist = [1,3,2], hour = 1.9
Output: -1
Explanation: It is impossible because the earliest the third train can depart is at the 2 hour mark.
```

__Constraints:__

- $n == dist.length$
- $1 \le \le 10^{5}$
- $1 \le dist[i] \le 10^{5}$
- $1 \le hour \le 10^{9}$
- There will be at most two digits after the decimal point in ```hour```.

---

![image](https://leetcode.com/problems/minimum-speed-to-arrive-on-time/Figures/1870/1870A.png)

### Binary Search

__Complexity Analysis__

Here, ```N``` is the number of rides, and ```K``` is the size of the search space. For this problem, ```K``` is equal to $10^7$.

- __Time Complexity__: $ \mathcal{O}(N \log K)$
- __Space Complexity__: $ \mathcal{O}(1)$

```Python
class Solution:
    def minSpeedOnTime(self, dist: List[int], hour: float) -> int:
        lo, hi, ans = 1, 10**7, -1

        def is_ontime(speed, hour):
            time = 0.0

            for i in range(len(dist)):
                t = dist[i] / speed
                # Round up to the next integer, if not the last ride.
                if i == len(dist) - 1:
                    time += t
                else:
                    time += math.ceil(t)

            return time <= hour


        while lo <= hi:
            mi = lo + (hi - lo) // 2

            if is_ontime(mi, hour):
                ans = mi
                hi = mi - 1
            else:
                lo = mi + 1

        return ans
```
