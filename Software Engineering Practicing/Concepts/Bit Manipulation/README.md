## Bitwise

Bit manipulation is the act of manipulating bits, like changing bits of an integer.
At the heart of bit manipulation are the bit-wise operators:

__NOT (~)__: Bitwise NOT is a unary operator that flips the bits of the number i.e., if the current bit is 000, it will change it to 111 and vice versa.

```Python
N = 5 = 101 (in binary)
~N = ~(101) = 010 = 2 (in decimal)
```

__AND (&)__: In bitwise AND if both bits in the compared position of the bit patterns are 111, the bit in the resulting bit pattern is 111, otherwise 000.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A & B = 101 & 001 = 001 = 1 (in decimal)
```

__OR ( | )__: Bitwise OR is also similar to bitwise AND. If both bits in the compared position of the bit patterns are 000, the bit in the resulting bit pattern is 000, otherwise 111.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A | B = 101 | 001 = 101 = 5 (in decimal)
```

__XOR (^)__: In bitwise XOR if both bits are 000 or 111, the result will be 000, otherwise 111.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A ^ B = 101 ^ 001 = 100 = 4 (in decimal)
```

__Left Shift (<<)__: Left shift operator is a binary operator which shifts some number of bits to the left and appends 000 at the end. One left shift is equivalent to multiplying the bit pattern with 222.

```Python
A = 1 = 001 (in binary) 
A << 1 = 001 << 1 = 010 = 2 (in decimal)
A << 2 = 001 << 2 = 100 = 4 (in decimal)

B = 5 = 00101 (in binary)
B << 1 = 00101 << 1 = 01010 = 10 (in decimal)
B << 2 = 00101 << 2 = 10100 = 20 (in decimal)
```

__Right Shift (>>)__: Right shift operator is a binary operator which shifts some number of bits to the right and appends 000 at the left side. One right shift is equivalent to dividing the bit pattern with 222.

```Python
A = 4 = 100 (in binary) 
A >> 1 = 100 >> 1 = 010 = 2 (in decimal)
A >> 2 = 100 >> 2 = 001 = 1 (in decimal)
A >> 3 = 100 >> 3 = 000 = 0 (in decimal)

B = 5 = 00101 (in binary)
B >> 1 = 00101 >> 1 = 00010 = 2 (in decimal)
```

![image](https://user-images.githubusercontent.com/35042430/229693293-c6bbd6ef-1418-4703-b9ac-31069d065f87.png)
