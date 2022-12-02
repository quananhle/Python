## 1657. Determine if Two Strings Are Close

#### Difficulty: Medium

Two strings are considered __close__ if you can attain one from the other using the following operations:

- Operation 1: Swap any two __existing__ characters.
  - For example, ```abcde -> aecdb```

- Operation 2: Transform __every__ occurrence of one __existing__ character into another __existing__ character, and do the same with the other character.
  - For example, ```aacabb -> bbcbaa``` (all ```a```'s turn into ```b```'s, and all ```b```'s turn into ```a```'s)

You can use the operations on either string as many times as necessary.

Given two strings, ```word1``` and ```word2```, return ```true``` if ```word1``` and ```word2``` are close, and ```false``` otherwise.
