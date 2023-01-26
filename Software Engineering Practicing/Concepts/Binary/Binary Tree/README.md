# Binary Tree

## Traverse a Tree

```
Pre-order Traversal
In-order Traversal
Post-order Traversal
Recursive or Iterative
```

### Pre-order Traversal

```Pre-order traversal``` is to visit the root first. Then traverse the left subtree. Finally, traverse the right subtree. Here is an example:

![image](https://user-images.githubusercontent.com/35042430/214708266-0cfdb919-f1d5-48da-9f49-110b8670bde5.png)

### In-order Traversal

```In-order traversal``` is to traverse the left subtree first. Then visit the root. Finally, traverse the right subtree.

![image](https://user-images.githubusercontent.com/35042430/214708513-2fc38c2b-2a16-4891-b6fb-f434cb9e0390.png)

### Post-order Traversal

```Post-order traversal``` is to traverse the left subtree first. Then traverse the right subtree. Finally, visit the root.

(![image](https://user-images.githubusercontent.com/35042430/214708794-f7ead713-761c-4823-807b-0c6435a59802.png)

---

## Level-order Traversal

### Breadth-First Search

![image](https://user-images.githubusercontent.com/35042430/214757160-bb9d1eae-769a-4c18-934c-6a1607c232ef.png)

---

## Solve Tree Problems Recursively

### "Top-down" Solution

"Top-down" means that in each recursive call, we will visit the node first to come up with some values, and pass these values to its children when calling the function recursively. So the "top-down" solution can be considered as a kind of ```preorder traversal```. To be specific, the recursive function ```top_down(root, params)``` works like this:

```
1. return specific value for null node
2. update the answer if needed                      // answer <-- params
3. left_ans = top_down(root.left, left_params)      // left_params <-- root.val, params
4. right_ans = top_down(root.right, right_params)   // right_params <-- root.val, params
5. return the answer if needed                      // answer <-- left_ans, right_ans
```

For instance, consider this problem: given a binary tree, find its maximum depth.

Here we will define the depth of the root node as 1 (although often, the depth of the root node is defined as 0). For each node, if we know its depth, we will know the depth of its children. Therefore, if we pass the depth of the node as a parameter when calling the function recursively, all the nodes will know their depth. And for leaf nodes, we can use the depth to update the final answer. Here is the pseudocode for the recursive function ```maximum_depth(root, depth)```:

```
1. return if root is null
2. if root is a leaf node:
3.     answer = max(answer, depth)         // update the answer if needed
4. maximum_depth(root.left, depth + 1)     // call the function recursively for left child
5. maximum_depth(root.right, depth + 1)    // call the function recursively for right child
```

---
