## Graph

### Depth-First Search v.s. ### Breadth-First Search

#### Solving a question using DFS

There are three things that you need to consider once you have identified that a question can be sovled using DFS

1. The base case ( return condition )
2. Mark that node as visited
3. Given that at current node, perform the needed operations

The below solution explains how the above methodology can be used to sovle any DFS solution

1. The base case :

The current node cannot

    a. Exit the matrix bounding condition
  
    b. DIfferent from the base color
  
    c. Be a node that we have already visited
  
```Java
if(sc < 0 || sc >= cl || sr < 0 || sr >= rl || image[sr][sc] != baseColor || visited[sr][sc]) {
    return;
}
```

Mark the node as visited 

```Java
visited[sr][sc] = true;
```

The operation that needs to perform at every node is to check tell all the nodes that are adjacent to the current node to check if they are the same color as the current node, and if yes change their color ( Now the recursion )

```Java
image[sr][sc] = newColor;
dfs(image, sr + 1, sc, newColor, baseColor, visited);
dfs(image, sr, sc + 1, newColor, baseColor, visited);
dfs(image, sr - 1, sc, newColor, baseColor, visited);
dfs(image, sr , sc - 1, newColor, baseColor, visited);
```

Complete solution

```Java
public static int[][] floodFill(int[][] image, int sr, int sc, int newColor) {
    boolean[][] visited =  new boolean[image.length][image[0].length];
    dfs(image, sr, sc, newColor, image[sr][sc], visited);
    return image;
}

public static void dfs(int[][] image, int sr, int sc, int newColor, int baseColor, boolean[][] visited) {
    int rl = image.length;
    int cl = image[0].length;

    // This is the base condition of return. 
    if(sc < 0 || sc >= cl || sr < 0 || sr >= rl || image[sr][sc] != baseColor || visited[sr][sc]) {
        return;
    }

    // Mark the node as visited. 
    visited[sr][sc] = true;

    // Change the value of the current node. Check every adjacent node 
    image[sr][sc] = newColor;
    dfs(image, sr + 1, sc, newColor, baseColor, visited);
    dfs(image, sr, sc + 1, newColor, baseColor, visited);
    dfs(image, sr - 1, sc, newColor, baseColor, visited);
    dfs(image, sr , sc - 1, newColor, baseColor, visited);
}
```
