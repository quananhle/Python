## [2251. Number of Flowers in Full Bloom](https://leetcode.com/problems/number-of-flowers-in-full-bloom)

```Tag```: ```Interval```

#### Difficulty: Hard

You are given a 0-indexed 2D integer array ```flowers```, where $flowers[i] = [start_i, end_i]$ means the $i^{th}$ flower will be in full bloom from $start_i$ to $end_i$ (inclusive). You are also given a 0-indexed integer array ```people``` of size ```n```, where ```people[i]``` is the time that the $i^{th}$ person will arrive to see the flowers.

Return _an integer array answer of size ```n```, where ```answer[i]``` is the number of flowers that are in full bloom when the $i^{th}$ person arrives_.

![image](https://github.com/quananhle/Python/assets/35042430/b9ef293d-db24-4415-867c-7f1c2a64e27d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/03/02/ex1new.jpg)
```
Input: flowers = [[1,6],[3,7],[9,12],[4,13]], poeple = [2,3,7,11]
Output: [1,2,2,2]
Explanation: The figure above shows the times when the flowers are in full bloom and when the people arrive.
For each person, we return the number of flowers in full bloom during their arrival.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/03/02/ex2new.jpg)
```
Input: flowers = [[1,10],[3,3]], poeple = [3,3,2]
Output: [2,2,1]
Explanation: The figure above shows the times when the flowers are in full bloom and when the people arrive.
For each person, we return the number of flowers in full bloom during their arrival.
```

__Constraints:__

- $1 \le flowers.length \le 5 * 10^4$
- $flowers[i].length == 2$
- $1 \le start_i \le end_i \le 10^9$
- $1 \le people.length \le 5 * 10^4$
- $1 \le people[i] \le 109$

---
