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
class Solution:
    def sortByBits(self, arr: List[int]) -> List[int]:
        nums = [(num, bin(num).count('1')) for num in arr]
        nums.sort(key=lambda x: (x[1], x[0]))
        return [num[0] for num in nums]
```

```Python
class Solution:
    def sortByBits(self, arr: List[int]) -> List[int]:
        arr.sort(key=lambda x: (bin(x).count('1'), x))
        return arr
```

#### Bitwise Manipulation

![image](https://github.com/quananhle/Python/assets/35042430/c7a29b77-c19a-4ee5-a7ee-1805df44473e)

![image](https://github.com/quananhle/Python/assets/35042430/81e17656-0340-447e-81f4-32fd82ff16f6)

![image](https://github.com/quananhle/Python/assets/35042430/f2758175-fdd1-4230-b2ad-2201dc205af5)

![image](https://github.com/quananhle/Python/assets/35042430/a61116f9-b5a2-4213-a4f2-c7149db8c170)

![image](https://github.com/quananhle/Python/assets/35042430/02be9a06-dcc9-457b-9f27-02baf3d859ba)

![image](https://github.com/quananhle/Python/assets/35042430/f3bbff01-8675-4c0f-b727-6515b29e6294)

```Python
class Solution:
    def sortByBits(self, arr: List[int]) -> List[int]:
        def count_bit(num):
            mask = 1
            weight = 0

            # While num > 0
            while num:
                # Check if num & mask is non-zero
                if num & mask:
                    # Increment weight
                    weight += 1
                    # XOR num with mask to offset the least significant 1 to 0 in num
                    num ^= mask
                # Left shift mask by 1 bit
                mask <<= 1
            
            return weight

        arr.sort(key=lambda x: (count_bit(x), x))
        return arr
```

#### Brian Kerninghan's Algorithm

![image](https://leetcode.com/problems/sort-integers-by-the-number-of-1-bits/Figures/1356/7.png)

```Python
class Solution:
    def sortByBits(self, arr: List[int]) -> List[int]:
        def count_bit(num):
            weight = 0
            while num:
                weight += 1
                # Offset least significan bit
                num &= num - 1
            return weight
        
        arr.sort(key=lambda x: (count_bit(x), x))
        return arr
```

