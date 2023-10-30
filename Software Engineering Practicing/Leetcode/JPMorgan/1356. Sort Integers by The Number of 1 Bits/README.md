## [1356. Sort Integers by The Number of 1 Bits](https://leetcode.com/problems/sort-integers-by-the-number-of-1-bits)

```Tag```: ```Sorting``` ```Bitwise Manipulation``` ```Brian Kerninghan's Algorithm```

#### Difficulty: Easy

You are given an integer array ```arr```. Sort the integers in the array in ascending order by the number of ```1```'s in their binary representation and in case of two or more integers have the same number of ```1```'s you have to sort them in ascending order.

Return _the array after sorting it_.

![image](https://github.com/quananhle/Python/assets/35042430/3e168fbb-5e70-42c6-89c8-f6d539c719cd)

---

__Example 1:__
```
Input: arr = [0,1,2,3,4,5,6,7,8]
Output: [0,1,2,4,8,3,5,6,7]
Explantion: [0] is the only integer with 0 bits.
[1,2,4,8] all have 1 bit.
[3,5,6] have 2 bits.
[7] has 3 bits.
The sorted array by bits is [0,1,2,4,8,3,5,6,7]
```

__Example 2:__
```
Input: arr = [1024,512,256,128,64,32,16,8,4,2,1]
Output: [1,2,4,8,16,32,64,128,256,512,1024]
Explantion: All integers have 1 bit in the binary representation, you should just sort them in ascending order.
```

__Constraints:__

- $1 \le arr.length \le 500$
- $0 \le arr[i] \le 10^4$

---

### Sorting

#### Built-in ```bit_count()```

```Python
class Solution:
    def sortByBits(self, arr: List[int]) -> List[int]:
        return sorted(arr, key=lambda x: (x.bit_count(), x))
```

#### Built-in ```count()```

```Python

```

#### Bitwise Manipulation

```Python

```

#### Brian Kerninghan's Algorithm

```Python

```

