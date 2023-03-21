## [146. LRU Cache](https://leetcode.com/problems/lru-cache/)

```Tag```: ```Design``` ```Hash Map``` ```Linked List```

#### Difficulty: Medium

Design a data structure that follows the constraints of a __Least Recently Used (LRU)__ cache.

Implement the ```LRUCache``` class:

- ```LRUCache(int capacity)``` Initialize the LRU cache with __positive__ size ```capacity```.
- ```int get(int key)``` Return the value of the ```key``` if the key exists, otherwise return ```-1```.
- ```void put(int key, int value)``` Update the value of the ```key``` if the ```key``` exists. Otherwise, add the ```key-value``` pair to the cache. If the number of keys exceeds the ```capacity``` from this operation, evict the least recently used key.

The functions ```get``` and ```put``` must each run in ```O(1)``` average time complexity.

![image](https://user-images.githubusercontent.com/35042430/226724430-fc26ae67-b715-4b7e-9756-f3da83733614.png)

---

__Example 1:__
```
Input
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
Output
[null, null, null, 1, null, -1, null, -1, 3, 4]

Explanation
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1); // cache is {1=1}
lRUCache.put(2, 2); // cache is {1=1, 2=2}
lRUCache.get(1);    // return 1
lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
lRUCache.get(2);    // returns -1 (not found)
lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
lRUCache.get(1);    // return -1 (not found)
lRUCache.get(3);    // return 3
lRUCache.get(4);    // return 4
```

__Constraints:__

- ```1 <= capacity <= 3000```
- 0 <= ```key``` <= 10<sup>4</sup>
- 0 <= ```value``` <= 10<sup>5</sup>
- At most 2 * 10<sup>5</sup> calls will be made to ```get``` and ```put```.

---

![image](https://upload.wikimedia.org/wikipedia/commons/8/88/Lruexample.png)

### Hash Map

```Python
class LRUCache:

    def __init__(self, capacity: int):
        self.cache = dict()
        self.capacity = capacity

    def get(self, key: int) -> int: # O(1)
        if not key in self.cache:
            return -1
        val = self.cache[key]
        # Ensure the key is always moved to the end or most recently used cache
        del self.cache[key]
        self.cache[key] = val
        return val

    def put(self, key: int, value: int) -> None: # O(1)
        if not key in self.cache:
            # Check if the number of key at the limit of the cache capacity
            if len(self.cache) == self.capacity:
                # Remove the least recently used key
                to_del = [key for key in self.cache][0]
                del self.cache[to_del]
        else:
            # Delete the key to update it in the most recently used cache
            del self.cache[key]
        # Update order for key to most recently used
        self.cache[key] = value

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)
```

### OrderedDict()

```Python
class LRUCache:

    def __init__(self, capacity: int):
        self.memo = OrderedDict()
        self.size = capacity

    def get(self, key: int) -> int:
        if not key in self.memo:
            return -1
        # Update the key to the last position or most recently used in the hash map
        '''
        val = self.memo.pop(key)
        self.memo[key] = val
        return val
        '''
        self.memo[key] = self.memo.pop(key)
        return self.memo[key]

    def put(self, key: int, value: int) -> None:
        if key in self.memo:
            self.memo.pop(key)
        else:
            if len(self.memo) == self.size:
                # Remove the first/least recently used key in the hash map
                self.memo.popitem(last=False)
        # Update the key=val to most recently used in the hash map
        self.memo[key] = value


# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache(capacity)
# param_1 = obj.get(key)
# obj.put(key,value)
```

### Linked List

```Python


```
