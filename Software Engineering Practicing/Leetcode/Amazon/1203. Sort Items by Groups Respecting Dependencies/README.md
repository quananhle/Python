## [1203. Sort Items by Groups Respecting Dependencies](https://leetcode.com/problems/sort-items-by-groups-respecting-dependencies/)

 
```Tag```:

#### Difficulty: Hard

There are ```n``` items each belonging to zero or one of ```m``` groups where ```group[i]``` is the group that the ```i```-th item belongs to and it's equal to ```-1``` if the ```i```-th item belongs to no group. The items and the groups are zero indexed. A group can have no item belonging to it.

Return a sorted list of the items such that:

- The items that belong to the same group are next to each other in the sorted list.
- There are some relations between these items where ```beforeItems[i]``` is a list containing all the items that should come before the ```i```-th item in the sorted array (to the left of the ```i```-th item).

Return _any solution if there is more than one solution and return an empty list if there is no solution_.

![image](https://github.com/quananhle/Python/assets/35042430/a3f3cb6d-2f3d-4639-b622-0e63a57e88a8)

---
