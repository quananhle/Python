## 380. Insert Delete GetRandom O(1)

```Tag```: ```Hash Set```

#### Difficulty: Medium

Implement the ```RandomizedSet``` class:

- ```RandomizedSet()``` Initializes the RandomizedSet object.
- ```bool insert(int val)``` Inserts an item ```val``` into the set if not present. Returns ```true``` if the item was not present, ```false``` otherwise.
- ```bool remove(int val)``` Removes an item ```val``` from the set if present. Returns ```true``` if the item was present, ```false``` otherwise.
- ```int getRandom()``` Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called). Each element must have the __same probability__ of being returned.

You must implement the functions of the class such that each function works in __average__ ```O(1)``` time complexity.

 ![image](https://user-images.githubusercontent.com/35042430/214696496-a249ca76-5f83-4fb0-902a-2389b0882815.png)

---

__Example 1:__
```
Input
["RandomizedSet", "insert", "remove", "insert", "getRandom", "remove", "insert", "getRandom"]
[[], [1], [2], [2], [], [1], [2], []]
Output
[null, true, false, true, 2, true, false, 2]

Explanation
RandomizedSet randomizedSet = new RandomizedSet();
randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
randomizedSet.remove(2); // Returns false as 2 does not exist in the set.
randomizedSet.insert(2); // Inserts 2 to the set, returns true. Set now contains [1,2].
randomizedSet.getRandom(); // getRandom() should return either 1 or 2 randomly.
randomizedSet.remove(1); // Removes 1 from the set, returns true. Set now contains [2].
randomizedSet.insert(2); // 2 was already in the set, so return false.
randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom() will always return 2.
```

__Constraints:__

- -2<sup>31</sup> <= val <= 2<sup>31</sup> - 1
- At most 2 * 10<sup>5</sup> calls will be made to ```insert```, ```remove```, and ```getRandom```.
- There will be at least one element in the data structure when ```getRandom``` is called.

---

### Hash Set (O(N) time)

```Python
class RandomizedSet:

    def __init__(self):
        self.hashset = set()

    def insert(self, val: int) -> bool:
        if not val in self.hashset:
            self.hashset.add(val)
        else:
            return False
        return True
        
    def remove(self, val: int) -> bool:
        if not val in self.hashset:
            return False
        else:
            self.hashset.remove(val)
        return True

    def getRandom(self) -> int:
        index = random.randint(0, len(self.hashset)-1)
        return list(self.hashset)[index]


# Your RandomizedSet object will be instantiated and called as such:
# obj = RandomizedSet()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.getRandom()
```

###

```Python

```
