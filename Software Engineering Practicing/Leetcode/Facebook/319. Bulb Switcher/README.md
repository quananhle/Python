## [319. Bulb Switcher](https://leetcode.com/problems/bulb-switcher)

```Tag```: ```Brainteaser```

#### Difficulty: Medium

There are ```n``` bulbs that are initially off. You first turn on all the bulbs, then you turn off every second bulb.

On the third round, you toggle every third bulb (turning on if it's off or turning off if it's on). For the ```i```<sup>```th```</sup> round, you toggle every ```i``` bulb. For the ```n```</sup>```th```</sup> round, you only toggle the last bulb.

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
