## [1136. Parallel Courses](https://leetcode.com/problems/parallel-courses)

```Tag```:

#### Difficulty: Medium

You are given an integer ```n```, which indicates that there are ```n``` courses labeled from ```1``` to ```n```. You are also given an array relations where ```relations[i]``` = $[prevCourse_{i}, nextCourse_{i}]$, representing a prerequisite relationship between course $prevCourse_{i}$ and course $nextCourse_{i}$: course $prevCourse_{i}$ has to be taken before course $nextCourse_{i}$.

In one semester, you can take any number of courses as long as you have taken all the prerequisites in the previous semester for the courses you are taking.

Return _the minimum number of semesters needed to take all courses_. If there is no way to take all the courses, return ```-1```.

![image](https://github.com/quananhle/Python/assets/35042430/6038e09f-b63e-472b-a360-755ac097e4b4)

---

__Example 1:__

![image](https://assets.leetcode.com/uploads/2021/02/24/course1graph.jpg)
```
Input: n = 3, relations = [[1,3],[2,3]]
Output: 2
Explanation: The figure above represents the given graph.
In the first semester, you can take courses 1 and 2.
In the second semester, you can take course 3.
```

__Example 2:__

![image](https://assets.leetcode.com/uploads/2021/02/24/course2graph.jpg)
```
Input: n = 3, relations = [[1,2],[2,3],[3,1]]
Output: -1
Explanation: No course can be studied because they are prerequisites of each other.
```

__Constraints:__

- $1 \le n \le 5000$
- $1 \le relations.length \le 5000$
- $relations[i].length == 2$
- $1 \le prevCourse_{i}, nextCourse_{i} \le n$
- $prevCourse_{i} \neq nextCourse_{i}$
- All the pairs $[prevCourse_{i}, nextCourse_{i}]$ are unique.

---
