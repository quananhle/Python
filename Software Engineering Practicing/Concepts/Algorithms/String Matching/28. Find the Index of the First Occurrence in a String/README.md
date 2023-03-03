## [28. Find the Index of the First Occurrence in a String](https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string/)

```Tag```: [```Sliding Window```](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Array%20and%20String/Sliding%20Window/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String) ```Hash Map``` ```Math``` [```Rabin-Karp Algorithm```](https://github.com/quananhle/Python/blob/main/Software%20Engineering%20Practicing/Concepts/Algorithms/String%20Matching/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String/README.md#rabin-karp-algorithm-single-hash) [```Knuth–Morris–Pratt Algorithm```](https://github.com/quananhle/Python/blob/main/Software%20Engineering%20Practicing/Concepts/Algorithms/String%20Matching/28.%20Find%20the%20Index%20of%20the%20First%20Occurrence%20in%20a%20String/README.md#knuthmorrispratt-algorithm)

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

### Rabin-Karp Algorithm (Single Hash)

__Spurious Hits__: If the hash value of ```needle``` matches with the hash-value of the m-Substring of ```haystack``` but the m-Substring is not equal to ```needle```, then we have a spurious hit.

__Compute Hash Value__

![image](https://user-images.githubusercontent.com/35042430/222805990-6bdbbd8a-524d-40e5-a7fb-047fac8bc4bb.png)

__Example__: Let ```haystack``` be ```"ccaccaacdba"``` and needle be ```"dba"```. Let ```m``` be the length of ```needle``` and ```n``` be the length of ```haystack```. Thus, ```m = 3``` and ```n = 11```. Let ```RADIX``` be 26 and MOD be 10<sup>9</sup>+7. Therefore, ```MAX_WEIGHT``` will be ```26**3 = 17576```.

Let's compute the hash value of ```needle``` ```"dba"```. Please note that ```'a'``` is mapped to ```0```, ```'b'``` to ```1``` and ```'c'``` to ```2```, and so on. 
![image](https://user-images.githubusercontent.com/35042430/222812367-47c999af-d517-4d9f-aea5-b244fc326c02.png) We are interested in finding a substring in ```haystack``` which has the same hash value as ```needle```, i.e. 2054.

__Algorithm__

1. Store the length of ```needle``` in ```m``` and the length of ```haystack``` in ```n```.

2. If ```n``` is less than ```m```, it means that ```needle``` cannot be there in ```haystack```. Return ```-1```.

3. Define constants as follows:

- ```RADIX``` is the base of the number system. In our case, it is 26.
- ```MOD``` is a large prime number to prevent overflow.
- ```MAX_WEIGHT``` is the largest value of the weight of any character. In our case, it is 26<sup>m</sup>. This value is used in the O(1) formula. Hence, it's better to store it.

4. Define the ```compute_hash_value()``` function which takes a string as input and returns the hash value of the string. The hash value is calculated by

- Iterating string from right to left.
- Multiplying the mapping value of each character with its weight ```factor``` and adding it to hash value ```ans```.
- The factor gets multiplied by ```RADIX``` in each iteration.
- The ans and factor are moduloed by ```MOD``` at each iteration.

5. Using the hash_value() function, compute the hash value of ```needle```.

6. Iterate over ```haystack``` from index ```0``` to ```n - m``` using ```start```.

- Compute the hash value of the current window, if it's the first window, then compute using the ```compute_hash_value()``` function, otherwise use the O(1) formula. Make sure to use the property of modular arithmetic to prevent overflow.
- If the hash value of the current window matches with the hash value of ```needle```, then compare characters in the current window with ```needle```.
- If any character doesn't match, then it's a spurious hit. Move on to the next window.
- If all characters match, then return the index of the current ```start```.

![image](https://user-images.githubusercontent.com/35042430/222807675-93baafbc-2261-4ce2-8496-64214a810865.png)

![image](https://user-images.githubusercontent.com/35042430/222807778-bd925ebe-5628-4c27-a74c-e6e78f3b60b3.png)

![image](https://user-images.githubusercontent.com/35042430/222807813-198968a0-a855-4385-beb3-0a0831ff6dab.png)

![image](https://user-images.githubusercontent.com/35042430/222806433-0608d386-867d-4667-903e-969ed3c32a0d.png)

![image](https://user-images.githubusercontent.com/35042430/222806523-faa09e05-3839-4148-8364-f63c2251736a.png)

![image](https://user-images.githubusercontent.com/35042430/222806737-8652573a-2166-4073-b3c9-db6940da57f2.png)

![image](https://user-images.githubusercontent.com/35042430/222806666-e4a87efe-ce3a-432c-a838-ced8a0621438.png)

7. If we reach the end of the ```haystack``` and didn't find the ```needle```, return ```-1```.

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

What if we can minimize the CHANCE of spurious hits? Before proceeding, let's analyze some spurious hits using the previous approach.

A. Let MOD be 2<sup>31</sup>, and the approach used for mapping is ```a``` to ```1```, ```b``` to ```2```, ```c``` to ```3```, etc.
Then, both ```gytisyz``` and ```aaaaaab``` will have a hash value of ```321272408```. If we avoid comparing character-by-character, and return ```start``` immediately on matching hash value, then we will have a wrong answer.

B. Let MOD be 10<sup>9</sup> +33, and the approach used for mapping is ```a``` to ```0```, ```b``` to ```1```, ```c``` to ```2```, etc.
Then, both ```cadbbca``` and ```fghivbt``` will have the hash value of ```1619220817```. If we avoid comparing character-by-character, and return ```start``` immediately on matching hash value, then we will have a wrong answer.

But if we use case A. for ```cadbbca``` and ```fghivbt```, then ```cadbbca``` will map to ```1940493224``` while ```fghivbt``` will map to ```940493191```. And no spurious hits will be there.

Similarly, if we use case B. for ```gytisyz``` and ```aaaaaab```, then ```gytisyz``` will map to ```147483583``` while ```aaaaaab``` will map to ```1```. And no spurious hits will be there.

It turns out that instead of a single hash value, if we compute two (or more) hash values, we can significantly reduce the CHANCE of spurious hits. We need to compare these _hash value pair of ```needle``` with hash value pair of windows of ```haystack```_. Mathematically, we can prove that by using different ```MOD``` and ```RADIX```, we can reduce the CHANCE (i. e. probability) of spurious hits to 10<sup>−10</sup>

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
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
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

### Knuth–Morris–Pratt Algorithm

The drawback of Brute Force is that after mismatch, we need to set ```start``` to ```start + 1```, and thus, there are a lot of repeated comparisons.

Note: A common pitfall is when we think of setting ```start``` to one step ahead of the index where mismatching occurs. It works fine here.

- __Time complexity__: ```O(n)```
- __Space complexity__: ```O(m)```

```
sad#sadbutsad
[0, 0]
[0, 0, 0]
[0, 0, 0, 0]
[0, 0, 0, 0, 1]
[0, 0, 0, 0, 1, 2]
[0, 0, 0, 0, 1, 2, 3]
[0, 0, 0, 0, 1, 2, 3, 0]
[0, 0, 0, 0, 1, 2, 3, 0, 0]
[0, 0, 0, 0, 1, 2, 3, 0, 0, 0]
[0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 1]
[0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 1, 2]
[0, 0, 0, 0, 1, 2, 3, 0, 0, 0, 1, 2, 3]
aaaa#aaa
[0, 1]
[0, 1, 2]
[0, 1, 2, 3]
[0, 1, 2, 3, 0]
[0, 1, 2, 3, 0, 1]
[0, 1, 2, 3, 0, 1, 2]
[0, 1, 2, 3, 0, 1, 2, 3]
ll#hello
[0, 1]
[0, 1, 0]
[0, 1, 0, 0]
[0, 1, 0, 0, 0]
[0, 1, 0, 0, 0, 1]
[0, 1, 0, 0, 0, 1, 2]
[0, 1, 0, 0, 0, 1, 2, 0]
```

```Python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        def kmp(pattern, text):
            n = len(text)
            m = len(pattern)
            string = needle + '#' + haystack
            longest_prefix_suffix = [0]
            j = 0
            for i in range(1, len(string)):
                while j > 0 and string[i] != string[j]:
                    j = longest_prefix_suffix[j - 1]
                if string[j] == string[i]:
                    j += 1
                else:
                    j = 0
                longest_prefix_suffix.append(j)
            return longest_prefix_suffix
        string = kmp(needle, haystack)
        for i in range(len(needle) + 1, len(string)):
            if string[i] == len(needle):
                return i - 2 * len(needle)
        
        return -1
```

__Algorithm__

1. Let ```n``` be the length of ```haystack``` and ```m``` be the length of ```needle```. If ```n < m```, return ```-1```, as ```needle``` cannot be found in ```haystack```.

2. PREPROCESS ```needle``` to generate the ```longest_border``` array.

- Let ```prev``` be ```0``` and ```longest_border``` be an array of size ```m```.
- Set ```longest_border[0] = 0```.
- Iterate ```i``` from ```1 to m - 1```.
    - If ```needle[prev] == needle[i]```, increment ```prev``` and set ```longest_border[i] = prev```. Increment ```i```.
    - Else if ```needle[prev] != needle[i]```
        - If ```prev == 0```, set ```longest_border[i] = 0```. Increment ```i```
        - Else if ```prev != 0```, set ```prev = longest_border[prev - 1]```.

![image](https://user-images.githubusercontent.com/35042430/222824759-b4c48892-ecd4-42fa-b67a-f7eb6de8a5c2.png)

![image](https://user-images.githubusercontent.com/35042430/222825199-e871b7e6-29f9-4998-932c-b620ce2a8ee9.png)

![image](https://user-images.githubusercontent.com/35042430/222825167-553ed6a7-946c-4bee-9bfc-c9283916c892.png)

![image](https://user-images.githubusercontent.com/35042430/222825255-38b88f67-c6ac-460e-85f6-7242a6cdc119.png)

![image](https://user-images.githubusercontent.com/35042430/222825415-9db8e4e7-616c-4618-a1d2-12771e0f3226.png)

![image](https://user-images.githubusercontent.com/35042430/222825499-9464b2b3-f06e-4987-bddc-3f349e52fe2f.png)

![image](https://user-images.githubusercontent.com/35042430/222825577-d1f9817c-06cf-4572-a02e-1dcbe634a00b.png)

3. SEARCH in ```haystack``` for ```needle```.

- Let ```haystack_pointer``` be ```0```.
- Let ```needle_pointer``` be ```0```. It also represents the number of matches in the current window.
- Do this until ```haystack_pointer < n```
    - If characters at ```haystack[haystack_pointer]``` matches with character at ```needle[needle_pointer]```, increment ```needle_pointer``` and ```haystack_pointer```, and check for next characters. If ```needle_pointer == m```, return ```haystack_pointer - m``` (as ```needle``` is found in ```haystack``` starting at index ```haystack_pointer - m```).
    - If characters don't match,
        - If ```needle_pointer == 0```, it means zero matching. In this case, increment ```haystack_pointer``` and check for the next m-substring.
        - Else if ```needle_pointer != 0```, it means Partial Matching. Set ```needle_pointer = longest_border[needle_pointer - 1]```. Don't increment ```haystack_pointer```. We want to examine the mismatched character of ```haystack``` with the first character after matched characters of ```needle```.

4. If we have reached here, return ```-1```, as ```needle``` is not found in ```haystack```.

Example: Let ```haystack``` be ```"onionionskys"``` and ```needle``` be ```"onions"```. The length of ```haystack``` is ```n = 12``` and length of the ```needle``` is ```m = 6```.

![image](https://user-images.githubusercontent.com/35042430/222821570-dff9b61c-cfc8-4c92-aeb0-57212f227d10.png)

![image](https://user-images.githubusercontent.com/35042430/222821646-10a26214-18f4-4d91-9601-a19c8f31db4d.png)

![image](https://user-images.githubusercontent.com/35042430/222821724-dc6d4cc8-7efc-47cc-bb83-88742eeecd34.png)

![image](https://user-images.githubusercontent.com/35042430/222823146-808add3c-0945-45d1-b0d9-54d8bc019308.png)

![image](https://user-images.githubusercontent.com/35042430/222823210-64263dde-3c53-489f-94bf-0d9a7775b18e.png)

![image](https://user-images.githubusercontent.com/35042430/222823272-985d406c-81b1-4948-9478-8c133972376c.png)

![image](https://user-images.githubusercontent.com/35042430/222823352-838ca063-d0cd-4fc1-8306-930f5a548d8b.png)

It turns out that Linear Algorithm for PREPROCESSING is more or less the same as SEARCHING. In PREPROCESSING we compare ```needle``` with itself, trying to find the prefix in the latter part (often called "pre-searching" the ```needle```). In SEARCHING, we compare ```needle``` with ```haystack```, trying to find ```needle``` in ```haystack```.

```Python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        if needle == "":
            return 0
            
        lps = [0] * len(needle)
        # Initialize 2 pointers: prev_lps to point at the beginning of the prefix, and i to increment to find the longest prefix suffix
        prev_lps, i = 0, 1
        # Set up longest prefix suffix
        while i < len(needle):
            if needle[i] == needle[prev_lps]:
                lps[i] = prev_lps + 1
                prev_lps += 1
                i += 1
            elif prev_lps == 0:
                    lps[i] = 0
                    i += 1
            else:
                prev_lps = lps[prev_lps - 1]
        # i pointer for the haystack, j pointer for the needle
        i, j = 0, 0
        # Compare the needle and the haystack
        while i < len(haystack):
            # If found the matching characterin haystack and needle
            if haystack[i] == needle[j]:
                # Increment the pointers
                i += 1
                j += 1
            # Otherwise, if no matching character found
            else:
                # Check if pointing at the first character of the needle
                if j == 0:
                    # Increment the haystack pointer
                    i += 1
                # If not pointing at the first character of the needle
                else:
                    # Get the longest prefix suffix count
                    j = lps[j - 1]
            if j == len(needle):
                return i - len(needle)
        return -1
```

    Note: Although KMP is fast, still built-in functions of many programming languages use Brute Force. KMP is based on assumption 
    that there would be many duplicate similar substrings. In real-world strings, this is not the case. So, KMP is not used in 
    real-world applications. Moreover, it requires linear space. However, it has its application in DNA sequencing. DNA is 
    a long string of characters (A, C, G, T). There are many similar substrings in DNA. So, KMP is used in DNA sequencing.
