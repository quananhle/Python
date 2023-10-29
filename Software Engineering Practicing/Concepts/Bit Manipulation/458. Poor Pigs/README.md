## [458. Poor Pigs](https://leetcode.com/problems/poor-pigs)

```Tag``` ```Quantum Bit```

#### Difficulty: Hard

There are buckets ```buckets``` of liquid, where exactly one of the buckets is poisonous. To figure out which one is poisonous, you feed some number of (poor) pigs the liquid to see whether they will die or not. Unfortunately, you only have ```minutesToTest``` minutes to determine which bucket is poisonous.

You can feed the pigs according to these steps:

1. Choose some live pigs to feed.
2. For each pig, choose which buckets to feed it. The pig will consume all the chosen buckets simultaneously and will take no time. Each pig can feed from any number of buckets, and each bucket can be fed from by any number of pigs.
3. Wait for ```minutesToDie``` minutes. You may not feed any other pigs during this time.
4. After ```minutesToDie``` minutes have passed, any pigs that have been fed the poisonous bucket will die, and all others will survive.
5. Repeat this process until you run out of time.

Given ```buckets```, ```minutesToDie```, and ```minutesToTest```, return _the minimum number of pigs needed to figure out which bucket is poisonous within the allotted time_.

![image](https://github.com/quananhle/Python/assets/35042430/0f1df5fa-b3a5-46d6-bf29-7c89e846ef12)

---

__Example 1:__
```
Input: buckets = 4, minutesToDie = 15, minutesToTest = 15
Output: 2
Explanation: We can determine the poisonous bucket as follows:
At time 0, feed the first pig buckets 1 and 2, and feed the second pig buckets 2 and 3.
At time 15, there are 4 possible outcomes:
- If only the first pig dies, then bucket 1 must be poisonous.
- If only the second pig dies, then bucket 3 must be poisonous.
- If both pigs die, then bucket 2 must be poisonous.
- If neither pig dies, then bucket 4 must be poisonous.
```

__Example 2:__
```
Input: buckets = 4, minutesToDie = 15, minutesToTest = 30
Output: 2
Explanation: We can determine the poisonous bucket as follows:
At time 0, feed the first pig bucket 1, and feed the second pig bucket 2.
At time 15, there are 2 possible outcomes:
- If either pig dies, then the poisonous bucket is the one it was fed.
- If neither pig dies, then feed the first pig bucket 3, and feed the second pig bucket 4.
At time 30, one of the two pigs must die, and the poisonous bucket is the one it was fed.
```

__Constraints:__

- $1 \le buckets \le 1000$
- $1 \le minutesToDie \le minutesToTest \le 100$

---
