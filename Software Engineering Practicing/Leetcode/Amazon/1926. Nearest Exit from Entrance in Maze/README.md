## 1926. Nearest Exit from Entrance in Maze

#### Difficulty: Medium

You are given an ```m x n``` matrix ```maze``` __(0-indexed)__ with empty cells (represented as ```'.'```) and walls (represented as ```'+'```). You are also given the ```entrance``` of the maze, where __entrance = [entrance<sub>row</sub>, entrance<sub>col</sub>]__ denotes the row and column of the cell you are initially standing at.,

In one step, you can move one cell __up__, __down__, __left__, or __right__. You cannot step into a cell with a wall, and you cannot step outside the maze. Your goal is to find the __nearest exit__ from the ```entrance```. An __exit__ is defined as an __empty cell__ that is at the __border__ of the ```maze```. The ```entrance``` __does not count__ as an __exit__.

Return the __number of steps__ in the _shortest path_ from the ```entrance``` to the nearest __exit__, or __-1__ if no such path exists.
