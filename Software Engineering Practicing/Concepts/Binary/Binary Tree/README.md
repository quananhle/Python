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

![image](https://user-images.githubusercontent.com/35042430/214708794-f7ead713-761c-4823-807b-0c6435a59802.png)

---

## Level-order Traversal

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/traversals.png)

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/dfs_bfs2.png)

### Breadth-First Search

![image](https://user-images.githubusercontent.com/35042430/214757160-bb9d1eae-769a-4c18-934c-6a1607c232ef.png)

```
Which approach to choose, BFS or DFS?
```

The problem is to return a list of last elements from all levels, so it's the way more natural to implement BFS here.

Time complexity is the same ```O(N)``` both for DFS and BFS since one has to visit all nodes.

Space complexity is ```O(H)``` for DFS and ```O(D)``` for BFS, where ```H``` is a tree height, and ```D``` is a tree diameter. They both result in ```O(N)``` space in the worst-case scenarios: skewed tree for DFS and complete tree for BFS.

BFS wins for this problem, so let's use the opportunity to check out three different BFS implementations with the queue.

__BFS implementation:__

All three implementations use the queue in a standard BFS way:

- Push the root into the queue.
- Pop-out a node from the _left_.
- Push the _left_ child into the queue, and then push the _right_ child.

![image](https://leetcode.com/problems/binary-tree-right-side-view/Figures/199_rewrite/implem2.png)

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

```Java
private int answer; // don't forget to initialize answer before call maximum_depth
private void maximum_depth(TreeNode root, int depth) {
    if (root == null) {
        return;
    }
    if (root.left == null && root.right == null) {
        answer = Math.max(answer, depth);
    }
    maximum_depth(root.left, depth + 1);
    maximum_depth(root.right, depth + 1);
}
```

### "Bottom-up" Solution

"Bottom-up" is another recursive solution. In each recursive call, we will firstly call the function recursively for all the children nodes and then come up with the answer according to the returned values and the value of the current node itself. This process can be regarded as a kind of ```postorder traversal```. Typically, a "bottom-up" recursive function ```bottom_up(root)``` will be something like this:

```
1. return specific value for null node
2. left_ans = bottom_up(root.left)      // call function recursively for left child
3. right_ans = bottom_up(root.right)    // call function recursively for right child
4. return answers                       // answer <-- left_ans, right_ans, root.val
```

Here is the pseudocode for the recursive function ```maximum_depth(root)```:

```
1. return 0 if root is null                 // return 0 for null node
2. left_depth = maximum_depth(root.left)
3. right_depth = maximum_depth(root.right)
4. return max(left_depth, right_depth) + 1  // return depth of the subtree rooted at root
```

```Java
public int maximum_depth(TreeNode root) {
    if (root == null) {
        return 0;                                   // return 0 for null node
    }
    int left_depth = maximum_depth(root.left);
    int right_depth = maximum_depth(root.right);
    return Math.max(left_depth, right_depth) + 1;   // return depth of the subtree rooted at root
}
```

### Conclusion

When you meet a tree problem, ask yourself two questions: 

- Can you determine some parameters to help the node know its answer? 
- Can you use these parameters and the value of the node itself to determine what should be the parameters passed to its children? 

If the answers are both yes, try to solve this problem using a ```"top-down" recursive solution```.

Or, you can think of the problem in this way: 

- For a node in a tree, if you know the answer of its children, can you calculate the answer of that node? 

If the answer is yes, solving the problem recursively using a ```bottom up``` approach might be a good idea.
