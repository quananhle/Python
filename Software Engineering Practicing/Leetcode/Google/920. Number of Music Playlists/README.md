## [920. Number of Music Playlists](https://leetcode.com/problems/number-of-music-playlists)

```Tag```: ```Dynamic Programming``` ```Math```

#### Difficulty: Hard

Your music player contains ```n``` different songs. You want to listen to ```goal``` songs (not necessarily different) during your trip. To avoid boredom, you will create a playlist so that:

- Every song is played at least once.
- A song can only be played again only if ```k``` other songs have been played.

Given ```n```, ```goal```, and ```k```, return _the number of possible playlists that you can create_. Since the answer can be very large, return it modulo $10^{9} + 7$.

![image](https://github.com/quananhle/Python/assets/35042430/698a925c-3072-4b75-9e65-2e06571051d4)

---

__Example 1:__
```
Input: n = 3, goal = 3, k = 1
Output: 6
Explanation: There are 6 possible playlists: [1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], and [3, 2, 1].
```

__Example 2:__
```
Input: n = 2, goal = 3, k = 0
Output: 6
Explanation: There are 6 possible playlists: [1, 1, 2], [1, 2, 1], [2, 1, 1], [2, 2, 1], [2, 1, 2], and [1, 2, 2].
```

__Example 3:__
```
Input: n = 2, goal = 3, k = 1
Output: 2
Explanation: There are 2 possible playlists: [1, 2, 1] and [2, 1, 2].
```

__Constraints:__

- $0 \le k < n \le goal \le 100$

---

### The Framework

#### Top-Down Dynamic Programming

```Python

```

```Python

```
