## 599. Minimum Index Sum of Two Lists

```Tag```: ```Hash Map```

#### Difficulty: Easy

Given two arrays of strings ```list1``` and ```list2```, find the __common strings with the least index sum__.

A __common string__ is a string that appeared in both ```list1``` and ```list2```.

A __common string with the least index sum__ is a common string such that if it appeared at ```list1[i]``` and ```list2[j]``` then ```i + j``` should be the minimum value among all the other __common strings__.

Return _all the __common strings with the least index sum__. Return the answer in __any order___.

![image](https://user-images.githubusercontent.com/35042430/213369217-13a4cd96-4847-47f1-aef8-d345249d4fa1.png)

---

__Example 1:__
```
Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"]
Output: ["Shogun"]
Explanation: The only common string is "Shogun".
```

__Example 2:__
```
Input: list1 = ["Shogun","Tapioca Express","Burger King","KFC"], list2 = ["KFC","Shogun","Burger King"]
Output: ["Shogun"]
Explanation: The common string with the least index sum is "Shogun" with index sum = (0 + 1) = 1.
```

__Example 3:__
```
Input: list1 = ["happy","sad","good"], list2 = ["sad","happy","good"]
Output: ["sad","happy"]
Explanation: There are three common strings:
"happy" with index sum = (0 + 1) = 1.
"sad" with index sum = (1 + 0) = 1.
"good" with index sum = (2 + 2) = 4.
The strings with the least index sum are "sad" and "happy".
```

__Constraints:__
```
1 <= list1.length, list2.length <= 1000
1 <= list1[i].length, list2[i].length <= 30
list1[i] and list2[i] consist of spaces ' ' and English letters.
All the strings of list1 are unique.
All the strings of list2 are unique.
```

---

### Hash Map

```Python
class Solution:
    def findRestaurant(self, list1: List[str], list2: List[str]) -> List[str]:
        idx_memo = collections.defaultdict(int)
        str_memo = collections.defaultdict(list)
        for idx, string in enumerate(list1):
            idx_memo[string] = idx
        for idx, string in enumerate(list2):
            if string in idx_memo:
                str_memo[idx + idx_memo[string]].append(string)
        return str_memo[min(str_memo.keys())]
```

