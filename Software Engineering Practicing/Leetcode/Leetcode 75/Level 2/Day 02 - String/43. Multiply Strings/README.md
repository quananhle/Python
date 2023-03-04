## [43. Multiply Strings](https://leetcode.com/problems/multiply-strings/)

```Tag```: ```String & Array``` ```Karatsuba Algorithm``` ```Math```

#### Difficulty: Medium

Given two non-negative integers ```num1``` and ```num2``` represented as strings, return the product of ```num1``` and ```num2```, also represented as a string.

Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

![image](https://user-images.githubusercontent.com/35042430/222845085-2f05df26-7e34-46ee-be08-e269284772c4.png)

---

__Example 1:__
```
Input: num1 = "2", num2 = "3"
Output: "6"
```

__Example 2:__
```
Input: num1 = "123", num2 = "456"
Output: "56088"
```

__Constraints:__

- ```1 <= num1.length, num2.length <= 200```
- ```num1``` and ```num2``` consist of digits only.
- Both ```num1``` and ```num2``` do not contain any leading zero, except the number ```0``` itself.

---

### Elementary Math

![image](https://leetcode.com/problems/multiply-strings/Figures/43/Slide4.JPG)

![image](https://user-images.githubusercontent.com/35042430/222851905-26f5446d-5cc8-4173-88bc-f6265b27e665.png)

1. Reverse both numbers.
2. For each digit in ```second_number```:
    - Keep a ```carry``` variable, initially equal to ```0```.
    - Initialize ```current``` array beginning with the appropriate number of zeros according to the place of the ```second_number``` digit.
    - For each digit in first_number:
      - Multiply the ```second_number```'s digit and the ```first_number```'s digit and add ```carry``` to the ```multiplication```.
      - Take the remainder of ```multiplication``` with ```10``` to get the last digit.
      - Append the last digit to the ```current```.
      - Divide ```multiplication``` by ```10``` to get the new value for ```carry```.
    - Append the remaining value for ```carry``` (if any) to the ```current```.
    - Push the ```current``` into the ```res``` array.
3. Compute the cumulative sum over all the obtained arrays using the ```ans``` as an answer.
4. Reverse ```ans``` and return it.

- __Time complexity: O(M<sup>2</sup> + M * N)__.
- __Space complexity: O(M<sup>2</sup> + M * N)__.

```Python
class Solution:
    def multiply(self, num1: str, num2: str) -> str:
        if num1 == '0' or num2 == '0':
            return '0'
        
        first_number = num1[::-1]
        second_number = num2[::-1]

        def multiply_one_digit(digit2, num_zeros, first_number):
            current = [0] * num_zeros
            carry = 0

            for digit1 in first_number:
                multiplication = int(digit1) * int(digit2) + carry
                carry = multiplication // 10
                current.append(multiplication % 10)

            if carry != 0:
                current.append(carry)
            return current
        
        def sum_results(results):
            ans = results.pop()

            for result in results:
                new_ans = list()
                carry = 0
            
                for digit1, digit2 in itertools.zip_longest(result, ans, fillvalue=0):
                    curr_sum = digit1 + digit2 + carry
                    carry = curr_sum // 10
                    new_ans.append(curr_sum % 10)
                
                if carry != 0:
                    new_ans.append(carry)
                
                ans = new_ans
            return ans

        res = list()
        for index, digit in enumerate(second_number):
            res.append(multiply_one_digit(digit, index, first_number))
        
        ans = sum_results(res)
        return ''.join(str(digit) for digit in reversed(ans))
```
