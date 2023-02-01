## 734. Sentence Similarity

```Tag```: ```Hash Map``` ```Hash Set``` ```Graph```

#### Difficulty: Easy

We can represent a sentence as an array of words, for example, the sentence ```"I am happy with leetcode"``` can be represented as ```arr = ["I","am",happy","with","leetcode"]```.

Given two sentences ```sentence1``` and ```sentence2``` each represented as a string array and given an array of string pairs ```similarPairs``` where ```similarPairs[i]``` = [xi, yi]``` indicates that the two words x<sub>i</sub> and y<sub>i</sub> are similar.

Return _```true``` if sentence1 and sentence2 are similar, or ```false``` if they are not similar_.

Two sentences are similar iff:

- They have the same length (i.e., the same number of words)
- ```sentence1[i]``` and ```sentence2[i]``` are similar.

Notice that a word is always similar to itself, also notice that the similarity relation is not transitive. For example, if the words ```a``` and ```b``` are similar, and the words ```b``` and ```c``` are similar, ```a``` and ```c``` are not necessarily similar.

![image](https://user-images.githubusercontent.com/35042430/216117203-80deee40-aaf0-4f5f-a718-b88a27449f81.png)

---

__Example 1:__
```
Input: sentence1 = ["great","acting","skills"], sentence2 = ["fine","drama","talent"], 
       similarPairs = [["great","fine"],["drama","acting"],["skills","talent"]]
Output: true
Explanation: The two sentences have the same length and each word i of sentence1 is 
             also similar to the corresponding word in sentence2.
```

__Example 2:__
```
Input: sentence1 = ["great"], sentence2 = ["great"], similarPairs = []
Output: true
Explanation: A word is similar to itself.
```

__Example 3:__
```
Input: sentence1 = ["great"], sentence2 = ["doubleplus","good"], 
       similarPairs = [["great","doubleplus"]]
Output: false
Explanation: As they don't have the same length, we return false.
```

__Constraints:__

- ```1 <= sentence1.length, sentence2.length <= 1000```
- ```1 <= sentence1[i].length, sentence2[i].length <= 20```
- ```sentence1[i]``` and ```sentence2[i]``` consist of English letters.
- ```0 <= similarPairs.length <= 1000```
- ```similarPairs[i].length == 2```
- ```1 <= xi.length, yi.length <= 20```
- x<sub>i</sub> and y<sub>i</sub> consist of lower-case and upper-case English letters.
- All the pairs (x<sub>i</sub>, y<sub>i</sub>) are distinct.

---

### Adjacency Graph

```Python
class Solution:
    def areSentencesSimilar(self, sentence1: List[str], sentence2: List[str], similarPairs: List[List[str]]) -> bool:        
        if len(sentence1) != len(sentence2):
            return False
        # Build the adjacency graph of set of similar pairs
        graph = collections.defaultdict(set)
        for x, y in similarPairs:
            graph[x].add(y)
            graph[y].add(x)
        for i in range(len(sentence1)):
            '''
            Check 2 scenarios:
            - sentence1[i] and sentence2[i] are the same
            - sentence1[i] and sentence2[i] are in the same pair of similarPairs
            '''
            if sentence1[i] == sentence2[i] or sentence2[i] in graph[sentence1[i]] or sentence1[i] in graph[sentence2[i]]:
                continue
            return False
        return True
```
