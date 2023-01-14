## 1061. Lexicographically Smallest Equivalent String

```Tag```: ```Union-Find```

#### Difficulty: Medium

You are given two strings of the same length ```s1``` and ```s2``` and a string ```baseStr```.

We say ```s1[i]``` and ```s2[i]``` are equivalent characters.

For example, if ```s1 = "abc"``` and ```s2 = "cde"```, then we have ```'a' == 'c'```, ```'b' == 'd'```, and ```'c' == 'e'```

Equivalent characters follow the usual rules of any equivalence relation:

- Reflexivity: ```'a' == 'a'```.
- Symmetry: ```'a' == 'b'``` implies ```'b' == 'a'```.
- Transitivity: ```'a' == 'b'``` and ```'b' == 'c'``` implies ```'a' == 'c'```.

For example, given the equivalency information from ```s1 = "abc"``` and ```s2 = "cde"```, ```"acd"``` and ```"aab"``` are equivalent strings of ```baseStr = "eed"```, and ```"aab"``` is the lexicographically smallest equivalent string of ```baseStr```.

Return _the lexicographically smallest equivalent string of ```baseStr``` by using the equivalency information from ```s1``` and ```s2```_.

![image](https://user-images.githubusercontent.com/35042430/212457305-d8cfebe4-2492-4982-a181-ea37b57bfd7a.png)

---

