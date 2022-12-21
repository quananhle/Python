# Queue & Stack

## Queue First-in-first-out Data Structure

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/05/03/screen-shot-2018-05-03-at-151021.png)

### Queue and BFS

Two main scenarios of using ```BFS```: ```do traversal``` or ```find the shortest path```.

#### Template I

```Python
graph = {
  '5' : ['3','7'],
  '3' : ['2', '4'],
  '7' : ['8'],
  '2' : [],
  '4' : ['8'],
  '8' : []
}

visited = [] # List for visited nodes.
queue = []     #Initialize a queue

def bfs(visited, graph, node): 
  visited.append(node)
  queue.append(node)

  while queue:
    m = queue.pop(0) 
    print (m, end = " ") 

    for neighbour in graph[m]:
      if neighbour not in visited:
        visited.append(neighbour)
        queue.append(neighbour)

# Driver Code
print("Following is the Breadth-First Search")
bfs(visited, graph, '5')
```

## Stack Last-in-first-out Data Structure

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/06/03/screen-shot-2018-06-02-at-203523.png)
