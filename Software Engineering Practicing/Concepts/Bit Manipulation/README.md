## Bitwise

Bit manipulation is the act of manipulating bits, like changing bits of an integer.
At the heart of bit manipulation are the bit-wise operators:

__NOT (~)__: Bitwise NOT is a unary operator that flips the bits of the number i.e., if the current bit is ```0```, it will change it to ```1``` and vice versa.

```Python
N = 5 = 101 (in binary)
~N = ~(101) = 010 = 2 (in decimal)
```

__AND (&)__: In bitwise AND if both bits in the compared position of the bit patterns are ```1```, the bit in the resulting bit pattern is ```1```, otherwise ```0```.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A & B = 101 & 001 = 001 = 1 (in decimal)
```

__OR ( | )__: Bitwise OR is also similar to bitwise AND. If both bits in the compared position of the bit patterns are ```0```, the bit in the resulting bit pattern is ```0```, otherwise ```1```.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A | B = 101 | 001 = 101 = 5 (in decimal)
```

__XOR (^)__: In bitwise XOR if both bits are ```0``` or ```1```, the result will be ```0```, otherwise ```1```.

```Python
A = 5 = 101 (in binary) 
B = 1 = 001 (in binary) 
A ^ B = 101 ^ 001 = 100 = 4 (in decimal)
```

__Left Shift (<<)__: Left shift operator is a binary operator which shifts some number of bits to the left and appends ```0``` at the end. One left shift is equivalent to multiplying the bit pattern with ```2```.

```Python
A = 1 = 001 (in binary) 
A << 1 = 001 << 1 = 010 = 2 (in decimal)
A << 2 = 001 << 2 = 100 = 4 (in decimal)

B = 5 = 00101 (in binary)
B << 1 = 00101 << 1 = 01010 = 10 (in decimal)
B << 2 = 00101 << 2 = 10100 = 20 (in decimal)
```

__Right Shift (>>)__: Right shift operator is a binary operator which shifts some number of bits to the right and appends ```0``` at the left side. One right shift is equivalent to dividing the bit pattern with ```2```.

```Python
A = 4 = 100 (in binary) 
A >> 1 = 100 >> 1 = 010 = 2 (in decimal)
A >> 2 = 100 >> 2 = 001 = 1 (in decimal)
A >> 3 = 100 >> 3 = 000 = 0 (in decimal)

B = 5 = 00101 (in binary)
B >> 1 = 00101 >> 1 = 00010 = 2 (in decimal)
```

![image](https://user-images.githubusercontent.com/35042430/229693293-c6bbd6ef-1418-4703-b9ac-31069d065f87.png)


#### The below slides show how bitwise AND (```&```) can be used to check if the $i^{th}$ bit is set, how bitwise OR (```|```) can be used to set the $i^{th}$ bit, and how bitwise XOR (```^```) can be used to unset the $i^{th}$ bit.

![image](https://github.com/quananhle/Python/assets/35042430/90780a51-eb17-46c4-94c5-45048532c3c1)

![image](https://github.com/quananhle/Python/assets/35042430/ce9f7dbd-e896-44ee-bd14-d6c4d3a7ee1c)

![image](https://github.com/quananhle/Python/assets/35042430/ddf9bb86-0820-409d-86b2-14f48444f31e)

