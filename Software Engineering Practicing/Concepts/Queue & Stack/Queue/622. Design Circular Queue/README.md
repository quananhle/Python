## 622. Design Circular Queue

```Tag```: ```Queue``` ```Stack``` ```LinkedList```

#### Difficulty: Medium

Design your implementation of the circular queue. The circular queue is a linear data structure in which the operations are performed based on FIFO (First In First Out) principle, and the last position is connected back to the first position to make a circle. It is also called "Ring Buffer".

One of the benefits of the circular queue is that we can make use of the spaces in front of the queue. In a normal queue, once the queue becomes full, we cannot insert the next element even if there is a space in front of the queue. But using the circular queue, we can use the space to store new values.

Implement the ```MyCircularQueue``` class:

- ```MyCircularQueue(k)```: Initializes the object with the size of the queue to be ```k```.
- ```int Front()```: Gets the front item from the queue. If the queue is empty, return ```-1```.
- ```int Rear()```: Gets the last item from the queue. If the queue is empty, return ```-1```.
- ```boolean enQueue(int value)```: Inserts an element into the circular queue. Return ```true``` if the operation is successful.
- ```boolean deQueue()```: Deletes an element from the circular queue. Return ```true``` if the operation is successful.
- ```boolean isEmpty()```: Checks whether the circular queue is empty or not.
- ```boolean isFull()```: Checks whether the circular queue is full or not.
- 
You must solve the problem without using the built-in queue data structure in your programming language. 

![image](https://user-images.githubusercontent.com/35042430/208167064-99b37253-4ba6-460e-ad54-d2a5d1a5c830.png)

---

__Example 1:__

```
Input
["MyCircularQueue", "enQueue", "enQueue", "enQueue", "enQueue", "Rear", "isFull", "deQueue", "enQueue", "Rear"]
[[3], [1], [2], [3], [4], [], [], [], [4], []]
Output
[null, true, true, true, false, 3, true, true, true, 4]

Explanation
MyCircularQueue myCircularQueue = new MyCircularQueue(3);
myCircularQueue.enQueue(1); // return True
myCircularQueue.enQueue(2); // return True
myCircularQueue.enQueue(3); // return True
myCircularQueue.enQueue(4); // return False
myCircularQueue.Rear();     // return 3
myCircularQueue.isFull();   // return True
myCircularQueue.deQueue();  // return True
myCircularQueue.enQueue(4); // return True
myCircularQueue.Rear();     // return 4
```

---

```Python
class MyCircularQueue(object):

    def __init__(self, k):
        """
        :type k: int
        """
        self.capacity = k
        self.count = 0
        self.head = 0
        self.queue = [None] * k
        

    def enQueue(self, value):
        """
        :type value: int
        :rtype: bool
        """
        if self.count == self.capacity:
            return False
        self.queue[(self.count + self.head) % self.capacity] = value
        self.count += 1
        return True
        

    def deQueue(self):
        """
        :rtype: bool
        """
        if self.count == 0:
            return False
        # Update head pointer
        self.head = (self.head + 1) % self.capacity
        self.count -= 1
        return True

    def Front(self):
        """
        :rtype: int
        """
        if self.count != 0:
            return self.queue[self.head]
        return -1

    def Rear(self):
        """
        :rtype: int
        """
        if self.count:
            return self.queue[(self.head + self.count - 1) % self.capacity]
        return -1
        

    def isEmpty(self):
        """
        :rtype: bool
        """
        return self.count == 0
        

    def isFull(self):
        """
        :rtype: bool
        """
        return self.count == self.capacity

```
