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

![image](https://leetcode.com/problems/successful-pairs-of-spells-and-potions/Figures/2300/Slide1.PNG)

### Brute Force

- __Time Complexity__: ```O(N^2)```
- __Space Complexity__: ```O(N)```

```Python
class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        res = list()
        
        for spell in spells:
            res.append(len([(spell * potion) for potion in potions if (spell * potion) >= success]))

        return res
```

### Sorting & Two Pointers

__Algorithm__

1. Create an array of pairs ```sorted_spells``` with the first element of each pair being a original index in the ```spells``` array and the second element being its spell strength.
2. Sort the ```sorted_spells``` and the ```potions``` arrays in ascending order.
3. Initialize variables:
    - ```res```, an array of size ```spells.size()``` to store the result.
    - ```m```, length of the ```potions``` array.
    - ```i```, an integer initialized to ```m - 1``` to keep track of the index of the current potion in the ```potions``` array.
4. For each ```spell``` and its original ```index``` in the ```sorted_spells`` array:
    - While we have not run out of potions and the product of the current ```spell``` strength and the strength of the potion at the ```i``` is greater than or equal to ```success```, decrement ```i``` by ```1```. We stop at ```min_potion``` for the current ```spell```.
    - Calculate the number of successful pairs possible for the current ```spell``` as ```m - i - 1``` and store the result at the ```index``` position in the ```res``` array.
Return the answer array which contains the number of successful pairs for each spell.

![image](https://leetcode.com/problems/successful-pairs-of-spells-and-potions/Figures/2300/Slide3.PNG)

![image](https://leetcode.com/problems/successful-pairs-of-spells-and-potions/Figures/2300/Slide4.PNG)

- __Time Complexity__: ```O(nlogn + mlogm)```
- __Space Complexity__: ```O(n + logm)``` or ```O(n + m)```

```Python
class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        n, m = len(spells), len(potions)
        sorted_spells = [(index, spell) for index, spell in enumerate(spells)]
        
        sorted_spells.sort(key=lambda x:x[1])
        potions.sort(reverse=True)

        res = [0] * n
        
        i = 0
        for index, spell in sorted_spells:
            while i < m and spell * potions[i] >= success:
                i += 1
            res[index] = i
        
        return res
```

```Python
class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        n, m = len(spells), len(potions)
        sorted_spells = [(index, spell) for index, spell in enumerate(spells)]
        
        sorted_spells.sort(key=lambda x:x[1])
        potions.sort()

        res = [0] * n
        
        i = m - 1
        for index, spell in sorted_spells:
            while i >= 0 and spell * potions[i] >= success:
                i -= 1
            res[index] = m - i - 1
        
        return res
```

### Sorting & Binary Search

![image](https://leetcode.com/problems/successful-pairs-of-spells-and-potions/Figures/2300/Slide2.PNG)

- __Time Complexity__: ```O((m + n) * log⁡m)```
- __Space Complexity__: ```O(logm)``` or ```O(m)```

#### Template 1

```Python
```Python
class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        potions.sort()
        n, m = len(spells), len(potions)
        res = list()

        for spell in spells:
            lo, hi = 0, m - 1
            while lo <= hi:
                mi = lo + (hi - lo) // 2
                if potions[mi] * spell < success:
                    lo = mi + 1
                else:
                    hi = mi - 1
            res.append(m - lo)
        return res
```
```

#### Template 2

```Python
class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        n = len(potions)
        potions.sort()

        def bisect_left(spell):
            lo, hi = 0, n

            while lo < hi:
                mi = lo + (hi - lo) // 2
                if potions[mi] * spell < success: 
                    lo = mi + 1
                else: 
                    hi = mi

            return lo
        
        for i, spell in enumerate(spells):
            spells[i] = n - bisect_left(spell)

        return spells
```

```Python
class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        potions.sort()
        n, m = len(spells), len(potions)
        res = list()
        max_potion = potions[m - 1]

        for spell in spells:
            min_potion = (success + spell - 1) // spell

            if min_potion > max_potion:
                res.append(0)
                continue
            
            lo = bisect.bisect_left(potions, min_potion)
            res.append(m - lo)
        
        return res
```

```Python
class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        potions.sort()
        return [len(potions) - bisect_right(potions, (success - 1) // x) for x in spells]
```

```Python
class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        potions.sort()
        return (len(potions) - bisect_left(potions, success, key=lambda p: p * s) for s in spells)
```
