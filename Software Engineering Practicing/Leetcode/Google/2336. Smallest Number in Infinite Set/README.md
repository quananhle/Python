## [2336. Smallest Number in Infinite Set](https://leetcode.com/problems/smallest-number-in-infinite-set/)

```Tag```: ```Design```

#### Difficulty: Medium

You have a set which contains all positive integers ```[1, 2, 3, 4, 5, ...]```.

Implement the ```SmallestInfiniteSet``` class:

- ```SmallestInfiniteSet()``` Initializes the __SmallestInfiniteSet__ object to contain all positive integers.
- ```int popSmallest()``` Removes and returns the smallest integer contained in the infinite set.
- ```void addBack(int num)``` Adds a positive integer ```num``` back into the infinite set, if it is not already in the infinite set.

![image](https://user-images.githubusercontent.com/35042430/234156377-2f7360aa-a0b1-4026-bbc2-bd00f54f19a8.png)

---

__Example 1:__
```
Input
["SmallestInfiniteSet", "addBack", "popSmallest", "popSmallest", "popSmallest", "addBack", "popSmallest", "popSmallest", "popSmallest"]
[[], [2], [], [], [], [1], [], [], []]
Output
[null, null, 1, 2, 3, null, 1, 4, 5]

Explanation
SmallestInfiniteSet smallestInfiniteSet = new SmallestInfiniteSet();
smallestInfiniteSet.addBack(2);    // 2 is already in the set, so no change is made.
smallestInfiniteSet.popSmallest(); // return 1, since 1 is the smallest number, and remove it from the set.
smallestInfiniteSet.popSmallest(); // return 2, and remove it from the set.
smallestInfiniteSet.popSmallest(); // return 3, and remove it from the set.
smallestInfiniteSet.addBack(1);    // 1 is added back to the set.
smallestInfiniteSet.popSmallest(); // return 1, since 1 was added back to the set and
                                   // is the smallest number, and remove it from the set.
smallestInfiniteSet.popSmallest(); // return 4, and remove it from the set.
smallestInfiniteSet.popSmallest(); // return 5, and remove it from the set.
```

__Constraints:__

- ```1 <= num <= 1000```
- At most 1000 calls will be made in total to ```popSmallest``` and ```addBack```.

---

