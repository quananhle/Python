## [706. Design HashMap](https://leetcode.com/problems/design-hashmap)

```Tag```: ```Design``` ```Hash Map``` ```Array & String```

#### Difficulty: Easy

Design a HashMap without using any built-in hash table libraries.

Implement the ```MyHashMap``` class:

- ```MyHashMap()``` initializes the object with an empty map.
- ```void put(int key, int value)``` inserts a ```(key, value)``` pair into the HashMap. If the ```key``` already exists in the map, update the corresponding ```value```.
- ```int get(int key)``` returns the ```value``` to which the specified ```key``` is mapped, or ```-1``` if this map contains no mapping for the ```key```.
- ```void remove(key)``` removes the ```key``` and its corresponding ```value``` if the map contains the mapping for the ```key```.

![image](https://github.com/quananhle/Python/assets/35042430/db3e5619-a684-42ca-bd3f-d95c9b860018)

---

__Example 1:__
```
Input
["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
[[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
Output
[null, null, null, 1, -1, null, 1, null, -1]

Explanation
MyHashMap myHashMap = new MyHashMap();
myHashMap.put(1, 1); // The map is now [[1,1]]
myHashMap.put(2, 2); // The map is now [[1,1], [2,2]]
myHashMap.get(1);    // return 1, The map is now [[1,1], [2,2]]
myHashMap.get(3);    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
myHashMap.put(2, 1); // The map is now [[1,1], [2,1]] (i.e., update the existing value)
myHashMap.get(2);    // return 1, The map is now [[1,1], [2,1]]
myHashMap.remove(2); // remove the mapping for 2, The map is now [[1,1]]
myHashMap.get(2);    // return -1 (i.e., not found), The map is now [[1,1]]
```

__Constraints:__

- $0 \le key, value \le 10^6$
- At most $10^4$ calls will be made to ```put```, ```get```, and ```remove```.

---

### List

```Python
class MyHashMap:

    def __init__(self):
        self.map = [None] * (10**6 + 1)

    def put(self, key: int, value: int) -> None:
        self.map[key] = value

    def get(self, key: int) -> int:
        if self.map[key] is None:
            return -1
        return self.map[key]

    def remove(self, key: int) -> None:
        if self.map[key] is not None:
            self.map[key] = None


# Your MyHashMap object will be instantiated and called as such:
# obj = MyHashMap()
# obj.put(key,value)
# param_2 = obj.get(key)
# obj.remove(key)
```

#### Bonus: for ```collections.defaultdict()``` datatype, the hash map always return ```0``` if key is not found, unless pre-defined like ```collections.defaultdict(list)```, ```collections.defaultdict(lambda: False)```

```Python
class MyHashMap:

    def __init__(self):
        self.map = [0] * 1000001

    def put(self, key: int, value: int) -> None:
        self.map[key] = value

    def get(self, key: int) -> int:
        return self.map[key]

    def remove(self, key: int) -> None:
        self.map[key] = 0


# Your MyHashMap object will be instantiated and called as such:
# obj = MyHashMap()
# obj.put(key,value)
# param_2 = obj.get(key)
# obj.remove(key)
```
