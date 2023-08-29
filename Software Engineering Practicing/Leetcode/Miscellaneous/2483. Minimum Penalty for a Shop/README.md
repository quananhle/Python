## [2483. Minimum Penalty for a Shop](https://leetcode.com/problems/minimum-penalty-for-a-shop/)

```Tag```:

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
