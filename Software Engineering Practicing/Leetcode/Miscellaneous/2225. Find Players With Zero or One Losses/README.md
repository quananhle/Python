## [2225. Find Players With Zero or One Losses](https://leetcode.com/problems/find-players-with-zero-or-one-losses)

#### Difficulty: Medium

You are given an integer array matches where __matches[i] = [winner<sub>i</sub>, loser<sub>i</sub>]__ indicates that the player winner<sub>i</sub> defeated player loser<sub>i</sub> in a match.

Return a list ```answer``` of size ```2``` where:

- ```answer[0]``` is a list of all players that have __not__ lost any matches.

- ```answer[1]``` is a list of all players that have lost exactly ```one``` match.

The values in the two lists should be returned in ```increasing``` order.

#### Note:

You should only consider the players that have played __at least one__ match.
The testcases will be generated such that __no__ two matches will have the __same__ outcome.

![image](https://github.com/quananhle/Python/assets/35042430/4e13219c-350d-402d-8dbd-a3a74d7ef7c0)

---

#### Example 1:
```
Input: matches = [[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]]
Output: [[1,2,10],[4,5,7,8]]
Explanation:
Players 1, 2, and 10 have not lost any matches.
Players 4, 5, 7, and 8 each have lost one match.
Players 3, 6, and 9 each have lost two matches.
Thus, answer[0] = [1,2,10] and answer[1] = [4,5,7,8].
```

#### Example 2:
```
Input: matches = [[2,3],[1,3],[5,4],[6,4]]
Output: [[1,2,5,6],[]]
Explanation:
Players 1, 2, 5, and 6 have not lost any matches.
Players 3 and 4 each have lost two matches.
Thus, answer[0] = [1,2,5,6] and answer[1] = [].
```

#### Constraints:

- $1 \le matches.length \le 10^5$
- $matches[i].length == 2$
- $1 \le winneri, loseri \le 10^5$
- $winner_i \neq loser_i$
- All ```matches[i]``` are unique.

---

### Hash Set

```Python
class Solution:
    def findWinners(self, matches: List[List[int]]) -> List[List[int]]:
        zero_loss, one_loss, more_loss = set(), set(), set() 
        for winner, loser in matches:
            if not winner in one_loss and not winner in more_loss:
                zero_loss.add(winner)

            if loser in zero_loss:
                zero_loss.remove(loser)
                one_loss.add(loser)
            elif loser in one_loss:
                one_loss.remove(loser)
                more_loss.add(loser)
            elif loser in more_loss:
                continue
            else:
                one_loss.add(loser)
            
        return [sorted(list(zero_loss)), sorted(list(one_loss))]
```

### Hash Map

```Python
class Solution(object):
    def findWinners(self, matches):
        """
        :type matches: List[List[int]]
        :rtype: List[List[int]]
        """
        winning = {}
        losing = {}
        for winner, loser in matches:
            if winner not in winning:
                winning[winner] = 1
            else:
                winning[winner] += 1
            if loser not in losing:
                losing[loser] = 1
            else:
                losing[loser] += 1
        zero_loss = [player for player in winning if player not in losing]
        one_loss = [player for player in losing if losing[player] == 1]
        return [sorted(zero_loss),sorted(one_loss)]
```

#### Complexity Analysis

Let ```n``` be the size of the input array ```matches```.

- Time complexity: O(n⋅logn)

    - The iteration over ```matches``` takes O(n) time.
    - We need to store two kinds of players in two lists and sort them. In the worst-case scenario, there may be O(n) players in these lists, thus it requires O(n⋅logn) time.
    - To sum up, the time complexity is O(n⋅logn).

- Space complexity: O(n)

    - We use three hash sets to store all the players, there are at most O(n) players.

### Collections Counter

```Python
class Solution(object):
    def findWinners(self, matches):
        """
        :type matches: List[List[int]]
        :rtype: List[List[int]]
        """
        players = set(chain(*matches))
        '''
        players = set()
        for winner, loser in matches:
            player.add(winner)
            player.add(loser)
        '''
        losses = collections.Counter([loser for _, loser in matches])
        '''
        losses = []
        for _, loser in matches:
            losses.append(loser)
        counter = dict()
        for loss in losses:
            if loss not in counter:
                counter[loss] = 1
            else:
                counter[loss] += 1
        '''
        zero = [player for player in players if player not in losses]
        '''
        zero = []
        for player in players:
            if player not in losses:
                zero.append(player)
        '''
        one =  [player for player in players if losses[player] == 1]
        '''
        one = []
        for player in players:
            if losses[player] == 1:
                one.append(player)
        '''
        return [sorted(zero), sorted(one)]
        """
```

### Counting with List

#### Algorithm

1. Use an array ```losses_count``` to store the number of losses for each player. Initially, ```losses_count[i] = -1``` for every index ```i```.
2. For each match ```[winner, loser]```:
- If ```losses_count[loser] = -1```, set it to 1, otherwise increment it by 1.
- If ```losses_count[winner] = -1```, set it to 0.
3. Iterate over ```losses_count``` and use two arrays to store these 2 kinds of players, for each index ```i```:
- If ```losses_count[i] = 0```, add this player to the first array.
- If ```losses_count[i] = 1```, add this player to the second array.

```Python
class Solution(object):
    def findWinners(self, matches):
        """
        :type matches: List[List[int]]
        :rtype: List[List[int]]
        """
        # Time complexity: O(N + k),
        # Space complexity: O(k)
        losses_count = [-1] * 100001
        for winner, loser in matches:
            if losses_count[winner] == -1:
                losses_count[winner] = 0
            if losses_count[loser] == -1:
                losses_count[loser] = 1
            else:
                losses_count[loser] += 1
        answer = [[], []]
        for i in range(100001):
            if losses_count[i] == 0:
                answer[0].append(i)
            elif losses_count[i] == 1:
                answer[1].append(i)
        return answer      
```

#### Complexity Analysis
Let ```n``` be the size of the input array matches, and ```k``` be the range of values in winner or loser.

- Time complexity: O(n + k)

    - For each match, we need to update two values in the array ```losses_count``` which takes constant time. Thus the iteration requires O(n) time.
    - We need to iterate over ```losses_count``` to collect two kinds of players, which takes O(k) time.
    - Since we iterate over players from low to high, we don't need to sort them anymore.
    - To sum up, the overall time complexity is O(n + k).
    
- Space complexity: O(k)

    - We need to create an array of size O(k) to cover all players. Thus the overall space complexity is O(k).
