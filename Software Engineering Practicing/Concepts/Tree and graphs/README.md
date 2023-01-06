# Graph

## Introduction

```Graph``` is probably the data structure that has the closest resemblance to our daily life. There are many types of graphs describing the relationships in real life. For instance, our friend circle is a huge “graph”.

![image](https://assets.leetcode.com/static_assets/explore/The_basic_of_graph_1.png)

In Figure 1 above, we can see that person G, B, and E are all direct friends of A, while person C, D, and F are indirect friends of A. This example is a social graph of friendship. So, what is the “graph” data structure?

### Types of "graphs"

There are many types of “graphs”. Three types of graphs are: ```undirected graphs```, ```directed graphs```, and ```weighted graphs```.

### Undirected graphs

The edges between any two vertices in an “undirected graph” do not have a direction, indicating a two-way relationship.

Figure 1 is an example of an undirected graph.

### Directed graphs

The edges between any two vertices in a “directed graph” graph are directional.

![image](https://assets.leetcode.com/static_assets/explore/The_basic_of_graph_2.png)
Figure 2 is an example of a directed graph.

### Weighted graphs

Each edge in a “weighted graph” has an associated weight. The weight can be of any metric, such as time, distance, size, etc. The most commonly seen “weighted map” in our daily life might be a city map. In Figure 3, each edge is marked with the distance, which can be regarded as the weight of that edge.

![image](https://assets.leetcode.com/static_assets/explore/The_basic_of_graph_3.png)
