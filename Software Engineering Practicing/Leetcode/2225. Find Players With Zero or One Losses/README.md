## 2225. Find Players With Zero or One Losses

#### Difficulty: Medium

You are given an integer array matches where __matches[i] = [winner<sub>i</sub>, loser<sub>i</sub>]__ indicates that the player winner<sub>i</sub> defeated player loser<sub>i</sub> in a match.

Return a list ```answer``` of size ```2``` where:

- ```answer[0]``` is a list of all players that have __not__ lost any matches.

- ```answer[1]``` is a list of all players that have lost exactly ```one``` match.

The values in the two lists should be returned in ```increasing``` order.

#### Note:

You should only consider the players that have played __at least one__ match.
The testcases will be generated such that __no__ two matches will have the __same__ outcome.

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
```
1 <= matches.length <= 105
matches[i].length == 2
1 <= winneri, loseri <= 105
winneri != loseri
All matches[i] are unique.
```

---

#### Hash Set

```{Python}
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

#### Collections Counter

```{Python}
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

#### Counting with List

```{Python}
class Solution(object):
    def findWinners(self, matches):
        """
        :type matches: List[List[int]]
        :rtype: List[List[int]]
        """
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
