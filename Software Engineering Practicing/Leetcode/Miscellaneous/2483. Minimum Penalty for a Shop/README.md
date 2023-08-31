## [2483. Minimum Penalty for a Shop](https://leetcode.com/problems/minimum-penalty-for-a-shop/)

```Tag```: ```Array & String```

#### Difficulty: Medium

You are given the customer visit log of a shop represented by a __0-indexed__ string ```customers``` consisting only of characters ```'N'``` and ```'Y'```:

- if the $i^{th}$ character is ```'Y'```, it means that customers come at the $i^{th}$ hour
- whereas ```'N'``` indicates that no customers come at the $i^{th}$ hour.

If the shop closes at the $j^{th}$ hour $(0 \le j \le n)$, the penalty is calculated as follows:

- For every hour when the shop is open and no customers come, the penalty increases by ```1```.
- For every hour when the shop is closed and customers come, the penalty increases by ```1```.

Return _the __earliest__ hour at which the shop must be closed to incur a __minimum__ penalty_.

Note that if a shop closes at the $j^{th}$ hour, it means the shop is closed at the hour ```j```.

![image](https://github.com/quananhle/Python/assets/35042430/f69b914e-8613-4939-9874-c984c871eece)

---

__Example 1:__
```
Input: customers = "YYNY"
Output: 2
Explanation: 
- Closing the shop at the 0th hour incurs in 1+1+0+1 = 3 penalty.
- Closing the shop at the 1st hour incurs in 0+1+0+1 = 2 penalty.
- Closing the shop at the 2nd hour incurs in 0+0+0+1 = 1 penalty.
- Closing the shop at the 3rd hour incurs in 0+0+1+1 = 2 penalty.
- Closing the shop at the 4th hour incurs in 0+0+1+0 = 1 penalty.
Closing the shop at 2nd or 4th hour gives a minimum penalty. Since 2 is earlier, the optimal closing time is 2.
```

__Example 2:__
```
Input: customers = "NNNNN"
Output: 0
Explanation: It is best to close the shop at the 0th hour as no customers arrive.
```

__Example 3:__
```
Input: customers = "YYYY"
Output: 4
Explanation: It is best to close the shop at the 4th hour as customers arrive at each hour.
```

__Constraints:__

- $1 \le customers.length \le 10^5$
- ```customers``` consists only of characters ```'Y'``` and ```'N'```.

---

We can start by considering the brute force approach, attempting to close the stop at every possible hour.

![image](https://leetcode.com/problems/minimum-penalty-for-a-shop/Figures/2483/1.png)

The calculation of the penalty (closed after a certain number hours) is divided into two parts:

- During open hours, every ```'N'``` character contributes to ```1``` penalty.
- During closed hours, every ```'Y'``` character also contributes to ```1``` penalty.

We can calculate the total penalty by traversing ```customers```.

![image](https://leetcode.com/problems/minimum-penalty-for-a-shop/Figures/2483/2.png)

![image](https://leetcode.com/problems/minimum-penalty-for-a-shop/Figures/2483/3.png)

First calculate the total penalty if we close instantly (after hour ```0```). Hence, the penalty of closing the shop after $\mathcal{0}^{th}$ hour is based on the status of ```customers[0]```:

- If it is ```'Y'```, it means one penalty from the closed hours is removed, resulting in a decrease of the total penalty by ```1```.
- If it is ```'N'```, it means an additional penalty is added from the open hours, resulting in an increase of the total penalty by ```1```.

Each time we iterate over a new ```i```, we are finding the new penalty if we were to close after ```i``` instead of after ```i - 1```.

![image](https://github.com/quananhle/Python/assets/35042430/87289ed7-dedf-48a8-a01c-ea6d405efbbd)
- Closing the shop at the $\mathcal{0}^{th}$ hour incurs in 1+1+1+0+1+1+1+0+1+0+1+0 = 8 penalties.

![image](https://github.com/quananhle/Python/assets/35042430/a257a80d-eac8-4048-a1af-85b22b929ab8)
- Closing the shop at the $\mathcal{1}^{st}$ hour incurs in 0+1+1+0+1+1+1+0+1+0+1+0 = 7 penalties.

![image](https://github.com/quananhle/Python/assets/35042430/3d19e54c-464f-4bea-95a4-fe0a2fdf121c)
- Closing the shop at the $\mathcal{2}^{nd}$ hour incurs in 0+0+1+0+1+1+1+0+1+0+1+0 = 6 penalties.

![image](https://github.com/quananhle/Python/assets/35042430/ea85d62c-52b6-45f8-8148-06d5d8edfaee)
- Closing the shop at the $\mathcal{3}^{rd}$ hour incurs in 0+0+0+0+1+1+1+0+1+0+1+0 = 5 penalties.

![image](https://github.com/quananhle/Python/assets/35042430/5fb4743c-a607-4409-8aa1-ab5bff6f13e5)
- Closing the shop at the $\mathcal{4}^{th}$ hour incurs in 0+0+0+1+1+1+1+0+1+0+1+0 = 6 penalties.

![image](https://github.com/quananhle/Python/assets/35042430/ac12e2c8-6100-41c7-93fe-7253804230bc)
- Closing the shop at the $\mathcal{5}^{th}$ hour incurs in 0+0+0+1+0+1+1+0+1+0+1+0 = 5 penalties.

![image](https://github.com/quananhle/Python/assets/35042430/6bc07f55-2d9b-49bf-9fbd-1bfd76f6c17e)
- Closing the shop at the $\mathcal{6}^{th}$ hour incurs in 0+0+0+1+0+0+1+0+1+0+1+0 = 4 penalties.

![image](https://github.com/quananhle/Python/assets/35042430/1c672f61-1dc4-4fb3-bb86-8373b828f47f)
- Closing the shop at the $\mathcal{7}^{th}$ hour incurs in 0+0+0+1+0+0+0+0+1+0+1+0 = 3 penalties.

![image](https://github.com/quananhle/Python/assets/35042430/a5499361-4eba-44c9-acd4-90175e359f58)
- Closing the shop at the $\mathcal{8}^{th}$ hour incurs in 0+0+0+1+0+0+0+1+1+0+1+0 = 4 penalties.

so on and so forth to the end. The minimum penalty is 3 which happens during $\mathcal{7}^{th}$, $\mathcal{9}^{th}$, and $\mathcal{11}^{th}$ hour. Hence, the earliest hour at which the shop must be closed to incur a minimum penalty is $\mathcal{7}^{th}$.

### Counter

```Python
class Solution:
    def bestClosingTime(self, customers: str) -> int:
        # Minimize 'Y' and maximize 'N'
        counter = collections.Counter(customers)
        ans = 0
        curr_penalty = min_penalty = counter.get('Y', 0)

        for h, c in enumerate(customers):
            if c == 'Y':
                curr_penalty -= 1
            else:
                curr_penalty += 1

            if curr_penalty < min_penalty:
                ans = h + 1
                min_penalty = curr_penalty

        return ans
```

### One Pass

![image](https://leetcode.com/problems/minimum-penalty-for-a-shop/Figures/2483/4.png)

```Python
class Solution:
    def bestClosingTime(self, customers: str) -> int:
        # Minimize 'Y' and maximize 'N'
        counter = collections.Counter(customers)
        ans = 0
        curr_penalty = min_penalty = 0

        for h, c in enumerate(customers):
            if c == 'Y':
                curr_penalty -= 1
            else:
                curr_penalty += 1

            if curr_penalty < min_penalty:
                ans = h + 1
                min_penalty = curr_penalty

        return ans
```
