## 1088. Confusing Number II

```Tag```: ```Backtracking```

#### Difficulty: Hard

A __confusing number__ is a number that when rotated ```180``` degrees becomes a different number with __each digit__ valid.

We can rotate digits of a number by ```180``` degrees to form new digits.

- When ```0```, ```1```, ```6```, ```8```, and ```9``` are rotated ```180``` degrees, they become ```0```, ```1```, ```9```, ```8```, and ```6``` respectively.
- When ```2```, ```3```, ```4```, ```5```, and ```7``` are rotated ```180``` degrees, they become __invalid__.

Note that after rotating a number, we can ignore leading zeros.

- For example, after rotating ```8000```, we have ```0008``` which is considered as just ```8```.

Given an integer ```n```, return _the number of __confusing numbers__ in the inclusive range ```[1, n]```_.

![image](https://user-images.githubusercontent.com/35042430/214094976-1c9d6412-247a-4e8a-8abb-8c087ed4868e.png)

---
