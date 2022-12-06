## 451. Sort Characters By Frequency




### HashMap and Sort

![image](https://leetcode.com/problems/sort-characters-by-frequency/Figures/451/hashmap.png)

![image](https://leetcode.com/problems/sort-characters-by-frequency/Figures/451/hashmap_sorted.png)

```Python
class Solution(object):
    def frequencySort(self, s):
        """
        :type s: str
        :rtype: str
        """
        # One Liner
        """
        return "".join([k*v for k,v in sorted(collections.Counter(s).items() , key=lambda item: item[1], reverse=True)])
        """
        # Hash Map and Sort
        #### Time Complexity: O(NlogN), traverse through the length of input s. Sort operation takes O(klogk)
        #### Space Complexity: O(N), constant space required for HashMap to store 26 characters, but output may keep up to the size of input s
        res = list()
        freq = dict()
        for c in s:
            if c not in freq:
                freq[c] = 1
            else:
                freq[c] += 1
        freq = sorted(freq.items() , key=lambda item: item[1], reverse=True)
        for k,v in freq:
            res.append(k*v)
        return "".join(res)
```
```Python
class Solution(object):
    def frequencySort(self, s):
        """
        :type s: str
        :rtype: str
        """
        # Collections Counter
        #### Time Complexity: O(NlogN), traverse through the length of input s. Sort operation takes O(klogk)
        #### Space Complexity: O(N), constant space required for HashMap to store 26 characters, but output may keep up to the size of input s     
        ans = ""
        counter = collections.Counter(s)
        for letter, freq in counter.most_common():
            ans += letter*freq
        return ans
```

### Multiset and Bucket Sort

