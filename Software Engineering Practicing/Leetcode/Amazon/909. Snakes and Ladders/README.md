## 909. Snakes and Ladders

```Tag```: ```Depth-First Search``` ```Breadth-First Seaarch```

#### Difficulty: Medium

You are given an ```n x n``` integer matrix ```board``` where the cells are labeled from ```1``` to n<sup>2</sup> in a __Boustrophedon__ style starting from the bottom left of the board (i.e. ```board[n - 1][0]```) and alternating direction each row.

You start on square ```1``` of the board. In each move, starting from square ```curr```, do the following:

- Choose a destination square ```next``` with a label in the range ```[curr + 1, min(curr + 6, n^2)]```.
    - This choice simulates the result of a __standard 6-sided die roll__: i.e., there are always at most 6 destinations, regardless of the size of the board.

- If ```next``` has a snake or ladder, you must move to the destination of that snake or ladder. Otherwise, you move to ```next```.
- The game ends when you reach the square ```n^2```.

A board square on row ```r``` and column ```c``` has a snake or ladder if ```board[r][c] != -1```. The destination of that snake or ladder is ```board[r][c]```. Squares ```1``` and ```n^2``` do not have a snake or ladder.

Note that you only take a snake or ladder at most once per move. If the destination to a snake or ladder is the start of another snake or ladder, you do not follow the subsequent snake or ladder.

- For example, suppose the board is ```[[-1,4],[-1,3]]```, and on the first move, your destination square is ```2```. You follow the ladder to square ```3```, but do not follow the subsequent ladder to ```4```.

Return _the least number of moves required to reach the square n<sup>2</sup>_. If it is not possible to reach the square, return ```-1```.

![image](https://user-images.githubusercontent.com/35042430/214199552-c162dc1e-0626-4b4a-888b-28ec6fb91bfd.png)

---
