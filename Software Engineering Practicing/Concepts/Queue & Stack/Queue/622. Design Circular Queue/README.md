## 622. Design Circular Queue

```Tag```: ```Queue``` ```Stack``` ```LinkedList```

#### Difficulty: Medium


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
