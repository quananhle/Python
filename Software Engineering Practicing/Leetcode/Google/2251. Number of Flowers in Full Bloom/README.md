## [2251. Number of Flowers in Full Bloom](https://leetcode.com/problems/number-of-flowers-in-full-bloom)

```Tag```: ```Interval``` ```Priority Queue``` ```Binary Search```

#### Difficulty: Hard

You are given a 0-indexed 2D integer array ```flowers```, where $flowers[i] = [start_i, end_i]$ means the $i^{th}$ flower will be in full bloom from $start_i$ to $end_i$ (inclusive). You are also given a 0-indexed integer array ```people``` of size ```n```, where ```people[i]``` is the time that the $i^{th}$ person will arrive to see the flowers.

Return _an integer array answer of size ```n```, where ```answer[i]``` is the number of flowers that are in full bloom when the $i^{th}$ person arrives_.

![image](https://github.com/quananhle/Python/assets/35042430/b9ef293d-db24-4415-867c-7f1c2a64e27d)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2022/03/02/ex1new.jpg)
```
Input: flowers = [[1,6],[3,7],[9,12],[4,13]], poeple = [2,3,7,11]
Output: [1,2,2,2]
Explanation: The figure above shows the times when the flowers are in full bloom and when the people arrive.
For each person, we return the number of flowers in full bloom during their arrival.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2022/03/02/ex2new.jpg)
```
Input: flowers = [[1,10],[3,3]], poeple = [3,3,2]
Output: [2,2,1]
Explanation: The figure above shows the times when the flowers are in full bloom and when the people arrive.
For each person, we return the number of flowers in full bloom during their arrival.
```

__Constraints:__

- $1 \le flowers.length \le 5 * 10^4$
- $flowers[i].length == 2$
- $1 \le start_i \le end_i \le 10^9$
- $1 \le people.length \le 5 * 10^4$
- $1 \le people[i] \le 109$

---

### Brute Force (Memory Limit Exceeded)

```Python
class Solution:
    def fullBloomFlowers(self, flowers: List[List[int]], people: List[int]) -> List[int]:
        memo = collections.defaultdict(int)
        for start, end in flowers:
            for i in range(start, end + 1):
                memo[i] += 1
        
        return [memo[month] for month in people]   
```

### Heap/Priority Queue

> To summarize, we use a pointer ```i``` to iterate along ```flowers```. For a given ```person```, we find all the flowers that started blooming before ```person``` arrives. We push the end time of these flowers onto a heap. We can then remove all the flowers that finished blooming by popping from the heap, since a min heap efficiently gives us the minimum (earliest) times.
> 
> As we sort both input arrays, flowers that we pop from heap will never be seen again by future people.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}(n \cdot \log{}n + m \cdot (\log{}n + \log{}m))$
- __Space Complexity__: $\mathcal{O}(n + m)$

```Python
class Solution:
    def fullBloomFlowers(self, flowers: List[List[int]], people: List[int]) -> List[int]:
        flowers.sort()
        sorted_people = sorted(people)
        memo = collections.defaultdict(int)
        h = list()

        i = 0
        for person in sorted_people:
            while i < len(flowers) and flowers[i][0] <= person:
                heapq.heappush(h, flowers[i][1])
                i += 1

            while h and h[0] < person:
                heapq.heappop(h)
            
            memo[person] = len(h)
        
        return [memo[person] for person in people]
```

### Difference Array + Binary Search

There is a technique called difference array that can be used to solve many "range" based problems. The technique involves creating an array ```difference``` and iterating over all ranges ```[start, end]```. We perform ```difference[start]++``` and ```difference[end + 1]--``` for each range.

The idea is that each index of ```difference``` represents the change in the number of flowers we can see when we cross this index (not the actual number of flowers on this index), with each index representing a unit of time. Thus, we could take a ```prefix``` sum of this ```difference``` array to find how many flowers can be seen at any given time with ```prefix[time]```.

> This technique is also referred as "line sweep".

Unfortunately, if we look at the constraints, we find that values of ```start, end, people``` can be up to $10^9$. It would not be feasible to create an array with such a large size. Thus, we need to use a map structure instead. Like in the previous approach, we still want to process everything chronologically. We will use the following data structures:

- In Java, we will use ```TreeMap```.
- In C++, we will use ```std::map```.
- In Python, we will use ```sortedcontainers.SortedDict```.

    Note that if you were not allowed to use these structures in an interview, you could still implement this approach using a normal hash map. You would just need to sort the elements in the hash map by key values after you populated it.

Let's summarize the algorithm with an example:

![image](https://leetcode.com/problems/number-of-flowers-in-full-bloom/Figures/2251/1.png)

![image](https://leetcode.com/problems/number-of-flowers-in-full-bloom/Figures/2251/2.png)

![image](https://leetcode.com/problems/number-of-flowers-in-full-bloom/Figures/2251/3.png)

