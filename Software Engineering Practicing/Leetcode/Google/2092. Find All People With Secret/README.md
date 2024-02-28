## [2092. Find All People With Secret](https://leetcode.com/problems/find-all-people-with-secret)

```Tag```: ```Graph``` ```Breadth-First Search``` ```Union-Find```

#### Difficulty: Hard

You are given an integer ```n``` indicating there are ```n``` people numbered from ```0``` to ```n - 1```. You are also given a __0-indexed__ 2D integer array meetings where $meetings[i] = [x_i, y_i, time_i]$ indicates that person $x_i$ and person $y_i$ have a meeting at $time_i$. A person may attend multiple meetings at the same time. Finally, you are given an integer ```firstPerson```.

Person ```0``` has a secret and initially shares the secret with a person ```firstPerson``` at time ```0```. This secret is then shared every time a meeting takes place with a person that has the secret. More formally, for every meeting, if a person $x_i$ has the secret at $time_i$, then they will share the secret with person $y_i$, and vice versa.

The secrets are shared instantaneously. That is, a person may receive the secret and share it with people in other meetings within the same time frame.

Return _a list of all the people that have the secret after all the meetings have taken place_. You may return the answer in any order.

![image](https://github.com/quananhle/Python/assets/35042430/12684dbb-d47e-430b-99e0-424563715c58)

---

__Example 1:__
```
Input: n = 6, meetings = [[1,2,5],[2,3,8],[1,5,10]], firstPerson = 1
Output: [0,1,2,3,5]
Explanation:
At time 0, person 0 shares the secret with person 1.
At time 5, person 1 shares the secret with person 2.
At time 8, person 2 shares the secret with person 3.
At time 10, person 1 shares the secret with person 5.​​​​
Thus, people 0, 1, 2, 3, and 5 know the secret after all the meetings.
```

__Example 2:__
```
Input: n = 4, meetings = [[3,1,3],[1,2,2],[0,3,3]], firstPerson = 3
Output: [0,1,3]
Explanation:
At time 0, person 0 shares the secret with person 3.
At time 2, neither person 1 nor person 2 know the secret.
At time 3, person 3 shares the secret with person 0 and person 1.
Thus, people 0, 1, and 3 know the secret after all the meetings.
```

__Example 3:__
```
Input: n = 5, meetings = [[3,4,2],[1,2,1],[2,3,1]], firstPerson = 1
Output: [0,1,2,3,4]
Explanation:
At time 0, person 0 shares the secret with person 1.
At time 1, person 1 shares the secret with person 2, and person 2 shares the secret with person 3.
Note that person 2 can share the secret at the same time as receiving it.
At time 2, person 3 shares the secret with person 4.
Thus, people 0, 1, 2, 3, and 4 know the secret after all the meetings.
```

__Constraints:__

- $2 \le n \le 10^5$
- $1 \le meetings.length \le 10^5$
- $meetings[i].length == 3$
- $0 \le x_i, y_i \le n - 1$
- $x_i \neq y_i$
- $1 \le time_i \le 10^5$
- $1 \le firstPerson \le n - 1$

---

### Breadth-First Search

__Algorithm__

1. Create a ```graph``` to store the information about ```meetings```. For every person, we store the meeting time and label of the person met. We can use ```HashMap``` to store the information. The key of ```HashMap``` will be ```person```, and the value will be a list of ```(person, time)``` pairs.
2. Create a queue ```queue``` to store the people whom we need to process. It will store ```(person, time of knowing the secret)```. Initially, we will add ```(0, 0)``` and ```(firstPerson, 0)``` to the queue since both of them know the secret at time ```t = 0```.
3. Create an earliest array of size ```n```. It will store the earliest time at which a person learned the secret as per the current state of knowledge. It will be initialized with ```INT.MAX``` for all the people indicating that no one knows the secret. However, for person ```0``` and ```firstPerson```, we will update the earliest array with ```0``` since they know the secret at time ```t = 0```.
4. Do the following while the ```queue``` is not empty:
    a. Deque the front of ```queue``` and store it in ```(curr_person, curr_time)```.
    b. Iterate over neighbors of ```person``` using the ```for``` loop. Let's say the neighbor is ```(next_person, next_time)```.
    - If $t \gt time$ and ```earliest[next_person] > next_time```, then update ```earliest[next_person] = next_time``` and add ```(next_person, next_time)``` to the queue.
    - We are adding ```(next_person, next_time)``` to the queue because we have updated ```earliest[nextPerson]``` and we need to process all the people whom ```next_person``` meets after time ```next_time```.
    - We are checking $next_time \gt curr_time$ because the ```next_person``` can know the secret only if he/she meets person after the time at which person learned the secret.
    - We are checking ```earliest[next_person] > next_time``` because we are interested in the earliest time at which ```next_person``` learned the secret. If $earliest[next_person] \lt next_time$, then we have already processed ```next_person``` at an earlier time, and we don't need to process it again.
5. Iterate over the ```earliest``` array and return indices of all the people who know the secret. They are identified by the fact that ```earliest[i] != INT.MAX```.

__Complexity Analysis__

- __Time Complexity__: $\mathcal{O}( M \cdot (M + N) )$
- __Space Complexity__: $\mathcal{O}(M + N)$

```Python
class Solution:
    def findAllPeople(self, n: int, meetings: List[List[int]], firstPerson: int) -> List[int]:
        graph = collections.defaultdict(list)

        for x, y, time in meetings:
            # A person xi has the secret at timei, then they will share the secret with person yi, and vice versa.
            graph[x].append((y, time))
            graph[y].append((x, time))
        
        earliest = [math.inf] * n
        earliest[0] = 0
        earliest[firstPerson] = 0

        queue = collections.deque()
        queue.append((0, 0))
        queue.append((firstPerson, 0))

        while queue:
            curr_person, curr_time = queue.popleft()
            for next_person, next_time in graph[curr_person]:
                if earliest[next_person] > next_time >= curr_time:
                    earliest[next_person] = next_time
                    queue.append((next_person, next_time))  

        return [i for i in range(n) if earliest[i] != math.inf]
```
