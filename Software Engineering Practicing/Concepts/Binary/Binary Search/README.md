## Binary Search

### 3 Parts of a Successful Binary Search

__Binary Search__ is generally composed of 3 main sections:

- __Pre-processing__ - Sort if collection is unsorted.
- __Binary Search__ - Using a loop or recursion to divide search space in half after each comparison.
- __Post-processing__ - Determine viable candidates in the remaining space.

### 3 Templates for Binary Search

When we first learned __Binary Search__, we might struggle. We might study hundreds of __Binary Search__ problems online and each time we looked at a developer's code, it seemed to be implemented slightly differently. Although each implementation divided the problem space in 1/2 at each step, one had numerous questions:

- Why was it implemented slightly differently?
- What was the developer thinking?
- Which way was easier?
- Which way is better?

After many failed attempts and lots of hair-pulling, we found 3 main templates for Binary Search. To prevent hair-pulling and to make it easier for new developers to learn and understand:

### Template 1

```Python
def binarySearch(nums, target):
    """
    :type nums: List[int]
    :type target: int
    :rtype: int
    """
    if len(nums) == 0:
        return -1

    left, right = 0, len(nums) - 1
    while left <= right:
        mid = (left + right) // 2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1

    # End Condition: left > right
    return -1
```

Template #1 is the most basic and elementary form of Binary Search. It is the standard Binary Search Template that most high schools or universities use when they first teach students computer science. 
__Template #1 is used to search for an element or condition which can be determined by accessing a single index in the array.__

__Key Attributes:__

- Most basic and elementary form of Binary Search
- Search Condition can be determined without comparing to the element's neighbors (or use specific elements around it)
- No post-processing required because at each step, you are checking to see if the element has been found. If you reach the end, then you know the element is not found
 

__Distinguishing Syntax:__

- Initial Condition: ```left = 0, right = length - 1```
- Termination: ```left > right```
- Searching Left: ```right = mid - 1```
- Searching Right: ```left = mid + 1```

