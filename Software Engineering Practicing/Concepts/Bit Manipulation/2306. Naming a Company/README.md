## 2306. Naming a Company

```Tag```: ```Hash Map``` ```Bitwise Manipulations```

#### Difficulty: Hard

You are given an array of strings ```ideas``` that represents a list of names to be used in the process of naming a company. The process of naming a company is as follows:

Choose 2 __distinct__ names from ```ideas```, call them ```ideaA``` and ```ideaB```.

Swap the first letters of ```ideaA``` and ```ideaB``` with each other.

If both of the new names are not found in the original ```ideas```, then the name ```ideaA ideaB``` (the __concatenation__ of ```ideaA``` and ```ideaB```, separated by a space) is a valid company name.

Otherwise, it is not a valid name.

Return _the number of **distinct** valid names for the company_.

---

__Example 1:__
```
Input: ideas = ["coffee","donuts","time","toffee"]
Output: 6
Explanation: The following selections are valid:
- ("coffee", "donuts"): The company name created is "doffee conuts".
- ("donuts", "coffee"): The company name created is "conuts doffee".
- ("donuts", "time"): The company name created is "tonuts dime".
- ("donuts", "toffee"): The company name created is "tonuts doffee".
- ("time", "donuts"): The company name created is "dime tonuts".
- ("toffee", "donuts"): The company name created is "doffee tonuts".
Therefore, there are a total of 6 distinct company names.

The following are some examples of invalid selections:
- ("coffee", "time"): The name "toffee" formed after swapping already exists in the original array.
- ("time", "toffee"): Both names are still the same after swapping and exist in the original array.
- ("coffee", "toffee"): Both names formed after swapping already exist in the original array.
```

__Example 2:__
```
Input: ideas = ["lack","back"]
Output: 0
Explanation: There are no valid selections. Therefore, 0 is returned.
```

__Constraints:__

- 2 <= ```ideas.length``` <= 5 * 10<sup>4</sup>
- ```1 <= ideas[i].length <= 10```
- ```ideas[i]``` consists of lowercase English letters.
- All the strings in ```ideas``` are __unique__.

---

![image](https://leetcode.com/problems/naming-a-company/solutions/3081799/Figures/2306/2.png)

![image](https://leetcode.com/problems/naming-a-company/solutions/3081799/Figures/2306/4.png)

![image](https://leetcode.com/problems/naming-a-company/solutions/3081799/Figures/2306/5.png)

```Python
class Solution:
    def distinctNames(self, ideas: List[str]) -> int:
        count = 0
        cache = collections.defaultdict(set)
        for idea in ideas:
            cache[idea[0]].add(idea[1:])
            '''
            cache[ord(idea[0]) - ord('a')].add(idea[1:])
            '''

        for init1, suff1 in cache.items():
            for init2, suff2 in cache.items():
                if init1 == init2:
                    continue
                # Get the number of mutual suffixes
                '''
                intersections = 0

                for word in suff1:
                    if word in suff2:
                        intersections += 1
                '''
                intersections = len(suff1 & suff2)
                
                # Valid name are only from distinct suffixes in both groups
                count += (len(suff1) - intersections) * (len(suff2) - intersections)

        return count
```
