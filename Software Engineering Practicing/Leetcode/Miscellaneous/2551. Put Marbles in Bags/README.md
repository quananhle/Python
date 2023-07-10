## [2551. Put Marbles in Bags](https://leetcode.com/problems/put-marbles-in-bags)

```Tag```: ```Greedy Algorithm```

#### Difficulty: Hard

You have ```k``` bags. You are given a __0-indexed__ integer array weights where ```weights[i]``` is the weight of the $i^{th}$ marble. You are also given the integer ```k```.

Divide the marbles into the ```k``` bags according to the following rules:

- No bag is empty.
- If the $i^{th}$ marble and $j^{th}$ marble are in a bag, then all marbles with an index between the $i^{th}$ and $j^{th}$ indices should also be in that same bag.
- If a bag consists of all the marbles with an index from ```i``` to ```j``` inclusively, then the cost of the bag is ```weights[i] + weights[j]```.

The score after distributing the marbles is the sum of the costs of all the ```k``` bags.

Return _the difference between the maximum and minimum scores among marble distributions_.

---

__Example 1:__
```
Input: weights = [1,3,5,1], k = 2
Output: 4
Explanation: 
The distribution [1],[3,5,1] results in the minimal score of (1+1) + (3+1) = 6. 
The distribution [1,3],[5,1], results in the maximal score of (1+3) + (5+1) = 10. 
Thus, we return their difference 10 - 6 = 4.
```

__Example 2:__
```
Input: weights = [1, 3], k = 2
Output: 0
Explanation: The only distribution possible is [1],[3]. 
Since both the maximal and minimal score are the same, we return 0.
```

__Constraints:__

- $1 <= k <= weights.length <= 10^{5}$
- $1 <= weights[i] <= 10^{9}$

---

![image](https://leetcode.com/problems/put-marbles-in-bags/Figures/2551/1.png)

### Greedy Algorithm

![image](https://leetcode.com/problems/put-marbles-in-bags/Figures/2551/2.png)

![image](https://leetcode.com/problems/put-marbles-in-bags/Figures/2551/3.png)

![image](https://leetcode.com/problems/put-marbles-in-bags/Figures/2551/4.png)

![image](https://github.com/quananhle/Python/assets/35042430/7b8ec3c7-cd13-4b4a-9f4a-ee59dff2d8a1)

__Algorithm__

1. Collect the value of every ```pair``` from ```weights``` in the array ```pair_weights``.
2. Sort ```pair_weights```.
3. Get the sum of the ```k - 1``` largest pairs, and the sum of the ```k - 1``` smallest pairs.
4. Return ```an``` as the difference of the two sums in step 3.

__Complexity Analysis__

- Time Complexity : $\mathcal{O}(N \cdot logN)$
- Space Complexity : $\mathcal{O}(N)$

```Python
class Solution:
    def putMarbles(self, weights: List[int], k: int) -> int:
        n = len(weights)
        pair_weights = [0] * (n - 1)

        for i in range(n - 1):
            pair_weights[i] = weights[i] + weights[i + 1]
        pair_weights.sort()

        ans = 0
        for i in range(k - 1):
            ans += pair_weights[n - 2 -i] - pair_weights[i]
        
        return ans
```
