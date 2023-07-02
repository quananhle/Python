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

__Algorithm__

1. Create an array ```children``` of length ```k``` initialized with all zeros, which represents the unfairness of each child.
2. Define the recursive function ```dfs(curr, remaining_children)``` to distribute the i<sup>th</sup> cookie:
    - If the number of undistributed cookies is less than ```remaining_children```, which is ```n - curr < remaining_children```, return a large integer like ```float('inf')```, implying that the current distribution is invalid.
    - If ```curr = n```, return the maximum value of ```children``` which is the unfairness of this distribution.
    - Otherwise, set ```ans``` as ```float('inf')``` and continue with step 3.
3. Iterate through ```children``` and for each child ```i```:
    - Increment ```children[i]``` by ```cookie[curr]```, if ```children[curr]``` is ```0``` before the distribution, decrement ```remaining_children``` by ```1```.
    - Recursively call ```dfs(curr + 1, remaining_children)``` and update ```ans``` as the minimum unfairness encountered, ```ans = min(ans, dfs(curr + 1, remaining_children))```.
    - Decrement ```children[i]``` by ```cookie[curr]```, if ```children[curr]``` is ```0``` after the process, increment ```remaining_children``` by ```1```. (This is the backtrack step)
    - Return ```ans``` after the iteration is complete.
5. Return ```dfs(0, k)```.

![image](https://github.com/quananhle/Python/assets/35042430/262014d2-e358-416e-8a71-2051e1f99f2d)

```Python
class Solution:
    def distributeCookies(self, cookies: List[int], k: int) -> int:
        n = len(cookies)
        children = [0] * k

        def dfs(curr, remaining_children):
            # Base cases: if not enough cookies remaining, return "float('inf')" for it's an unfair distribution, break out early
            if n - curr < remaining_children:
                return float('inf')
            
            if curr == n:
                return max(children)

            # Distribute i-th cookie to each child and update answer
            ans = float('inf')
            for i in range(k):
                remaining_children -= int(children[i] == 0)
                children[i] += cookies[curr]
                
                # Move on to the next child, and compare with the current result 
                ans = min(ans, dfs(curr + 1, remaining_children))

                # Backtracking
                children[i] -= cookies[curr]
                remaining_children += int(children[i] == 0)
            
            return ans
        
        return dfs(0, k)
```

```Python
class Solution:
    def distributeCookies(self, cookies: List[int], k: int) -> int:
        n = len(cookies)
        children = [0] * k

        def dfs(curr, remaining):
            # Base cases:
            # Not enough cookies for remaining children
            if n - curr < remaining:
                return float('inf')
            # Correct path, all children had their cookies
            if curr == n:
                return max(children)
            
            ans = float('inf')
            for i in range(k):
               # Decrement the remaining children
               if children[i] == 0:
                   remaining -= 1
               # Distribute cookies
               children[i] += cookies[curr]

               ans = min(ans, dfs(curr + 1, remaining))

                # Backtracking
               children[i] -= cookies[curr]
               # Increment the remaining children
               if children[i] == 0:
                   remaining += 1
            
            return ans

        return dfs(0, k)
```
