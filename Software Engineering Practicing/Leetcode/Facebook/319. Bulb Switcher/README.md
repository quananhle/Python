## [319. Bulb Switcher](https://leetcode.com/problems/bulb-switcher)

```Tag```: ```Brainteaser``` ```Bitwise Manipulation```

#### Difficulty: Medium

There are ```n``` bulbs that are initially off. You first turn on all the bulbs, then you turn off every second bulb.

On the third round, you toggle every third bulb (turning on if it's off or turning off if it's on). For the ```i```<sup>```th```</sup> round, you toggle every ```i``` bulb. For the ```n```<sup>```th```</sup> round, you only toggle the last bulb.

Return _the number of bulbs that are on after ```n``` rounds_.

![image](https://user-images.githubusercontent.com/35042430/234915900-4726c92a-5c83-49dd-bea9-1443f0b7e9ab.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/05/bulb.jpg)
```
Input: n = 3
Output: 1
Explanation: At first, the three bulbs are [off, off, off].
After the first round, the three bulbs are [on, on, on].
After the second round, the three bulbs are [on, off, on].
After the third round, the three bulbs are [on, off, off]. 
So you should return 1 because there is only one bulb is on.
```

__Example 2:__
```
Input: n = 0
Output: 0
```

__Example 3:__
```
Input: n = 1
Output: 1
```

__Constraints:__

- 0 <= ```n``` <= 10<sup>9</sup>

---

As all the bulbs are initially off, at the end __only bulbs that are toggled an odd number of times will remain on__.

Now, whenever we are at a round ```i``` we know we toggle all bulbs having a factor ```i```. Thus, we need to find the bulbs which have an odd number of factors, as those bulbs will be toggled an odd number of times (once by each factor).

It might be unintuitive, but with a few examples, we can easily see that a perfect square number has an odd number of factors, since any number's factors come in pairs of two different numbers, but the square root of the number will be paired with itself.

Let's take an example to make it more clear. Suppose ```n = 10```. So, the number of rounds is ```10```. In each round, we will toggle some of the bulbs.

![image](https://leetcode.com/problems/bulb-switcher/Figures/319/Slide.PNG)

Track of rounds in which each bulb is toggled:

- __Bulb 1__: Round 1 (__odd number of toggles__)
- __Bulb 2__: Round 1, Round 2
- __Bulb 3__: Round 1, Round 3
- __Bulb 4__: Round 1, Round 2, Round 4 (__odd number of toggles__)
- __Bulb 5__: Round 1, Round 5
- __Bulb 6__: Round 1, Round 2, Round 3, Round 6
- __Bulb 7__: Round 1, Round 7
- __Bulb 8__: Round 1, Round 2, Round 4, Round 8
- __Bulb 9__: Round 1, Round 3, Round 9 (__odd number of toggles__)
- __Bulb 10__: Round 1, Round 2, Round 5, Round10

So, the number of bulbs that are on after 10 rounds is 3: Bulb 1, Bulb 4, and Bulb 9.

```Python
class Solution:
    def bulbSwitch(self, n: int) -> int:
        return isqrt(n)
```

```Python
class Solution:
    def bulbSwitch(self, n: int) -> int:
        return int(math.sqrt(n))
```

### Bitwise Operators

```Python
class Solution:
    def bulbSwitch(self, n: int) -> int:
        if n:
            # Find MSB(Most significant Bit) of n
            msb = int(math.log(n, 2))
        else:
            msb = 0

        ans = 0

        '''
        a = 2 ** msb
        '''
        a = 1 << msb

        while a:
            # Check whether the current value of 'a' can be added or not
            if (ans + a) * (ans + a) <= n:
                ans += a
            
            '''
            a = a / 2
            '''
            a >>= 1
            
        # Return the result
        return ans
```
