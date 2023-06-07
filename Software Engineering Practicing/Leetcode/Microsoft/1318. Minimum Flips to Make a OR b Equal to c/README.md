## [1318. Minimum Flips to Make a OR b Equal to c](https://leetcode.com/problems/minimum-flips-to-make-a-or-b-equal-to-c/)

```Tag```: ```Bitwise```

#### Difficulty: Medium

Given 3 positives numbers ```a```, ```b``` and ```c```. Return _the minimum flips required in some bits of ```a``` and ```b``` to make ( ```a``` OR ```b == c``` ). (bitwise OR operation)_.
Flip operation consists of change any single bit 1 to 0 or change the bit 0 to 1 in their binary representation.

![image](https://github.com/quananhle/Python/assets/35042430/c1857a6e-2eee-4a52-8d6d-e9400c9a1658)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/01/06/sample_3_1676.png)
```
Input: a = 2, b = 6, c = 5
Output: 3
Explanation: After flips a = 1 , b = 4 , c = 5 such that (a OR b == c)
```

__Example 2:__
```
Input: a = 4, b = 2, c = 7
Output: 1
```

__Example 3:__
```
Input: a = 1, b = 2, c = 3
Output: 0
```

__Constraints:__

- ```1 <= a <= 10^9```
- ```1 <= b <= 10^9```
- ```1 <= c <= 10^9```

---

Bit manipulation is the act of manipulating bits, like changing bits of an integer.
At the heart of bit manipulation are the bit-wise operators:

NOT (~): Bitwise NOT is a unary operator that flips the bits of the number i.e., if the current bit is 000, it will change it to 111 and vice versa.

N = 5 = 101 (in binary)
~N = ~(101) = 010 = 2 (in decimal)
AND (&): In bitwise AND if both bits in the compared position of the bit patterns are 111, the bit in the resulting bit pattern is 111, otherwise 000.

A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A & B = 101 & 001 = 001 = 1 (in decimal)
OR ( | ): Bitwise OR is also similar to bitwise AND. If both bits in the compared position of the bit patterns are 000, the bit in the resulting bit pattern is 000, otherwise 111.

A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A | B = 101 | 001 = 101 = 5 (in decimal)
XOR (^): In bitwise XOR if both bits are 000 or 111, the result will be 000, otherwise 111.

A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A ^ B = 101 ^ 001 = 100 = 4 (in decimal)
Left Shift (<<): Left shift operator is a binary operator which shifts some number of bits to the left and appends 000 at the end. One left shift is equivalent to multiplying the bit pattern with 222.

A = 1 = 001 (in binary) 
A << 1 = 001 << 1 = 010 = 2 (in decimal)
A << 2 = 001 << 2 = 100 = 4 (in decimal)

B = 5 = 00101 (in binary)
B << 1 = 00101 << 1 = 01010 = 10 (in decimal)
B << 2 = 00101 << 2 = 10100 = 20 (in decimal)
Right Shift (>>): Right shift operator is a binary operator which shifts some number of bits to the right and appends 000 at the left side. One right shift is equivalent to dividing the bit pattern with 222.

A = 4 = 100 (in binary) 
A >> 1 = 100 >> 1 = 010 = 2 (in decimal)
A >> 2 = 100 >> 2 = 001 = 1 (in decimal)
A >> 3 = 100 >> 3 = 000 = 0 (in decimal)

B = 5 = 00101 (in binary)
B >> 1 = 00101 >> 1 = 00010 = 2 (in decimal)
