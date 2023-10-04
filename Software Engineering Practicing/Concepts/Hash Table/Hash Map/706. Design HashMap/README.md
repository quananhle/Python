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

### Intuition

Hashmap is a common data structure that is implemented in various forms in different programming languages, e.g. ```dict``` in Python and ```HashMap``` in Java. The most distinguish characteristic about hashmap is that it provides a fast access to a value that is associated with a given key.

> There are two main issues that we should tackle, in order to design an efficient hashmap data structure: 1). hash function design and 2). collision handling.

- __1). hash function design__: the purpose of hash function is to map a key value to an address in the storage space, similarly to the system that we assign a postcode to each mail address.
As one can image, for a good hash function, it should map different keys evenly across the storage space, so that we don't end up with the case that the majority of the keys are concentrated in a few spaces.

- __2). collision handling__: essentially the hash function reduces the vast key space into a limited address space. As a result, there could be the case where two different keys are mapped to the same address, which is what we call 'collision'.
Since the collision is inevitable, it is important that we have a strategy to handle the collision.

Depending on how we deal with each of the above two issues, we could have various implementation of hashmap data structure.

Even though a list could act as hash function design, like the design below, it in fact does not reduce the key space into a limited address space. The design below is bounded to the provided constraints; hence, not as efficient as a true hash map

#### List

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

### Modulo + List

As one of the most intuitive implementations, we could adopt the ```modulo``` operator as the hash function, since the key value is of integer type. In addition, in order to minimize the potential collisions, it is advisable to use a prime number as the base of modulo, e.g. ```2069```.

__Algorithm__

For each of the methods in hashmap data structure, namely ```get()```, ```put()``` and ```remove()```, it all boils down to the method to locate the value that is stored in hashmap, given the key.

This localization process can be done in two steps:

- For a given ```key``` value, first we apply the hash function to generate a hash key, which corresponds to the address in our main storage. With this hash key, we would find the bucket where the value should be stored.
- Now that we found the bucket, we simply iterate through the bucket to check if the desired ```<key, value>``` pair does exist.

![image](https://leetcode.com/problems/design-hashmap/Figures/706/706_hashmap.png)

```Python

```
