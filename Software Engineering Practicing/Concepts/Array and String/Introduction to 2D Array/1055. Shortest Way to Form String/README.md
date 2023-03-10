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

The problem is an optimization problem. We need to find __minimum__ (number of subsequences of ```source```) that satisfies some constraints (their concatenation equals ```target```). Whenever an optimization problem is given, one often dives into two Algorithm Paradigms.

1. __Greedy Algorithm__: In this approach, we try to find the best solution at every step. We do not look back to see if the solution we have found is the best. We just keep on finding the best solution at every step. This approach is very fast, but it does not always give the best solution.

        However, the greedy algorithm has worked well in this problem. Approach 1 follows the basic greedy template, and all Approaches 2, 3, and 4 are just variations of Approach 1. Thus, all these approaches are also greedy algorithms.

2. __Dynamic Programming__: In this approach, we try to find the best solution for a given problem. We store the best solution for every subproblem. When we need to find the best solution for a problem, we look at the best solution for all the subproblems. It always gives the best solution if it exists.

__Dynamic Programming Problems__ have two important components.

    - Optimal Substructure: The best solution for a problem can be obtained by using the best solution for its subproblems.
    - Overlapping Subproblems: The problem can be broken down into subproblems, which are reused several times.

In any Dynamic Programming Problem, we need to find the recurrence relation. The recurrence relation is the relation between the best solution for a problem and the best solution for its subproblems.

#### Top-Down Dynamic Programming

```Python
class Solution:
    def shortestWay(self, source: str, target: str) -> int:

        # Check if the Task is possible or not
        # Set of all characters of source. Can use boolean array too.
        source_chars = set(source)

        # Check if all characters of target are present in source
        # If any character is not present, return -1
        for char in target:
            if char not in source_chars:
                return -1

        # Modified is_subsequence function. in_string will always be source
        # For to_check, passing indices of target, both included

        def is_subsequence(start, end):

            i = start
            j = 0

            while i <= end and j < len(source):
                if target[i] == source[j]:
                    i += 1
                j += 1

            return i == end + 1

        # Optimal Answer for a given ending index. Memoizing using a dictionary
        memo = {}

        def optimal_answer(ending_index):

            # Base case
            if ending_index == 0:
                return 1

            # If already computed, return the value
            if ending_index in memo:
                return memo[ending_index]

            # If is subsequence, return 1
            if is_subsequence(0, ending_index):
                memo[ending_index] = 1
                return 1

            # If not subsequence, partition into two parts and find minimum
            answer = float('inf')

            for partition_index in range(ending_index):

                # Check for subsequence only if the answer is less
                # than the current answer. Using AND Short Circuiting
                if (optimal_answer(partition_index) + 1 < answer and
                        is_subsequence(partition_index + 1, ending_index)):
                    answer = min(answer, optimal_answer(partition_index) + 1)

            # Memoize and return
            memo[ending_index] = answer
            return answer

        # Want to find the optimal answer for the last index.
        # Case when the task is not possible is already handled
        return optimal_answer(len(target) - 1)
```

#### Bottom-Up Dynamic Programming

```Python
class Solution:
    def shortestWay(self, source: str, target: str) -> int:

        # Check if the Task is possible or not
        # Set of all characters of source. Can use boolean array too.
        source_chars = set(source)

        # Check if all characters of target are present in source
        # If any character is not present, return -1
        for char in target:
            if char not in source_chars:
                return -1

        # Modified is_subsequence function. in_string will always be source
        # For to_check, passing indices of target, both included
        def is_subsequence(start, end):

            i = start
            j = 0

            while i <= end and j < len(source):
                if target[i] == source[j]:
                    i += 1
                j += 1

            return i == end + 1

        # Optimal Answer Array for each ending Index
        opt = [float('inf')] * len(target)
        opt[0] = 1

        for ending_index in range(1, len(target)):
            if is_subsequence(0, ending_index):
                opt[ending_index] = 1
            else:
                for partition_index in range(ending_index):
                    if (opt[partition_index] != float('inf') and
                            is_subsequence(partition_index + 1, ending_index)):
                        opt[ending_index] = min(
                            opt[ending_index], opt[partition_index] + 1)

        # Return Optimal Answer for last index
        return opt[-1]
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
                # Keep iterating the current index and start searching from there next
                s = char_index[char][index] + 1

        return count
```

### 2D Array

```Python
class Solution:
    def shortestWay(self, source: str, target: str) -> int:
        n = len(source)
        next_occurrence = [collections.defaultdict(int) for idx in range(n)]
        
        # Base case: the index of the last character
        next_occurrence[n - 1][source[n-1]] = n - 1

        for i in range(n - 2, -1, -1):
            next_occurrence[i] = next_occurrence[i + 1].copy()
            next_occurrence[i][source[i]] = i

        s = 0
        count = 1

        for char in target:
            if not char in next_occurrence[0]:
                return -1
            
            # Check if source iterator has reached the end of the source, or character not in source after source iterator, loop back to the beginning
            if s == n or not char in next_occurrence[s]:
                count += 1
                s = 0
            # Move to next character in source after iterating the source iterator
            s = next_occurrence[s][char] + 1

        return count
```
