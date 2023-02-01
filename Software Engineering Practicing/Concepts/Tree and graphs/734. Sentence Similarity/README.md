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
