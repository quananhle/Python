## [1146. Snapshot Array](https://leetcode.com/problems/snapshot-array/)

```Tag```: ```Design``` ```Binary Search```

#### Difficulty: Medium

Implement a ```SnapshotArray``` that supports the following interface:

- ```SnapshotArray(int length)``` initializes an array-like data structure with the given length. Initially, each element equals 0.
- ```void set(index, val)``` sets the element at the given ```index``` to be equal to ```val```.
- ```int snap()``` takes a snapshot of the array and returns the ```snap_id```: the total number of times we called ```snap()``` minus ```1```.
- ```int get(index, snap_id)``` returns the value at the given ```index```, at the time we took the snapshot with the given ```snap_id```

![image](https://github.com/quananhle/Python/assets/35042430/0d598ce4-4030-4dd4-b787-f5fb01562192)

---

__Example 1:__
```
Input: ["SnapshotArray","set","snap","set","get"]
[[3],[0,5],[],[0,6],[0,0]]
Output: [null,null,0,null,5]
Explanation: 
SnapshotArray snapshotArr = new SnapshotArray(3); // set the length to be 3
snapshotArr.set(0,5);  // Set array[0] = 5
snapshotArr.snap();  // Take a snapshot, return snap_id = 0
snapshotArr.set(0,6);
snapshotArr.get(0,0);  // Get the value of array[0] with snap_id = 0, return 5
```

__Constraints:__

- ```1 <= length <= 5 * 10^4```
- ```0 <= index < length```
- ```0 <= val <= 10^9```
- ```0 <= snap_id <``` (the total number of times we call ```snap()```)
- At most ```5 * 10^4``` calls will be made to ```set```, ```snap```, and ```get```.

---

![image](https://leetcode.com/problems/snapshot-array/Figures/1146/1.png)

### Binary Search

![image](https://leetcode.com/problems/snapshot-array/Figures/1146/2.png)

![image](https://leetcode.com/problems/snapshot-array/Figures/1146/5.png)

![image](https://leetcode.com/problems/snapshot-array/Figures/1146/3.png)

__Algorithm__

1. For each element ```nums[i]``` in the array, create an empty list to store its historical values, in the format of ```[snap_id, value]```. Initialize each list by adding the first record ```[0, 0]```.

2. Implement the ```set(index, val)``` method: add the historical record ```[snap_id, value]``` to the record list ```history_records[index]```.

3. Implement the ```snap``` method: return ```snap_id``` and increment it by ```1```.

4. Implement the ```get(index, snap_id)``` method to retrieve the value of ```nums[index]``` in the array with snapshot id as ```snap_id```:

- Use binary search to find the rightmost insertion index of snapshot ID in the given version ```snap_index``` (so the target index is ```snap_idnex - 1```).
- Return ```history_records[index][snap_index - 1][1]```.

```Python
class SnapshotArray:

    def __init__(self, length: int):
        self.id = 0
        self.memo = [[[0,0]] for _ in range(length)]

    def set(self, index: int, val: int) -> None:
        self.memo[index].append([self.id, val])

    def snap(self) -> int:
        self.id += 1
        return self.id - 1

    def get(self, index: int, snap_id: int) -> int:
        snap_idx = bisect.bisect_right(self.memo[index], [snap_id, 10**9])
        return self.memo[index][snap_idx - 1][1]

# Your SnapshotArray object will be instantiated and called as such:
# obj = SnapshotArray(length)
# obj.set(index,val)
# param_2 = obj.snap()
# param_3 = obj.get(index,snap_id)
```

```Python
class SnapshotArray:

    def __init__(self, length: int):
        self.id = 0
        self.memo = [[[0,0]] for _ in range(length)]

    def set(self, index: int, val: int) -> None:
        self.memo[index].append([self.id, val])

    def snap(self) -> int:
        self.id += 1
        return self.id - 1

    def get(self, index: int, snap_id: int) -> int:
        lo, hi = 0, len(self.memo[index]) - 1
        while lo <= hi:
            mi = lo + (hi - lo) // 2
            if self.memo[index][mi][0] <= snap_id:
                lo = mi + 1
            else:
                hi = mi - 1

        return self.memo[index][hi][1]

# Your SnapshotArray object will be instantiated and called as such:
# obj = SnapshotArray(length)
# obj.set(index,val)
# param_2 = obj.snap()
# param_3 = obj.get(index,snap_id)
```
