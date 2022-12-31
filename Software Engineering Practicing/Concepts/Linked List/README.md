# Linked List

## Singly Linked List

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/12/screen-shot-2018-04-12-at-152754.png)

### Operations

Unlike the array, we are not able to access a random element in a singly-linked list in constant time. If we want to get the ith element, we have to traverse from the head node one by one. It takes us ```O(N)``` time on average to ```visit an element by index```, where N is the length of the linked list.

For instance, in the example above, the head is the node 23. The only way to visit the 3rd node is to use the "next" field of the head node to get to the 2nd node (node 6); Then with the "next" field of node 6, we are able to visit the 3rd node.

## Doubly Linked List

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/17/screen-shot-2018-04-17-at-161130.png)
