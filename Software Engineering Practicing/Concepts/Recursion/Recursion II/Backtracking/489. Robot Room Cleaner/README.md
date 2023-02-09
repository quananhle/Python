## 489. Robot Room Cleaner

```Tag```: ```Depth-First Search``` ```Backtracking```

#### Difficulty: Hard

You are controlling a robot that is located somewhere in a room. The room is modeled as an ```m x n``` binary grid where ```0``` represents a wall and ```1``` represents an empty slot.

The robot starts at an unknown location in the room that is guaranteed to be empty, and you do not have access to the grid, but you can move the robot using the given API ```Robot```.

You are tasked to use the robot to clean the entire room (i.e., clean every empty cell in the room). The robot with the four given APIs can move forward, turn left, or turn right. Each turn is ```90``` degrees.

When the robot tries to move into a wall cell, its bumper sensor detects the obstacle, and it stays on the current cell.

Design an algorithm to clean the entire room using the following APIs:

```
interface Robot {
  // returns true if next cell is open and robot moves into the cell.
  // returns false if next cell is obstacle and robot stays on the current cell.
  boolean move();

  // Robot will stay on the same cell after calling turnLeft/turnRight.
  // Each turn will be 90 degrees.
  void turnLeft();
  void turnRight();

  // Clean the current cell.
  void clean();
}
```

Note that the initial direction of the robot will be facing up. You can assume all four edges of the grid are all surrounded by a wall.

__Custom testing:__

The input is only given to initialize the room and the robot's position internally. You must solve this problem "blindfolded". In other words, you must control the robot using only the four mentioned APIs without knowing the room layout and the initial robot's position.

![image](https://user-images.githubusercontent.com/35042430/217732939-5072de1d-905d-4a65-be85-6bf233287a0b.png)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/07/17/lc-grid.jpg)
```
Input: room = [[1,1,1,1,1,0,1,1],[1,1,1,1,1,0,1,1],[1,0,1,1,1,1,1,1],[0,0,0,1,0,0,0,0],[1,1,1,1,1,1,1,1]], row = 1, col = 3
Output: Robot cleaned all rooms.
Explanation: All grids in the room are marked by either 0 or 1.
0 means the cell is blocked, while 1 means the cell is accessible.
The robot initially starts at the position of row=1, col=3.
From the top left corner, its position is one row below and three columns right.
```

__Example 2:__
```
Input: room = [[1]], row = 0, col = 0
Output: Robot cleaned all rooms.
```

__Constraints:__

- ```m == room.length```
- ```n == room[i].length```
- ```1 <= m <= 100```
- ```1 <= n <= 200```
- ```room[i][j]``` is either ```0``` or ```1```.
- ```0 <= row < m```
- ```0 <= col < n```
- ```room[row][col] == 1```
- All the empty cells can be visited from the starting position.

---

### Backtracking Depth-First Search

```Python
# """
# This is the robot's control interface.
# You should not implement it, or speculate about its implementation
# """
#class Robot:
#    def move(self):
#        """
#        Returns true if the cell in front is open and robot moves into the cell.
#        Returns false if the cell in front is blocked and robot stays in the current cell.
#        :rtype bool
#        """
#
#    def turnLeft(self):
#        """
#        Robot will stay in the same cell after calling turnLeft/turnRight.
#        Each turn will be 90 degrees.
#        :rtype void
#        """
#
#    def turnRight(self):
#        """
#        Robot will stay in the same cell after calling turnLeft/turnRight.
#        Each turn will be 90 degrees.
#        :rtype void
#        """
#
#    def clean(self):
#        """
#        Clean the current cell.
#        :rtype void
#        """

class Solution:
    def cleanRoom(self, robot):
        """
        :type robot: Robot
        :rtype: None
        """
        visited = set()

        def take_one_step_back():
            robot.turnLeft()
            robot.turnLeft()
            robot.move()
            robot.turnLeft()
            robot.turnLeft()

        def dfs(x, y, x_direction, y_direction):
            robot.clean()
            visited.add((x, y))

            for k in range(4):
                neighbor = (x + x_direction, y + y_direction)
                if not neighbor in visited and robot.move():
                    # Move on to the new cell and keep exploring from there
                    new_x, new_y = neighbor[0], neighbor[1]
                    dfs(new_x, new_y, x_direction, y_direction)

                    # Backtracking
                    take_one_step_back()

                # Make a turn clockwise/counter-clockwise after encountered a deadend and took a step back 
                robot.turnRight()
                '''
                robot.turnLeft()
                '''
                # Change the direction of the robot
                x_direction, y_direction = -y_direction, x_direction
            
        dfs(0, 0, 1, 0)
```
