## [1086. High Five](https://leetcode.com/problems/high-five/)

```Tag```: ```Array & String``` ```Priority Queue```

#### Difficulty: Easy

Given a list of the scores of different students, ```items```, where ```items[i]``` = [ID<sub>i</sub>, score<sub>i</sub>] represents one score from a student with ID<sub>i</sub>, calculate each student's __top five average__.

Return _the answer as an array of pairs result, where ```result[j]``` = [ID<sub>j</sub>, topFiveAverage<sub>j</sub>] represents the student with ID<sub>j</sub> and their __top five average___. Sort result by ID<sub>j</sub> in increasing order.

A student's __top five average__ is calculated by taking the sum of their top five scores and dividing it by ```5``` using __integer division__.

![image](https://github.com/quananhle/Python/assets/35042430/07fa9efe-b0a2-41b7-a5be-8bec48f6e7e4)

---

__Example 1:__
```
Input: items = [[1,91],[1,92],[2,93],[2,97],[1,60],[2,77],[1,65],[1,87],[1,100],[2,100],[2,76]]
Output: [[1,87],[2,88]]
Explanation: 
The student with ID = 1 got scores 91, 92, 60, 65, 87, and 100. Their top five average is (100 + 92 + 91 + 87 + 65) / 5 = 87.
The student with ID = 2 got scores 93, 97, 77, 100, and 76. Their top five average is (100 + 97 + 93 + 77 + 76) / 5 = 88.6, but with integer division their average converts to 88.
```

__Example 2:__
```
Input: items = [[1,100],[7,100],[1,100],[7,100],[1,100],[7,100],[1,100],[7,100],[1,100],[7,100]]
Output: [[1,100],[7,100]]
```

__Constraints:__

- ```1 <= items.length <= 1000```
- ```items[i].length == 2```
- 1 <= ID<sub>i</sub> <= 1000
- 0 <= score<sub>i</sub> <= 100
- For each ```ID```<sub>i</sub>, there will be at least five scores.

---

### Built-in Functions

#### Sort()

```Python
class Solution:
    def highFive(self, items: List[List[int]]) -> List[List[int]]:
        res = list()
        scores = collections.defaultdict(list)
        for student, grade in items:
            scores[student].append(grade)

        for student, grades in scores.items():
            res.append([student, sorted(grades, reverse=True)])
        for grades in res:
            grades[1] = sum(grades[1][:5]) // 5

        return sorted(res)
```

```Python
class Solution:
    def highFive(self, items: List[List[int]]) -> List[List[int]]:
        scores = collections.defaultdict(list)
        for student, grade in items:
            scores[student].append(grade)
        return([[key, int(sum(sorted(scores[key], reverse=True)[:5])/5)] for key in sorted(scores.keys())])
```

#### ```Bisect``` ```Insort()```

```Python
class Solution:
    def highFive(self, items: List[List[int]]) -> List[List[int]]:
        grades = collections.defaultdict(list)
        for student, score in items:
            # Insert in a list in increasing order
            bisect.insort(grades[student], score)
        return [[student, sum(grades[student][-5:])//5] for student in sorted(grades.keys())]
```

### Priority Queue

#### ✅ Heapify()

```Python
class Solution:
    def highFive(self, items: List[List[int]]) -> List[List[int]]:
        students = collections.defaultdict(list)
        for idx, grade in items:
            heapq.heappush(students[idx], grade)
            if len(students[idx]) > 5:
                heapq.heappop(students[idx])

        '''
        res = [[idx, sum(students[idx]) // len(students[idx])] for idx in sorted(students)]
        '''
        res = list()
        for student, grades in sorted(students.items()):
            res.append([student, sum(grades) // len(grades)])

        return res
```

#### ```nlargest()```

```Python
class Solution:
    def highFive(self, items: List[List[int]]) -> List[List[int]]:
        students = collections.defaultdict(list)
        [students[id].append(score) for id, score in items]

        for i in sorted(students):
            yield i, sum(heapq.nlargest(5, students[i])) // 5
```
