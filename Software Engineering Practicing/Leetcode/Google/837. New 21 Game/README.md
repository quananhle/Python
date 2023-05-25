## [837. New 21 Game](https://leetcode.com/problems/new-21-game/)

```Tag```:

#### Difficulty: Medium

Alice plays the following game, loosely based on the card game ```"21"```.

Alice starts with ```0``` points and draws numbers while she has less than ```k``` points. During each draw, she gains an integer number of points randomly from the range ```[1, maxPts]```, where ```maxPts``` is an integer. Each draw is independent and the outcomes have equal probabilities.

Alice stops drawing numbers when she gets ```k``` or more points.

Return _the probability that Alice has ```n``` or fewer points_.

Answers within 10<sup>-5</sup> of the actual answer are considered accepted.

![image](https://github.com/quananhle/Python/assets/35042430/924fb8a1-4d25-44b7-8a9f-43789b0da626)

---

__Example 1:__
```
Input: n = 10, k = 1, maxPts = 10
Output: 1.00000
Explanation: Alice gets a single card, then stops.
```

__Example 2:__
```
Input: n = 6, k = 1, maxPts = 10
Output: 0.60000
Explanation: Alice gets a single card, then stops.
In 6 out of 10 possibilities, she is at or below 6 points.
```

__Example 3:__
```
Input: n = 21, k = 17, maxPts = 10
Output: 0.73278
```

__Constraints:__

- ```0``` <= ```k``` <= ```n``` <= 10<sup>4</sup>
- ```1``` <= ```maxPts``` <= 10<sup>4</sup>

---


 
