## [2149. Rearrange Array Elements by Sign](https://leetcode.com/problems/rearrange-array-elements-by-sign)

```Tag```: ```Array & String``` ```Two Pointers```

#### Difficulty: Medium

You are given a __0-indexed__ integer array ```nums``` of even length consisting of an equal number of positive and negative integers.

You should rearrange the elements of ```nums``` such that the modified array follows the given conditions:

- Every __consecutive pair__ of integers have __opposite__ signs.
- For all integers with the same sign, the order in which they were present in ```nums``` is preserved.
- The rearranged array begins with a positive integer.

Return _the modified array after rearranging the elements to satisfy the aforementioned conditions_.

![image](https://github.com/quananhle/Python/assets/35042430/693cef1d-d1df-4b94-9eb6-331bb2c9eb9f)

---

__Example 1:__
```
Input: nums = [3,1,-2,-5,2,-4]
Output: [3,-2,1,-5,2,-4]
Explanation:
The positive integers in nums are [3,1,2]. The negative integers are [-2,-5,-4].
The only possible way to rearrange them such that they satisfy all conditions is [3,-2,1,-5,2,-4].
Other ways such as [1,-2,2,-5,3,-4], [3,1,2,-2,-5,-4], [-2,3,-5,1,-4,2] are incorrect because they do not satisfy one or more conditions.
```

__Example 2:__
```
Input: nums = [-1,1]
Output: [1,-1]
Explanation:
1 is the only positive integer and -1 the only negative integer in nums.
So nums is rearranged to [1,-1].
```

__Constraints:__

- $2 \le nums.length \le 2 * 10^5$
- ```nums.length``` is even
- $1 \le |nums[i]| \le 10^5$
- ```nums``` consists of equal number of positive and negative integers.

---

### Sweep Line Algorithm

![image](https://leetcode.com/problems/remove-interval/Figures/1272/sweep2.png)

__Algorithm__

- Current interval has no overlaps with ```toBeRemoved``` one. That means there is nothing to take care of, just update the output.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/no_overlaps.png)

- The second situation is when ```toBeRemoved``` interval is inside of the current interval. Then one has to add two non-overlapping parts of the current interval in the output.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/inside2.png)

- "Left" overlap.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/left_overlap.png)

- "Right" overlap.

![image](https://leetcode.com/problems/remove-interval/Figures/1272/right_overlap.png)
