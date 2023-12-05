## [528. Random Pick with Weight](https://leetcode.com/problems/random-pick-with-weight)

```Tag```: ```Design```

#### Difficulty: Medium

You are given a __0-indexed__ array of positive integers ```w``` where ```w[i]``` describes the weight of the $i^{th}$ index.

You need to implement the function ```pickIndex()```, which randomly picks an index in the range ```[0, w.length - 1]``` (__inclusive__) and returns it. The __probability__ of picking an index ```i``` is ```w[i] / sum(w)```.

- For example, if ```w = [1, 3]```, the probability of picking index ```0``` is ```1 / (1 + 3) = 0.25``` (i.e., ```25%```), and the probability of picking index ```1``` is ```3 / (1 + 3) = 0.75``` (i.e., ```75%```).

![image](https://github.com/quananhle/Python/assets/35042430/c712da7d-2d11-4750-95e7-7bf3bb2d4c7c)

---

__Example 1:__
```
Input
["Solution","pickIndex"]
[[[1]],[]]
Output
[null,0]

Explanation
Solution solution = new Solution([1]);
solution.pickIndex(); // return 0. The only option is to return 0 since there is only one element in w.
```

__Example 2:__
```
Input
["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]
[[[1,3]],[],[],[],[],[]]
Output
[null,1,1,1,1,0]

Explanation
Solution solution = new Solution([1, 3]);
solution.pickIndex(); // return 1. It is returning the second element (index = 1) that has a probability of 3/4.
solution.pickIndex(); // return 1
solution.pickIndex(); // return 1
solution.pickIndex(); // return 1
solution.pickIndex(); // return 0. It is returning the first element (index = 0) that has a probability of 1/4.

Since this is a randomization problem, multiple answers are allowed.
All of the following outputs can be considered correct:
[null,1,1,1,1,0]
[null,1,1,1,1,1]
[null,1,1,1,0,0]
[null,1,1,1,0,1]
[null,1,0,1,0,0]
......
and so on.
```

__Constraints:__

- $1 \le w.length \le 10^4$
- $1 \le w[i] \le 10^5$
- ```pickIndex``` will be called at most $10^4$ times.

---

### List (Memory Limit Exceeded)

```Python
class Solution:

    def __init__(self, w: List[int]):
        # Memory Limit Exceeded
        self.bucket = list()
        total = sum(w)
        for i, weight in enumerate(w:
            weight = weight / total
            self.bucket.extend([i] * int(weight * total))

    def pickIndex(self) -> int:
        return random.choice(self.bucket)

# Your Solution object will be instantiated and called as such:
# obj = Solution(w)
# param_1 = obj.pickIndex()
```

### Prefix Sums

#### Linear Search

```Python
class Solution:

    def __init__(self, w: List[int]):
        self.bucket = list()
        prefix_sum = 0
        for weight in w:
            prefix_sum += weight
            self.bucket.append(prefix_sum)
        self.total = prefix_sum

    def pickIndex(self) -> int:
        # In most of the programming languages, we have some random() function that generates a random value between 0 and 1.
        target = self.total * random.random()

        for i, prefix_sum in enumerate(self.bucket):
            if target < prefix_sum:
                return i

# Your Solution object will be instantiated and called as such:
# obj = Solution(w)
# param_1 = obj.pickIndex()
```

#### Binary Search

```Python
class Solution:

    def __init__(self, w: List[int]):
        self.bucket = list()
        prefix_sum = 0
        for weight in w:
            prefix_sum += weight
            self.bucket.append(prefix_sum)
        self.total = prefix_sum

    def pickIndex(self) -> int:
        # In most of the programming languages, we have some random() function that generates a random value between 0 and 1.
        target = self.total * random.random()
        lo, hi = 0, len(self.bucket)
        while lo < hi:
            mi = lo + (hi - lo) // 2
            if self.bucket[mi] < target:
                lo = mi + 1
            else:
                hi = mi
        return lo

# Your Solution object will be instantiated and called as such:
# obj = Solution(w)
# param_1 = obj.pickIndex()
```

```Python
class Solution:

    def __init__(self, w: List[int]):
        self.bucket = list()
        prefix_sum = 0
        for weight in w:
            prefix_sum += weight
            self.bucket.append(prefix_sum)
        self.total = prefix_sum

    def pickIndex(self) -> int:
        # In most of the programming languages, we have some random() function that generates a random value between 0 and 1.
        target = self.total * random.random()
        return bisect.bisect_left(self.bucket, target)

# Your Solution object will be instantiated and called as such:
# obj = Solution(w)
# param_1 = obj.pickIndex()
```