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

---

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

#### [Sqrt(x)](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%201/69.%20Sqrt(x))
#### [Guess Number Higher or Lower](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%201/374.%20Guess%20Number%20Higher%20or%20Lower)
#### [Search in Rotated Sorted Array](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%201/33.%20Search%20in%20Rotated%20Sorted%20Array)

---

### Template 2

Template #2 is an advanced form of Binary Search.

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
    while left < right:
        mid = (left + right) // 2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid

    # Post-processing:
    # End Condition: left == right
    if nums[left] == target:
        return left
    return -1
```

__Key Attributes:__

- An advanced way to implement Binary Search.
- Use the element's right neighbor to determine if the condition is met and decide whether to go left or right
- Guarantees Search Space is at least 2 in size at each step
- Post-processing required. Loop/Recursion ends when you have 1 element left. Need to assess if the remaining element meets the condition.
 
__Distinguishing Syntax:__

- Initial Condition: ```left = 0```, ```right = length - 1```
- Termination: ```left == right```
- Searching Left: ```right = mid```
- Searching Right: ```left = mid + 1```

#### [First Bad Version](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%202/278.%20First%20Bad%20Version)
#### [Find Peak Element](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%202/162.%20Find%20Peak%20Element)
#### [Find Minimum in Rotated Sorted Array](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%202/153.%20Find%20Minimum%20in%20Rotated%20Sorted%20Array)
