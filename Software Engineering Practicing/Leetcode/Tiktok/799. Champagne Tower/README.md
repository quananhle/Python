## [799. Champagne Tower](https://leetcode.com/problems/champagne-tower)

```Tag```:

#### Difficulty: Medium

We stack glasses in a pyramid, where the __first__ row has ```1``` glass, the second row has ```2``` glasses, and so on until the $100^{th}$ row.  Each glass holds one cup of champagne.

Then, some champagne is poured into the first glass at the top.  When the topmost glass is full, any excess liquid poured will fall equally to the glass immediately to the left and right of it.  When those glasses become full, any excess champagne will fall equally to the left and right of those glasses, and so on.  (A glass at the bottom row has its excess champagne fall on the floor.)

For example, after one cup of champagne is poured, the top most glass is full.  After two cups of champagne are poured, the two glasses on the second row are half full.  After three cups of champagne are poured, those two cups become full - there are 3 full glasses total now.  After four cups of champagne are poured, the third row has the middle glass half full, and the two outside glasses are a quarter full, as pictured below.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/03/09/tower.png)

Now after pouring some non-negative integer cups of champagne, return _how full the j<sup>th</sup> glass in the i<sup>th</sup> row is (both ```i``` and ```j``` are 0-indexed.)_

![image](https://github.com/quananhle/Python/assets/35042430/2cb37a28-dee4-4566-bc1e-d515dbf1682c)

---

__Example 1:__
```
Input: poured = 1, query_row = 1, query_glass = 1
Output: 0.00000
Explanation: We poured 1 cup of champange to the top glass of the tower (which is indexed as (0, 0)). There will be no excess liquid so all the glasses under the top glass will remain empty.
```

__Example 2:__
```
Input: poured = 2, query_row = 1, query_glass = 1
Output: 0.50000
Explanation: We poured 2 cups of champange to the top glass of the tower (which is indexed as (0, 0)). There is one cup of excess liquid. The glass indexed as (1, 0) and the glass indexed as (1, 1) will share the excess liquid equally, and each will get half cup of champange.
```

__Example 3:__
```
Input: poured = 100000009, query_row = 33, query_glass = 17
Output: 1.00000
```

__Constraints:__

- $0 \le poured \le 10^{9}$
- $0 \le query{\textunderscore}glass \le query_row \lt 100$

---
