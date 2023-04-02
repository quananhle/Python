## [2300. Successful Pairs of Spells and Potions](https://leetcode.com/problems/successful-pairs-of-spells-and-potions/)

```Tag```: ```Binary Search``` ```Sorting``` ```Two Pointers```

#### Difficulty: Medium

You are given two positive integer arrays ```spells``` and ```potions```, of length ```n``` and ```m``` respectively, where ```spells[i]``` represents the strength of the i<sup>th</sup> spell and ```potions[j]``` represents the strength of the j<sup>th</sup> potion.

You are also given an integer ```success```. A ```spell``` and ```potion``` pair is considered successful if the product of their strengths is __at least__ ```success```.

Return _an integer array ```pairs``` of length ```n``` where ```pairs[i]``` is the number of potions that will form a successful pair with the i<sup>th</sup> spell_.

![image](https://user-images.githubusercontent.com/35042430/229330289-8210caac-d551-4241-9b4f-96e404a6f24f.png)

---

__Example 1:__
```
Input: spells = [5,1,3], potions = [1,2,3,4,5], success = 7
Output: [4,0,3]
Explanation:
- 0th spell: 5 * [1,2,3,4,5] = [5,10,15,20,25]. 4 pairs are successful.
- 1st spell: 1 * [1,2,3,4,5] = [1,2,3,4,5]. 0 pairs are successful.
- 2nd spell: 3 * [1,2,3,4,5] = [3,6,9,12,15]. 3 pairs are successful.
Thus, [4,0,3] is returned.
```

__Example 2:__
```
Input: spells = [3,1,2], potions = [8,5,8], success = 16
Output: [2,0,2]
Explanation:
- 0th spell: 3 * [8,5,8] = [24,15,24]. 2 pairs are successful.
- 1st spell: 1 * [8,5,8] = [8,5,8]. 0 pairs are successful. 
- 2nd spell: 2 * [8,5,8] = [16,10,16]. 2 pairs are successful. 
Thus, [2,0,2] is returned.
```

__Constraints:__

- ```n == spells.length```
- ```m == potions.length```
- 1 <= ```n, m``` <= 10<sup>5</sup>
- 1 <= ```spells[i]```, ```potions[i]``` <= 10<sup>5</sup>
- 1 <= ```success``` <= 10<sup>10</sup>

---

### Brute Force

```Python

```

### Sorting & Two Pointers

### Sorting & Binary Search
