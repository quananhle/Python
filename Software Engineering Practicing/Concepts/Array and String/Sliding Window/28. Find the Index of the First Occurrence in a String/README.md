## [28. Find the Index of the First Occurrence in a String](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/)

```Tag```: [```Sliding Window```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Sliding%20Window/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String) ```Hash Map``` [```Rabin-Karp Algorithm```](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Algorithms/String%20Matching/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String/README.md) [```Knuth–Morris–Pratt Algorithm```](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Algorithms/String%20Matching/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String/README.md)

#### Difficulty: Medium

Given two strings ```needle``` and ```haystack```, return _the index of the first occurrence of ```needle``` in ```haystack```, or ```-1``` if ```needle``` is not part of ```haystack```_.

![image](https://user-images.githubusercontent.com/35042430/222788137-44259d39-b2b5-4358-9d37-098a06c229fb.png)

---

__Example 1:__
```
Input: haystack = "sadbutsad", needle = "sad"
Output: 0
Explanation: "sad" occurs at index 0 and 6.
The first occurrence is at index 0, so we return 0.
```

__Example 2:__
```
Input: haystack = "leetcode", needle = "leeto"
Output: -1
Explanation: "leeto" did not occur in "leetcode", so we return -1.
```

__Constraints:__

- 1 <= ```haystack.length, needle.length``` <= 10<sup>4</sup>
- ```haystack``` and ```needle``` consist of only lowercase English characters.

---

There are multiple applications of ```String Matching```, and that's why a lot of research has been done in this field. Multiple algorithms have been devised to solve this problem. Some of the application includes:

- Spell Checker
- Plagiarism Detection
- Text Editors
- Spam Filters
- Digital Forensics
- Matching DNA Sequences
- Intrusion Detection
- Search Engines
- Bioinformatics and Cheminformatics
- Information Retrieval System
- Language Syntax Checker

### Sliding Window

- __Time complexity__: ```O(n * m)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        n = len(haystack)
        m = len(needle)

        for start in range(n - m + 1):
            for end in range(m):
                # Check if character does not match
                if haystack[start + end] != needle[end]:
                    break
                # Otherwise, matching character, check if it is the last character of needle
                elif end == m - 1:
                    return start
        
        return -1
```

---

### Rabin-Karp Algorithm (Single Hash)

__Spurious Hits__: If the hash value of ```needle``` matches with the hash-value of the m-Substring of ```haystack``` but the m-Substring is not equal to ```needle```, then we have a spurious hit.

__Compute Hash Value__

![image](https://user-images.githubusercontent.com/35042430/222805990-6bdbbd8a-524d-40e5-a7fb-047fac8bc4bb.png)

__Algorithm__
Store the length of needle in m and the length of haystack in n.

If n is less than m, it means that needle cannot be there in haystack. Return -1.

Define constants as follows:

RADIX is the base of the number system. In our case, it is 262626.
MOD is a large prime number to prevent overflow.
MAX_WEIGHT is the largest value of the weight of any character. In our case, it is 26m26^m26 
m
 . This value is used in the O(1)O(1)O(1) formula. Hence, it's better to store it.
Define the hash_value() function which takes a string as input and returns the hash value of the string. The hash value is calculated by

Iterating string from right to left.
Multiplying the mapping value of each character with its weight factor and adding it to hash value ans.
The factor gets multiplied by RADIX in each iteration.
The ans and factor are moduloed by MOD at each iteration.
Using the hash_value() function, compute the hash value of needle.

Iterate over haystack from index 0 to n - m using window_start.

Compute the hash value of the current window, if it's the first window, then compute using the hash_value() function, otherwise use the O(1)O(1)O(1) formula. Make sure to use the property of modular arithmetic to prevent overflow.
If the hash value of the current window matches with the hash value of needle, then compare characters in the current window with needle.
If any character doesn't match, then it's a spurious hit. Move on to the next window.
If all characters match, then return the index of the current window_start.
If we reach the end of the haystack and didn't find the needle, return -1.

Example: Let haystack be "ccaccaacdba" and needle be "dba". Let m be the length of needle and n be the length of haystack. Thus, m = 3 and n = 11. Let RADIX be 262626 and MOD be 109+710^9 + 710 
9
 +7. Therefore, MAX_WEIGHT will be 263=1757626^3 = 1757626 
3
 =17576.

Let's compute the hash value of needle "dba". Please note that 'a' is mapped to 000, 'b' to 111 and 'c' to 222, and so on. dba=262⋅3+261⋅1+260⋅0=2054\text{dba} = 26^2 \cdot 3 + 26^1 \cdot 1 + 26^0 \cdot 0 = 2054dba=26 
2
 ⋅3+26 
1
 ⋅1+26 
0
 ⋅0=2054. We are interested in finding a substring in haystack which has the same hash value as needle, i.e. 205420542054.

The slides illustrate the process of computing the hash value of every m-substring of haystack and comparing it with the hash value of needle.

![image](https://user-images.githubusercontent.com/35042430/222807120-6f752120-92b4-48ae-9cd5-abbb1f242040.png)

__Check character by character if hash values matched__

![image](https://user-images.githubusercontent.com/35042430/222807675-93baafbc-2261-4ce2-8496-64214a810865.png)

![image](https://user-images.githubusercontent.com/35042430/222807778-bd925ebe-5628-4c27-a74c-e6e78f3b60b3.png)

![image](https://user-images.githubusercontent.com/35042430/222807813-198968a0-a855-4385-beb3-0a0831ff6dab.png)

![image](https://user-images.githubusercontent.com/35042430/222806433-0608d386-867d-4667-903e-969ed3c32a0d.png)

![image](https://user-images.githubusercontent.com/35042430/222806523-faa09e05-3839-4148-8364-f63c2251736a.png)

![image](https://user-images.githubusercontent.com/35042430/222806737-8652573a-2166-4073-b3c9-db6940da57f2.png)

![image](https://user-images.githubusercontent.com/35042430/222806666-e4a87efe-ce3a-432c-a838-ced8a0621438.png)

- __Time complexity__: ```O(n * m)```
- __Space complexity__: ```O(1)```

```Python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        n = len(haystack)
        m = len(needle)

        if n < m:
            return -1

        RADIX = 26
        MOD = 10**9 + 7
        MAX_WEIGHT = 1

        for _ in range(m):
            MAX_WEIGHT = (MAX_WEIGHT * RADIX) % MOD
        
        def compute_hash_value(string):
            ans = 0
            factor = 1

            for i in range(m - 1, -1, -1):
                ans += (ord(string[i]) - 97) * factor % MOD
                factor = factor * RADIX % MOD
            
            return ans % MOD
        
        hash_needle = compute_hash_value(needle)

        for start in range(n - m + 1):
            if start == 0:
                # Compute the hash value of the haystack that has the same length as needle
                hash_haystack = compute_hash_value(haystack)
            else:
                # Compute the hash value on a rolling window
                hash_haystack = (hash_haystack * RADIX % MOD - \
                                (ord(haystack[start - 1]) - 97) * MAX_WEIGHT) % MOD + \
                                (ord(haystack[start + m - 1]) - 97 + MOD) % MOD

            # Check if hash values of needle and haystack are matching
            if hash_needle == hash_haystack:
                # Scan every character in the window
                for end in range(m):
                    if needle[end] != haystack[start + end]:
                        break
                if end == m - 1:
                    return start

        return -1
```

#### Implementation Notes

In Python3, we have used ```ord``` to convert a character to its ASCII value. Now, the ASCII Value of ```a``` is ```97```, and we want to scale it down to ```0```, hence, we have used ```ord(string[i]) - 97``` in the code.

Since Python3 can handle large integers, we need not use ```MOD```. In that case, the hash value will be unique, and we can simply return ```start``` if the hash value matches. But operations (addition, multiplication, and subtraction) on large integers are slow.

Since ```MAX_WEIGHT``` is MOD 26<sup>m</sup>, therefore, we have calculated it iteratively, instead of using the ```pow()``` function, for a few reasons:

- ```pow()``` function can overflow, and we don't want that. In Iteration, we are ```MOD```ing the value at each step, so we are safe.
- In Java, the ```Math.pow()``` function returns a ```double```, and it has a precision error. Thus, iterating is a better option.
- ```MOD```ing at each step of iteration is better than first computing the entire large 26<sup>m</sup> and then ```MOD```ing it.

### Rabin-Karp algorithm (Double Hash)

The major drawback of previous approach was that even in case of a match, we had to iterate character by character in each window. We can't return true immediately, because of the CHANCE of spurious hits.

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(1)```

__Algorithm__

1. Store the length of needle in ```m``` and the length of haystack in ```n```.

2. If ```n``` is less than ```m```, it means that ```needle``` cannot be there in ```haystack```. Return ```-1```.

3. Define constants as follows:

- ```RADIX_1``` as the radix of the first hashing mechanism. It should be at least 26.
- ```RADIX_2``` as the radix of the second hashing mechanism. It should be at least 26, and different from ```RADIX_1```.
- ```MOD_1``` as the modulus for the first hashing mechanism. It should be a large prime number.
- ```MOD_2``` as the modulus for the second hashing mechanism. It should be a large prime number, and different from ```MOD_1```.
- ```MAX_WEIGHT_1``` as the maximum weightage for the first hashing mechanism. It will be RADIX_1<sup>m</sup>. This value is used in the O(1) formula. Hence, it's better to store it.
- ```MAX_WEIGHT_2``` as the maximum weightage for the second hashing mechanism. It will be RADIX_2<sup>m</sup>. This value is used in the O(1) formula. Hence, it's better to store it.

4. Define the ```compute_hash_pair_value()``` function which takes a string as input and returns the hash value pair of the string.

- Compute the hash value of the first hashing mechanism using ```RADIX_1```, and ```MOD_1```.
- Compute the hash value of the second hashing mechanism using ```RADIX_2``` and ```MOD_2```.

5. Using the ```compute_hash_pair_value()``` function, compute the hash value of ```needle```.

6. Iterate over ```haystack``` from index ```0``` to ```n - m``` using ```start```.

- Compute the hash value pair of the current window, if it's the first window, then compute using the ```compute_hash_pair_value()``` function, otherwise use the O(1) formula. Make sure to use the property of modular arithmetic to prevent overflow.
- If the hash value pair of the current window matches with the hash value pair of ```needle```, then return ```start```. The probability of a spurious hit tends to zero.

7. If we reach the end of the ```haystack``` and didn't find the ```needle```, return ```-1```.

```Python
        n = len(haystack)
        m = len(needle)

        if n < m:
            return -1

        RADIX_1 = 26
        MOD_1 = 10**9 + 33
        MAX_WEIGHT_1 = 1
        RADIX_2 = 27
        MOD_2 = 2**31 - 1
        MAX_WEIGHT_2 = 1

        for _ in range(m):
            MAX_WEIGHT_1 = (MAX_WEIGHT_1 * RADIX_1) % MOD_1
            MAX_WEIGHT_2 = (MAX_WEIGHT_2 * RADIX_2) % MOD_2
        
        def compute_hash_pair_value(string):
            hash_1 = hash_2 = 0
            factor_1 = factor_2 = 1

            for i in range(m - 1, -1, -1):
                hash_1 += (ord(string[i]) - 97) * factor_1 % MOD_1
                factor_1 = factor_1 * RADIX_1 % MOD_1
                hash_2 += (ord(string[i]) - 97) * factor_2 % MOD_2
                factor_2 = factor_2 * RADIX_2 % MOD_2
            
            return [hash_1 % MOD_1, hash_2 % MOD_2]
        
        hash_needle = compute_hash_pair_value(needle)

        for start in range(n - m + 1):
            if start == 0:
                # Compute the hash value of the haystack that has the same length as needle
                hash_haystack = compute_hash_pair_value(haystack)
            else:
                # Compute the hash value of pair on a rolling window
                hash_haystack[0] = (hash_haystack[0] * RADIX_1 % MOD_1 - \
                                (ord(haystack[start - 1]) - 97) * MAX_WEIGHT_1) % MOD_1 + \
                                (ord(haystack[start + m - 1]) - 97) % MOD_1
                hash_haystack[1] = (hash_haystack[1] * RADIX_2 % MOD_2 - \
                                (ord(haystack[start - 1]) - 97) * MAX_WEIGHT_2) % MOD_2 + \
                                (ord(haystack[start + m - 1]) - 97) % MOD_2
                                
            # Check if hash values of needle and haystack are matching
            if hash_needle == hash_haystack:
                return start

        return -1
```
