## Overview of Depth-First Search Algorithm

Previously, we learned how to check the connectivity between two vertices with the “disjoint set” data structure. Now, let's switch gears and consider: Given a graph, how can we find all of its vertices, and how can we find all paths between two vertices?

The depth-first search algorithm is ideal in solving these kinds of problems because it can explore all paths from the start vertex to all other vertices. Let's start by considering an example. In Figure 7, there are five vertices ```[A, C, D, B, E]```. Given two vertices ```A``` and ```B```, there are two paths between them. One path is ```[A, C, D, B]```, and the other is ```[A, E, B]```.

![image](https://leetcode.com/explore/learn/card/Figures/Graph_Explore/An_Undirected_Graph.png)
Figure 7. An undirected graph

In Graph theory, the depth-first search algorithm (abbreviated as DFS) is mainly used to:

- Traverse all vertices in a “graph”;
- Traverse all paths between any two vertices in a “graph”.

### Traversing all Vertices

#### Time Complexity : ```O(V + E)```. Here, ```V``` represents the number of vertices, and ```E``` represents the number of edges
#### Space Complexity: ```O(V)```, either the manually created stack or the recursive call stack can store up to ```V``` vertices.

### Traversing all paths between two vertices

#### Time Complexity : ```O((V - 1)!)```, the worst-case scenario, when trying to find all paths, is a complete graph. A complete graph is a graph where every vertex is connected to every other vertex
#### Space Complexity: O(V<sup>3</sup>)
