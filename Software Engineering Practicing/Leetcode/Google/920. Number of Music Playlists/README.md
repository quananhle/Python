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
class Solution:
    def numMusicPlaylists(self, n: int, goal: int, k: int) -> int:
        MOD = 10**9 + 7
        memo = collections.defaultdict(int)

        def dp(curr, remaining):
            # Base cases
            if curr == 0 and remaining == 0:
                return 1
            if curr == 0 or remaining == 0:
                return 0
            
            if (curr, remaining) in memo:
                return memo[(curr, remaining)]

            # DP transition: add a new song or replay an old song

            # Add a new song: less one song to play, less 1 song in goal, all times the rest of the total song in player
            ans = dp(curr - 1, remaining - 1) * (n - curr + 1) % MOD

            # Replay an old song: songs to play remain same, less 1 song in goal, all times the song less the k already played songs
            if curr > k:
                ans += dp(curr, remaining - 1) * (curr - k) % MOD
                ans %= MOD
            
            memo[(curr, remaining)] = ans
            return ans
        
        return dp(n, goal)
```

```Python
class Solution:
    def numMusicPlaylists(self, n: int, goal: int, k: int) -> int:
        MOD = 10**9 + 7

        @lru_cache(maxsize=None)
        def dp(i, j):
            # Base cases
            if i == 0 and j == 0:
                return 1
            if i == 0 or j == 0:
                return 0
            
            # DP transition: add a new song or replay an old one
            # Add a new song
            ans = dp(i - 1, j - 1) * (n - j + 1) % MOD
            # Replay the old song
            if j > k:
                ans += dp(i - 1, j) * (j - k) % MOD
                ans %= MOD
            
            return ans
        
        return dp(goal, n)
```
