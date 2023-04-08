## [2303. Calculate Amount Paid in Taxes](https://leetcode.com/problems/calculate-amount-paid-in-taxes/)

```Tag```:

#### Difficulty: Easy

You are given a __0-indexed__ 2D integer array brackets where ```brackets[i]``` = [upper<sub>i</sub>, percent<sub>i</sub>] means that the ```i```<sup>th</sup> tax bracket has an upper bound of ```upper```<sub>i</sub> and is taxed at a rate of ```percent```<sub>i</sub>. The brackets are sorted by upper bound (i.e. ```upper```<sub>i</sub>-1 < ```upper```<sub>i</sub> for ```0 < i < brackets.length```).

Tax is calculated as follows:

- The first ```upper```<sub>0</sub> dollars earned are taxed at a rate of ```percent```<sub>0</sub>.
- The next ```upper```<sub>1</sub> - ```upper```<sub>0</sub> dollars earned are taxed at a rate of ```percent```<sub>1</sub>.
- The next ```upper```<sub>2</sub> - ```upper```<sub>1</sub> dollars earned are taxed at a rate of ```percent```<sub>2</sub>.
- And so on.

You are given an integer ```income``` representing the amount of money you earned. Return _the amount of money that you have to pay in taxes_. Answers within 10<sup>-5</sup> of the actual answer will be accepted.

![image](https://user-images.githubusercontent.com/35042430/230703218-6ff8ed0c-66d0-4ade-9032-5b5492424cb6.png)

---

__Example 1:__
```
Input: brackets = [[3,50],[7,10],[12,25]], income = 10
Output: 2.65000
Explanation:
Based on your income, you have 3 dollars in the 1st tax bracket, 4 dollars in the 2nd tax bracket, and 3 dollars in the 3rd tax bracket.
The tax rate for the three tax brackets is 50%, 10%, and 25%, respectively.
In total, you pay $3 * 50% + $4 * 10% + $3 * 25% = $2.65 in taxes.
```

__Example 2:__
```
Input: brackets = [[1,0],[4,25],[5,50]], income = 2
Output: 0.25000
Explanation:
Based on your income, you have 1 dollar in the 1st tax bracket and 1 dollar in the 2nd tax bracket.
The tax rate for the two tax brackets is 0% and 25%, respectively.
In total, you pay $1 * 0% + $1 * 25% = $0.25 in taxes.
```

__Example 3:__
```
Input: brackets = [[2,50]], income = 0
Output: 0.00000
Explanation:
You have no income to tax, so you have to pay a total of $0 in taxes.
```

__Constraints:__

- ```1 <= brackets.length <= 100```
- 1 <= upper<sub>i</sub> <= 1000
- ```0 <= percent<sub>i</sub> <= 100
- ```0 <= income <= 1000```
- ```upper```<sub>i</sub> is sorted in ascending order.
- All the values of ```upper```<sub>i</sub> are unique.
- The upper bound of the last tax bracket is greater than or equal to ```income```.

---
