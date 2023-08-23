## [767. Reorganize String](https://leetcode.com/problems/reorganize-string/)

```Tag```: ```Priority Queue```

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

- __Time Complexity__: \mathcal{O}(N \cdot \log k)$
- __Space Complexity__: \mathcal{O}(k)$

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
