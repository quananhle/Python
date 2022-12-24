## 841. Keys and Rooms

```Tag```: ```Depth-First Search``` ```Breadth-First Search``` ```Graph```

#### Difficulty: Medium

There are ```n``` rooms labeled from ```0``` to ```n - 1``` and all the rooms are locked except for room ```0```. Your goal is to visit all the rooms. However, you cannot enter a locked room without having its key.

When you visit a room, you may find a set of distinct keys in it. Each key has a number on it, denoting which room it unlocks, and you can take all of them with you to unlock the other rooms.

Given an array ```rooms``` where ```rooms[i]``` is the set of keys that you can obtain if you visited room ```i```, return ```true``` if you can visit all the rooms, or ```false``` otherwise.

![image](https://user-images.githubusercontent.com/35042430/209421209-ae030815-91f3-4c4a-9155-cdfa715c0679.png)

---

__Example 1:__
```
Input: rooms = [[1],[2],[3],[]]
Output: true
Explanation: 
We visit room 0 and pick up key 1.
We then visit room 1 and pick up key 2.
We then visit room 2 and pick up key 3.
We then visit room 3.
Since we were able to visit every room, we return true.
```

__Example 2:__
```
Input: rooms = [[1,3],[3,0,1],[2],[0]]
Output: false
Explanation: We can not enter room number 2 since the only key that unlocks it is in that room.
```

__Constraints:__
```
n == rooms.length
2 <= n <= 1000
0 <= rooms[i].length <= 1000
1 <= sum(rooms[i].length) <= 3000
0 <= rooms[i][j] < n
All the values of rooms[i] are unique.
```

---

```Python
class Solution:
    def canVisitAllRooms(self, rooms: List[List[int]]) -> bool:
        # Depth-First Search
        '''
        visited = set()
        
        def dfs(room):
            if not room in visited:
                visited.add(room)
                for key in rooms[room]:
                    dfs(key)

        dfs(0)
        return len(visited) == len(rooms)
        '''
        '''
        stack = [0]
        visited = [0] * len(rooms)
        visited[0] = True

        while stack:
            room = stack.pop()
            for key in rooms[room]:
                if not visited[key]:
                    visited[key] = True
                    stack.append(key)
        
        return all(visited)
        '''     
```
