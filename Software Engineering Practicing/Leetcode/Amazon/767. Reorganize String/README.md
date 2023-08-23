## [767. Reorganize String](https://leetcode.com/problems/reorganize-string/)

```Tag```: ```Priority Queue``` ```Counter```

#### Difficulty: Medium

Given a string ```s```, rearrange the characters of ```s``` so that any two adjacent characters are not the same.

Return _any possible rearrangement of ```s``` or return ```""``` if not possible_.

![image](https://github.com/quananhle/Python/assets/35042430/224474eb-c4e3-4bc8-a112-222f74e44c9a)

---

__Example 1:__
```
Input: s = "aab"
Output: "aba"
```

__Example 2:__
```
Input: s = "aaab"
Output: ""
```

__Constraints:__

- $1 \le s.length \le 500$
- ```s``` consists of lowercase English letters.

---

## Approach 1: Counting and Priority Queue

![image](https://github.com/quananhle/Python/assets/35042430/b03e6309-486b-4093-9573-251c07457fab)

![image](https://github.com/quananhle/Python/assets/35042430/256bbcaa-ecd2-456c-8bb1-c366ce1dc5f1)

__Algorithm__

1. Initialize an empty list ```res``` to store the rearranged characters.
2. Create a priority queue ```pq``` using a heap data structure. Each element in ```pq``` is a tuple containing the count of a character and the character itself. The priority queue is ordered in a way such that elements with higher counts have higher priority.
> Note: Python and Ruby implement min heaps. To emulate a max heap, we will make the frequencies negative.
3. While ```pq``` is not empty:
  - Pop the element with the highest priority from ```pq```. Assign its count and character to ```first_count``` and ```first_char``` respectively.
  - If ```res``` is empty or the current character ```first_char``` is different from the last character in ```res```, append ```first_char``` to res. If the count of ```first_char``` is not zero, update its count by decreasing it by one and push it back to ```pq```. Continue to the next iteration.
  - Otherwise, if ```first_char``` is the same as the last character in ```res```, it means we need to choose a different character. If ```pq``` is empty, return an empty string as it is impossible to rearrange the characters.
  - Pop the next element from ```pq```, assigning its count and character to ```second_count``` and ```second_char``` respectively. Append ```second_char``` to ```res```.
  - If the count of ```second_char``` is not zero, update its count by decreasing it by one and push it back to ```pq```.
  - Finally, push the original ```first_char``` back to ```pq```.
4. Return the rearranged characters as a string by joining the elements in ```res```.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N \cdot \log k)$. We add one character to the string per iteration, so there are $\mathcal{O}(N)$ iterations. In each iteration, we perform a maximum of ```3``` priority queue operations. Each priority queue operation costs $\log k$. For this problem, ```k``` is bounded by ```26```, so one could argue that the time complexity is actually $\mathcal{O}(N)$.
- __Space Complexity__: $\mathcal{O}(k)$. The counter used to count the number of occurrences will incur a space complexity of $\mathcal{O}(k)$. Similarly, the maximum size of the priority queue will also be $\mathcal{O}(k)$. Given that $k \le 26$ in this problem, one could argue the space complexity is in fact $\mathcal{O}(1)$.

```Python
class Solution:
    def reorganizeString(self, s: str) -> str:
        n = len(s)
        res = list()

        pq = [(-count, char) for char, count in collections.Counter(s).items()]
        heapq.heapify(pq)
        
        while pq:
            first_cnt, first_chr = heapq.heappop(pq)
            if not res or first_chr != res[-1]:
                res.append(first_chr)
                if first_cnt + 1 != 0:
                    heapq.heappush(pq, (first_cnt + 1, first_chr))
            else:
                if not pq:
                    return ""
                second_cnt, second_chr = heapq.heappop(pq)
                res.append(second_chr)
                if second_cnt + 1 != 0:
                    heapq.heappush(pq, (second_cnt + 1, second_chr))
                heapq.heappush(pq, (first_cnt, first_chr))
        
        return "".join(res)
```

### Approach 2: Counting and Odd/Even

![image](https://github.com/quananhle/Python/assets/35042430/ba6a6f91-5998-4ac3-9d8c-4fc28506ab03)

![image](https://github.com/quananhle/Python/assets/35042430/b2c86914-df4d-4c54-a3d9-a81cb22167dd)

![image](https://github.com/quananhle/Python/assets/35042430/bb59a813-6123-490f-b028-33874f7acd83)

![image](https://github.com/quananhle/Python/assets/35042430/88d72612-9673-42ac-992c-4fedd83d92a9)

![image](https://github.com/quananhle/Python/assets/35042430/c9e910ca-dd97-4492-9101-f514a4d154a1)

__Algorithm__

1. Create a counter ```counter``` to store the counts of each character in the input string ```s```.
2. Find the character with the maximum count (```max_count```) in ```counter```. Set letter as the corresponding character.
3. Check if ```max_count``` is greater than half of the length of the string rounded up. If so, it is not possible to rearrange the characters. Return an empty string.
4. Initialize a list ```res``` of length equal to ```s```.
5. Set the starting index ```i``` as ```0```.
6. Place the most frequent character ```letter``` in the ```res``` list at every second index until its count becomes zero. Increment ```i``` by ```2``` for each placement and decrease the count of ```letter``` in ```counter```.
7. Iterate through the remaining characters and their counts in ```counter```:
  - While the ```count``` is greater than zero:
    - If index ```i``` exceeds the length of ```s```, set index ```i``` as ```1``` to place all future characters at odd indices.
    - Place the current character at index ```i``` in the ```res``` list and increment index ```i``` by ```2```.
    - Decrease the ```count``` of the character by ```1```.
8. Return the rearranged characters as a string by joining the elements in ```res```.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(N)$. We add one character to the string per iteration, so there are $\mathcal{O}(N)$ iterations.
- __Space Complexity__: $\mathcal{O}(k)$. The counter used to count the number of occurrences will incur a space complexity of $\mathcal{O}(k)$. Given that $k \le 26$ in this problem, one could argue the space complexity is in fact $\mathcal{O}(1)$.

```Python
class Solution:
    def reorganizeString(self, s: str) -> str:
        n = len(s)
        res, counter, i = [''] * n, collections.Counter(s), 0
        max_count, letter = 0, ''
        for char, count in counter.items():
            if count > max_count:
                max_count = count
                letter = char
        
        if max_count > (n + 1) // 2:
            return ""
        
        # Distribute the most frequent character
        while counter[letter] != 0:
            res[i] = letter
            i += 2
            counter[letter] -= 1

        del counter[letter]

        # Distribute the res of the characters in any order
        for char, count in counter.items():
            while count > 0:
                # After placing characters in all even indices, move pointer to the odd index
                if i >= n:
                    i = 1
                res[i] = char
                i += 2
                count -= 1

        return "".join(res)
```

```Python
class Solution:
    def reorganizeString(self, s: str) -> str:
        n = len(s)
        res, counter, i = [None] * n, collections.Counter(s), 0
        most_common_char, most_common_freq = counter.most_common(1)[0][0], counter.most_common(1)[0][1]

        if most_common_freq > (n + 1) // 2:
            return ""
        del counter[most_common_char]

        for c, f in [(most_common_char, most_common_freq)] + list(counter.items()):
            for _ in range(f):
                res[i] = c
                if i + 2 < n:
                    i += 2
                else:
                    i = 1

        return "".join(res)
```
