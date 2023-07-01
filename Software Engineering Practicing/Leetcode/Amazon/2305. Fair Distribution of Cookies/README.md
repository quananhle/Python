## [2305. Fair Distribution of Cookies](https://leetcode.com/problems/fair-distribution-of-cookies/)

```Tag```: ```Backtracking```

#### Difficulty: Medium

You are given an integer array ```cookies```, where ```cookies[i]``` denotes the number of cookies in the i<sup>th</sup> bag. You are also given an integer ```k``` that denotes the number of children to distribute all the bags of cookies to. All the cookies in the same bag must go to the same child and cannot be split up.

The unfairness of a distribution is defined as the maximum total cookies obtained by a single child in the distribution.

Return _the minimum unfairness of all distributions_.

![image](https://github.com/quananhle/Python/assets/35042430/9187daf4-1917-4d4b-82bd-82066f63a1d0)

---

__Example 1:__
```
Input: cookies = [8,15,10,20,8], k = 2
Output: 31
Explanation: One optimal distribution is [8,15,8] and [10,20]
- The 1st child receives [8,15,8] which has a total of 8 + 15 + 8 = 31 cookies.
- The 2nd child receives [10,20] which has a total of 10 + 20 = 30 cookies.
The unfairness of the distribution is max(31,30) = 31.
It can be shown that there is no distribution with an unfairness less than 31.
```

__Example 2:__
```
Input: cookies = [6,1,3,2,2,4,1,2], k = 3
Output: 7
Explanation: One optimal distribution is [6,1], [3,2,2], and [4,1,2]
- The 1st child receives [6,1] which has a total of 6 + 1 = 7 cookies.
- The 2nd child receives [3,2,2] which has a total of 3 + 2 + 2 = 7 cookies.
- The 3rd child receives [4,1,2] which has a total of 4 + 1 + 2 = 7 cookies.
The unfairness of the distribution is max(7,7,7) = 7.
It can be shown that there is no distribution with an unfairness less than 7.
```

__Constraints:__

- ```2 <= cookies.length <= 8```
- ```1 <= cookies[i] <= 10^5```
- ```2 <= k <= cookies.length```

---

### Backtracking

Let’s take a look at a scenario with 3 cookies and 3 children that serves as a great example of this.

Initially, we move along the path in yellow by distributing all 3 cookies to child 0, but it is not a valid distribution as child 1 and child 2 receive no cookies.

![image](https://leetcode.com/problems/fair-distribution-of-cookies/Figures/2305/3.png)

As a result, we backtrack to the next possible distribution (by distributing the last cookie to child 1) and repeat this process.

![image](https://leetcode.com/problems/fair-distribution-of-cookies/Figures/2305/4.png)

To optimize the backtracking approach, we can use an early stop technique. Consider the same example in the image below: suppose that we have already distributed the first 2 cookies to child 0. When we come to the last cookie, should we continue the recursion process by distributing it to any child?

The answer is NO, because child 1 and child 2 require at least two cookies, and at this point, we only have one cookie remaining. Consequently, no matter how we distribute this last cookie, it will inevitably lead to an invalid distribution. Therefore, we can discard this path and not proceed further with it.

![image](https://leetcode.com/problems/fair-distribution-of-cookies/Figures/2305/5.png)

To implement the early stop technique, we will introduce a parameter named ```zero_count``` that represents the number of children without a cookie. During the backtracking process, if we have fewer undistributed cookies than zero_count, it means that some children will always end up with no cookie. At this point, we can terminate the recursion because it becomes impossible to obtain a valid distribution. The image below illustrates this concept, where the red states are not computed thanks to the early stop, significantly reducing unnecessary recursion steps.

![image](https://leetcode.com/problems/fair-distribution-of-cookies/Figures/2305/6.png)

Therefore, the algorithm only tracks the paths that lead to valid distributions and updates the global minimum by the maximum unfairness of each valid distribution.
