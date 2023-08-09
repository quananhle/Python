## [79. Word Search](https://leetcode.com/problems/word-search)

```Tag```: ```Backtracking``` ```Trie```

#### Difficulty: Medium

Given an ```m x n``` grid of characters ```board``` and a string ```word```, return ```true``` if ```word``` _exists in the grid_.

The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

<img width="814" alt="image" src="https://user-images.githubusercontent.com/35042430/203913679-73e0ca58-836b-45a4-9dd1-006d85b07ddf.png">

![image](https://github.com/quananhle/Python/assets/35042430/b7ae9069-e2aa-4870-913d-6d027e3540b1)

__Example 1:__

![image](https://assets.leetcode.com/uploads/2020/11/04/word2.jpg)

```
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
Output: true
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2020/11/04/word-1.jpg)
```
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
Output: true
```

__Example 3:__

![image](https://assets.leetcode.com/uploads/2020/10/15/word3.jpg)
```
Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
Output: false
```

__Constraints:__
```
    m == board.length
    n = board[i].length
    1 <= m, n <= 6
    1 <= word.length <= 15
    board and word consists of only lowercase and uppercase English letters.
```

---

### Backtracking

```Python
class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        ROWS, COLS = len(board), len(board[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]

        def backtrack(row, col, curr):
            # Base cases
            if not (0 <= row < ROWS and 0 <= col < COLS and board[row][col] != '$'):
                return False

            if curr == len(word) - 1:
                return True
                
            tmp = board[row][col]

            board[row][col] = '$'
            for new_row, new_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if 0 <= new_row < ROWS and 0 <= new_col < COLS and board[new_row][new_col] == word[curr + 1] and backtrack(new_row, new_col, curr + 1):
                    return True

            # Backtracking
            board[row][col] = tmp

            return False
        
        '''
        for row in range(ROWS):
            for col in range(COLS):
                if board[row][col] == word[0] and backtrack(row, col, 0): 
                    return True 
        return False
        '''
        return any(board[row][col] == word[0] and backtrack(row, col, 0) for row in range(ROWS) for col in range(COLS))
```

```Python
class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        ROWS, COLS = len(board), len(board[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        visited = set()

        def backtrack(row, col, curr):
            # Base cases
            if not (0 <= row < ROWS and 0 <= col < COLS and not (row, col) in visited):
                return False

            if curr == len(word) - 1:
                return True
                
            visited.add((row, col))
            for new_row, new_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                if 0 <= new_row < ROWS and 0 <= new_col < COLS and board[new_row][new_col] == word[curr + 1] and backtrack(new_row, new_col, curr + 1):
                    return True

            visited.remove((row, col))

            return False
        
        return any(board[row][col] == word[0] and backtrack(row, col, 0) for row in range(ROWS) for col in range(COLS))
```

### Trie

```Python
class Trie:
    def __init__(self) -> None:
        self.root = {}
    
    def insert(self, word: str) -> None:
        node = self.root
        
        for char in word:
            if not char in node:
                node[char] = {}
            node = node[char]

        node["*"] = True

class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        ROWS, COLS = len(board), len(board[0])
        DIRECTIONS = [(1,0), (0,1), (-1,0), (0,-1)]
        visited = set()

        trie = Trie()
        trie.insert(word)

        def backtrack(row: int, col: int, trie: Trie) -> bool:
            if (row, col) in visited:
                return False

            char = board[row][col]
            
            if char in trie:
                trie = trie[char]
                visited.add((row, col))
                
                if "*" in trie:
                    return True
                
                for new_row, new_col in [(row + dx, col + dy) for dx, dy in DIRECTIONS]:
                    if 0 <= new_row < ROWS and 0 <= new_col < COLS and backtrack(new_row, new_col, trie):
                        return True
                
                visited.remove((row, col))

            return False

        return any(board[row][col] == word[0] and backtrack(row, col, trie.root) for row in range(ROWS) for col in range(COLS))
```
