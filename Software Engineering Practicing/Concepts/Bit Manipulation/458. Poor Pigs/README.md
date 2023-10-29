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

### Quantum bit

#### Intuition

__How many states does a pig have__

If there is no time to test, i.e. $minutesToTest / minutesToDie = 0$, the pig has only one state - ```alive```.

If $minutesToTest / minutesToDie = 1$ then the pig has a time to die from the poison, that means that now there are two states available for the pig : ```alive``` or ```dead```.

One more step. If $minutesToTest / minutesToDie = 2$ then there are three available states for the pig : ```alive``` / ```dead after the first test``` / ```dead after the second test```.

> The number of available states for the pig is $states = minutesToTest / minutesToDie + 1$.

![image](https://leetcode.com/problems/poor-pigs/Figures/458/pigs.png)

__How many buckets could test ```x``` pigs with ```2``` available states__

One pig could test ```2``` buckets - let's make him drink from the bucket number ```1``` and then wait ```minutesToDie``` time. If he is ```alive``` - the poison is in the bucket number ```2```. If he is ```dead``` - the poison is in the bucket number ```1```.

![image](https://leetcode.com/problems/poor-pigs/Figures/458/pigs_bucket.png)

The same way two pigs could test $2^2 = 4$ buckets

![image](https://leetcode.com/problems/poor-pigs/Figures/458/2_pigs.png)

![image](https://leetcode.com/problems/poor-pigs/Figures/458/2_pigs_results.png)

![image](https://github.com/quananhle/Python/assets/35042430/9ae1bc3a-201d-4ca3-8db7-4d0456a83410)

![image](https://github.com/quananhle/Python/assets/35042430/bcbe1cdd-785e-468b-90c2-e724b1b7ef1c)

```Python
class Solution:
    def poorPigs(self, buckets: int, minutesToDie: int, minutesToTest: int) -> int:
        states = minutesToTest // minutesToDie + 1
        return math.ceil(math.log2(buckets) / math.log2(states))
```
