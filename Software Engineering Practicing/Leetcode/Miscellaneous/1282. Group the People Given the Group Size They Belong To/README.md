## [1282. Group the People Given the Group Size They Belong To](https://leetcode.com/problems/group-the-people-given-the-group-size-they-belong-to)

```Tag```: ```Hash Map```

#### Difficulty: Medium

There are ```n``` people that are split into some unknown number of groups. Each person is labeled with a unique ID from ```0``` to ```n - 1```.

You are given an integer array ```groupSizes```, where ```groupSizes[i]``` is the size of the group that person ```i``` is in. For example, if ```groupSizes[1] = 3```, then person ```1``` must be in a group of size ```3```.

Return _a list of groups such that each person ```i``` is in a group of size ```groupSizes[i]```_.

Each person should appear in __exactly one group__, and every person must be in a group. If there are multiple answers, __return any of them__. It is guaranteed that there will be at least one valid solution for the given input.

![image](https://github.com/quananhle/Python/assets/35042430/d09ea538-2f54-447d-87f6-11daadbee2a6)

---

__Example 1:__
```
Input: groupSizes = [3,3,3,3,3,1,3]
Output: [[5],[0,1,2],[3,4,6]]
Explanation: 
The first group is [5]. The size is 1, and groupSizes[5] = 1.
The second group is [0,1,2]. The size is 3, and groupSizes[0] = groupSizes[1] = groupSizes[2] = 3.
The third group is [3,4,6]. The size is 3, and groupSizes[3] = groupSizes[4] = groupSizes[6] = 3.
Other possible solutions are [[2,1,6],[5],[0,4,3]] and [[5],[0,6,2],[4,3,1]].
```

__Example 2:__
```
Input: groupSizes = [2,1,3,3,3,2]
Output: [[1],[0,5],[2,3,4]]
```

__Constraints:__

- $groupSizes.length == n$
- 1 \le n \le 500$
- $1 \le groupSizes[i] \le n$

---

### Hash Map

```Python
class Solution:
    def groupThePeople(self, groupSizes: List[int]) -> List[List[int]]:
        memo = collections.defaultdict(list)
        
        for i, e in enumerate(groupSizes):
            memo[e].append(i)
        
        res = list()

        for key, val in memo.items():
            tmp = [None] * key

            for i in range(len(val)):
                if tmp[-1] is not None:
                    res.append(tmp)
                    tmp = [None] * key
                tmp[i % key] = val[i]

            res.append(tmp)

        return res
```
