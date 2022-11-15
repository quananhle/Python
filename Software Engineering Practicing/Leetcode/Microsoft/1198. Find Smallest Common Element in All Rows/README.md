## 1198. Find Smallest Common Element in All Rows

#### Difficulty: Medium

Given an ```m x n``` matrix ```mat``` where every row is sorted in strictly __increasing__ order, return the __smallest common element__ in all rows.

If there is no common element, return ```-1```.

#### Example 1:
```
Input: mat = [[1,2,3,4,5],[2,4,5,8,10],[3,5,7,9,11],[1,3,5,7,9]]
Output: 5
```

#### Example 2:
```
Input: mat = [[1,2,3],[2,3,4],[2,3,5]]
Output: 2
```

#### Constraints:
```
m == mat.length
n == mat[i].length
1 <= m, n <= 500
1 <= mat[i][j] <= 104
mat[i] is sorted in strictly increasing order.
```

```{Python}
from collections import Counter
class Solution(object):
    def smallestCommonElement(self, mat):
        """
        :type mat: List[List[int]]
        :rtype: int
        """
        # Counter
        ## stricly increasing = sorted and unique elements
        #### Time complexity: O(NM), nested loops through rows and columns of mat to create a list
        #### Space complexity: O(N), space needed to create a list of elements in mat
        """
        mat_list = list()
        for i in range(len(mat)):
            for j in range(len(mat[i])):
                mat_list.append(mat[i][j])
        hash_set = dict()
        for n in mat_list:
            if n not in hash_set:
                hash_set[n] = 1
            else:
                hash_set[n] += 1
        for key, val in hash_set.items():
            if val == len(mat):
                return key
        return -1
        """
```
