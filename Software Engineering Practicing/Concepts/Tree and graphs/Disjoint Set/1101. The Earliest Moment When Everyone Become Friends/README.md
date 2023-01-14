## 1101. The Earliest Moment When Everyone Become Friends

```Tag```: ```Union-Find```

#### Difficulty: Medium

There are ```n``` people in a social group labeled from ```0``` to ```n - 1```. You are given an array ```logs``` where ```logs[i]``` = [timestamp<sub>i</sub>, x<sub>i</sub>, y<sub>i</sub>] indicates that x<sub>i</sub> and y<sub>i</sub> will be friends at the time timestamp<sub>i</sub>.

Friendship is __symmetric__. That means if ```a``` is friends with ```b```, then ```b``` is friends with ```a```. Also, person ```a``` is acquainted with a person ```b``` if ```a``` is friends with ```b```, or ```a``` is a friend of someone acquainted with ```b```.

Return _the earliest time for which every person became acquainted with every other person_. If there is no such earliest time, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/211407250-7411e922-e83d-4741-a690-876b69eedafd.png)

---

__Example 1:__
```
Input: logs = [[20190101,0,1],[20190104,3,4],[20190107,2,3],[20190211,1,5],[20190224,2,4],[20190301,0,3],[20190312,1,2],[20190322,4,5]], n = 6
Output: 20190301
Explanation: 
The first event occurs at timestamp = 20190101, and after 0 and 1 become friends, we have the following friendship groups [0,1], [2], [3], [4], [5].
The second event occurs at timestamp = 20190104, and after 3 and 4 become friends, we have the following friendship groups [0,1], [2], [3,4], [5].
The third event occurs at timestamp = 20190107, and after 2 and 3 become friends, we have the following friendship groups [0,1], [2,3,4], [5].
The fourth event occurs at timestamp = 20190211, and after 1 and 5 become friends, we have the following friendship groups [0,1,5], [2,3,4].
The fifth event occurs at timestamp = 20190224, and as 2 and 4 are already friends, nothing happens.
The sixth event occurs at timestamp = 20190301, and after 0 and 3 become friends, we all become friends.
```

__Example 2:__
```
Input: logs = [[0,2,0],[1,0,1],[3,0,3],[4,1,2],[7,3,1]], n = 4
Output: 3
Explanation: At timestamp = 3, all the persons (i.e., 0, 1, 2, and 3) become friends.
```

__Constraints:__
```
2 <= n <= 100
1 <= logs.length <= 104
logs[i].length == 3
0 <= timestampi <= 109
0 <= xi, yi <= n - 1
xi != yi
All the values timestampi are unique.
All the pairs (xi, yi) occur at most one time in the input.
```

---

### Optimized “disjoint set” with Path Compression and Union by Rank

```Python
class UnionFind:
    def __init__(self, size):
        self.root = [i for i in range(size)]
        self.rank = [1] * size
        self.count = size
    
    def find(self, x):
        # Check if the node is the root node of itself
        if x == self.root[x]:
            return x
        else:
            # Otherwise, keep looking for the root node
            self.root[x] = self.find(self.root[x])
            return self.root[x]

    def union(self, x, y):
        # Find the root node of x and y
        root_x = self.find(x)
        root_y = self.find(y)
        # Check if root of x is not the same root of y
        if root_x != root_y:
            # Merge the lower-rank group with the higher-rank group
            if self.rank[root_x] < self.rank[root_y]:
                self.root[root_x] = root_y
                self.rank[root_y] += self.rank[root_x]
            else:
                self.root[root_y] = root_x
                self.rank[root_x] += self.rank[root_y]
            # After the merge, decrement the number of the group by 1
            self.count -= 1

    def get_count(self):
        return self.count

class Solution:
    def earliestAcq(self, logs: List[List[int]], n: int) -> int:
        if len(logs) < n - 1:
            return -1
        union_find = UnionFind(n)
        # Sort the timestamp
        logs.sort(key = lambda x: x[0])
        for time, x, y in logs:
            union_find.union(x, y)
            # Check if the group of all people reduced to 1 => every person became acquainted with every other person
            if union_find.get_count() == 1:
                return time
        # Otherwise, not every person is the acquaitance of each other
        return -1
        
        
        
```
