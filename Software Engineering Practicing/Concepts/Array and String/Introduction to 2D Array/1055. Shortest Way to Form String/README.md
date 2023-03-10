## [1055. Shortest Way to Form String](https://leetcode.com/problems/shortest-way-to-form-string/)

```Tag```: ```Two Pointers``` ```Greedy``` ```Matrix``` ```Dynamic Programming```

#### Difficulty: Medium

A __subsequence__ of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., ```"ace"``` is a subsequence of ```"abcde"``` while ```"aec"``` is not).

Given two strings ```source``` and ```target```, return _the minimum number of __subsequences__ of ```source``` such that their concatenation equals ```target```_. If the task is impossible, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/224107689-43e27f6e-cdc9-4b0b-90ff-7ca65071405b.png)

---

__Example 1:__
```
Input: source = "abc", target = "abcbc"
Output: 2
Explanation: The target "abcbc" can be formed by "abc" and "bc", which are subsequences of source "abc".
```

__Example 2:__
```
Input: source = "abc", target = "acdbc"
Output: -1
Explanation: The target string cannot be constructed from the subsequences of source string due to the character "d" in target string.
```

__Example 3:__
```
Input: source = "xyz", target = "xzyxz"
Output: 3
Explanation: The target string can be constructed as follows "xz" + "y" + "xz".
```

__Constraints:__

- ```1 <= source.length, target.length <= 1000```
- ```source``` and ```target``` consist of lowercase English letters.

---

### The Framework


#### Top-Down Dynamic Programming

```Python

```

#### Bottom-Up Dynamic Programming

```Python

```

### Greedy

#### Concatenate until Subarray

![Mind_Blowing](https://media.tenor.com/tvFWFDXRrmMAAAAd/blow-mind-mind-blown.gif)

Note : This approach falls under the category of Greedy algorithm paradigm. If the task is possible to achieve, then we will always get the optimal answer, because we are greedily trying to cover as much of the target as possible with each concatenation of source.

We greedily match as many characters of target as possible with each concatenation of ```source```, which leads to minimum usage of source and thus the minimum number of concatenations.

In terms of the original problem statement, we are greedily exhausting all characters in the ```source``` before starting a new subsequence. In other words, __each concatenation is constructing the longest POSSIBLE subsequences and because of that we won't be able to construct a more optimal solution__.

- __Time complexity__: O(T<sup>2</sup> * S) where ```T``` is length of target and ```S``` is length of source.
    - O(S) to create a boolean array to mark all characters of ```source```.
    - O(T) to check if all characters of ```target``` are present in ```source```.
- __Space Complexity__: ```O(TS)```

```Python
class Solution:
    def shortestWay(self, source: str, target: str) -> int:
        def is_subsequence(s, t):
            n, m = len(s), len(t)
            i, j = 0, 0

            while i < n and j < m:
                if s[i] == t[j]:
                    i += 1
                j += 1

            return i == n
        
        char_set = set(source)

        # Check if all of the characters of target are present in source
        for char in target:
            # Check if any character is not present
            if not char in char_set:
                return -1
        
        concatenated_source = source
        count = 1
        # Kepp concaneting the subsequence until it becomes a subarray
        while not is_subsequence(target, concatenated_source):
            concatenated_source += source
            count += 1
        
        return count
```

#### Two Pointers

```Python
class Solution:
    def shortestWay(self, source: str, target: str) -> int:
        n, m = len(source), len(target)

        char_set = set(source)
        for char in target:
            if not char in char_set:
                return -1
            
        s = 0
        count = 0

        # Loop through all the character of target to find in source
        for char in target:
            # Check if iterator of sources reaches start, increment count
            if s == 0:
                count += 1

            # Break the loop when char of target is found in source
            while source[s] != char:
                # Ensure s pointer is looping back to the first index source
                s = (s + 1) % n

                # Check if while finding, iterator reaches start of source again, increment count
                if s == 0:
                    count += 1

            # Increment s pointer after char of target is found in source, but ensure s pointer is looping back to the first index source
            s = (s + 1) % n

        return count
```

### Inverted Index and Binary Search

#### Algorithm

1. Create a 2D array ```char_index```. The size of the array will be 26 because there are 26 lowercase English letters. The list at each index will store the indices of the character corresponding to that index in the ```source``` string. This can be done by traversing the ```source``` string once and storing the indices in the ```char_index```

2. Initialize ```s``` to ```0```, and ```count``` to ```1```. The former will be used to iterate over the ```source``` string, and the latter will be used to count the number of times we need to iterate over the ```source``` string.

3. For every character ```char``` in the ```target``` string,

    - if ```char``` is not present in the ```source``` string, return ```-1```.
    - else, find the index of ```char``` in the ```source``` string, which is just greater than or equal to ```s```. If no such index is found, we can loop around, and thus return the first index of ```char``` in ```source```. Looping around should be marked by incrementing ```count``` by ```1```.
    - Index can be found using binary search on ```char_index[char]```.
    - Update ```s``` to the successor index because next time, we will start searching from the successor index.

4. Return ```count```.

```Python
class Solution:
    def shortestWay(self, source: str, target: str) -> int:
        # Size of the dictionary will be 26 because there are 26 lowercase English letters
        char_index = collections.defaultdict(list)
        for i, c in enumerate(source):
            char_index[c].append(i)
        
        s = 0
        count = 1

        for char in target:
            if not char in char_index:
                return -1

            # Binary search to find the index of the character in source next to the current source_iterator
            index = bisect.bisect_left(char_index[char], s)

            # Ensure source iterator reset to the first index after the reached the last index
            if index == len(char_index[char]):
                count += 1
                # Iterate through source again, hence first index of character in source
                s = char_index[char][0] + 1
            else:
                # Keep iterating the current index
                s = char_index[char][index] + 1

        return count
```

### 2D Array

```Python

```
