# [Linked List](https://leetcode.com/explore/learn/card/linked-list/)

## Singly Linked List

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/12/screen-shot-2018-04-12-at-152754.png)

### Operations

Unlike the array, we are not able to access a random element in a singly-linked list in constant time. If we want to get the ith element, we have to traverse from the head node one by one. It takes us ```O(N)``` time on average to ```visit an element by index```, where N is the length of the linked list.

For instance, in the example above, the head is the node 23. The only way to visit the 3rd node is to use the "next" field of the head node to get to the 2nd node (node 6); Then with the "next" field of node 6, we are able to visit the 3rd node.

#### Add Operation - Singly Linked List

If we want to add a new value after a given node ```prev```, we should: 

1. Initialize a new node ```cur``` with the given value;

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/26/screen-shot-2018-04-25-at-163224.png)

2. Link the "next" field of ```cur``` to prev's next node ```next```;

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/26/screen-shot-2018-04-25-at-163234.png)

3. Link the "next" field in ```prev``` to ```cur```.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/26/screen-shot-2018-04-25-at-163243.png)

Unlike an array, we don’t need to move all elements past the inserted element. Therefore, you can insert a new node into a linked list in ```O(1)``` time complexity, which is very efficient.

#### Add a Node at the Beginning

As we know, we use the head node ```head``` to represent the whole list.

So it is essential to update ```head``` when adding a new node at the beginning of the list.

1. Initialize a new node ```cur```;
2. Link the new node to our original head node ```head```.
3. Assign ```cur``` to ```head```.

For example, let's add a new node 9 at the beginning of the list.

1. We initialize a new node 9 and link node 9 to current head node 23.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/19/screen-shot-2018-04-19-at-125118.png)

2. Assign node 9 to be our new head.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/19/screen-shot-2018-04-19-at-125350.png)

#### Delete Operation - Singly Linked List

If we want to delete an existing node ```cur``` from the singly linked list, we can do it in two steps:

1. Find ```cur```'s previous node ```prev``` and its next node ```next```;

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/27/screen-shot-2018-04-26-at-203558.png)

2. Link ```prev``` to cur's next node ```next```.

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/26/screen-shot-2018-04-26-at-203640.png)

In our first step, we need to find out ```prev``` and ```next```. It is easy to find out ```next``` using the reference field of ```cur```. However, we have to traverse the linked list from the head node to find out ```prev``` which will take ```O(N)``` time on average, where N is the length of the linked list. So the time complexity of deleting a node will be ```O(N)```.

The space complexity is ```O(1)``` because we only need constant space to store our pointers.

## Two Pointer Technique

Two scenarios to use the two-pointer technique:

1. Two pointers ```starts at different position```: ```one starts at the beginning``` while another ```starts at the end```;
2. Two pointers are ```moved at different speed```: ```one is faster``` while another ```one might be slower```.

For a singly linked list, since we can only traverse the linked list in one direction, the first scenario might not work. However, the second scenario, which is also called ```slow-pointer``` and ```fast-pointer``` technique, is really useful.

```Java
// Initialize slow & fast pointers
ListNode slow = head;
ListNode fast = head;
/**
 * Change this condition to fit specific problem.
 * Attention: remember to avoid null-pointer error
 **/
while (slow != null && fast != null && fast.next != null) {
    slow = slow.next;           // move slow pointer one step each time
    fast = fast.next.next;      // move fast pointer two steps each time
    if (slow == fast) {         // change this condition to fit specific problem
        return true;
    }
}
return false;   // change return value to fit specific problem
```

__1. Always examine if the node is null before you call the next field.__

Getting the next node of a null node will cause the null-pointer error. For example, before we run ```fast = fast.next.next```, we need to examine both ```fast``` and ```fast.next``` is not null.

__2. Carefully define the end conditions of your loop.__

Run several examples to make sure your end conditions will not result in an endless loop. And you have to take our first tip into consideration when you define your end conditions.

## Doubly Linked List

![image](https://s3-lc-upload.s3.amazonaws.com/uploads/2018/04/17/screen-shot-2018-04-17-at-161130.png)

