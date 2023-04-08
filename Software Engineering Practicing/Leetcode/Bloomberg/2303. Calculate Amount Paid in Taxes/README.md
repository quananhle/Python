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
