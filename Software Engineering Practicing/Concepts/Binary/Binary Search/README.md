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

---

### Template 3

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
    while left + 1 < right:
        mid = (left + right) // 2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid
        else:
            right = mid

    # Post-processing:
    # End Condition: left + 1 == right
    if nums[left] == target: return left
    if nums[right] == target: return right
    return -1
```

__Key Attributes:__

- An alternative way to implement Binary Search
- Use element's neighbors to determine if condition is met and decide whether to go left or right
- Gurantees Search Space is at least 3 in size at each step
- Post-processing required. Loop/Recursion ends when you have 2 elements left. Need to assess if the remaining elements meet the condition.

__Distinguishing Syntax:__

- Initial Condition: ```left = 0```, ```right = length - 1```
- Termination: ```left + 1 == right```
- Searching Left: ```right = mid```
- Searching Right: ```left = mid```

#### [Search for a Range](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%203/34.%20Find%20First%20and%20Last%20Position%20of%20Element%20in%20Sorted%20Array)
#### [Find K Closest Elements](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%203/658.%20Find%20K%20Closest%20Elements)
#### [Find Peak Element](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%202/162.%20Find%20Peak%20Element)

---

### Template Analysis

99% of binary search problems that you see online will fall into 1 of these 3 templates. Some problems can be implemented using multiple templates, but as you practice more, you will notice that some templates are more suited for certain problems than others.

Note: The templates and their differences have been colored coded below.
![image](https://assets.leetcode.com/uploads/2023/02/13/template_diagram.png)

These 3 templates differ by their:

- left, mid, right index assignments
- loop or recursive termination condition
- necessity of post-processing

Templates 1 and 3 are the __most commonly used__ and almost all binary search problems can be easily implemented in one of them. Template 2 is a bit more advanced and used for certain types of problems.

Each of these 3 provided templates provides a specific use case:

- Template #1 (```left <= right```):

    - Most basic and elementary form of Binary Search
    - Search Condition can be determined without comparing to the element's neighbors (or use specific elements around it)
    - No post-processing required because at each step, you are checking to see if the element has been found. If you reach the end, then you know the element is not found

- Template #2 (```left < right```):

    - An advanced way to implement Binary Search.
    - Search Condition needs to access the element's immediate right neighbor
    - Use the element's right neighbor to determine if the condition is met and decide whether to go left or right
    - Guarantees Search Space is at least 2 in size at each step
    - Post-processing required. Loop/Recursion ends when you have 1 element left. Need to assess if the remaining element meets the condition.

- Template #3 (```left + 1 < right```):

    - An alternative way to implement Binary Search
    - Search Condition needs to access element's immediate left and right neighbors
    - Use element's neighbors to determine if the condition is met and decide whether to go left or right
    - Guarantees Search Space is at least 3 in size at each step
    - Post-processing required. Loop/Recursion ends when you have 2 elements left. Need to assess if the remaining elements meet the condition.

---

### Time and Space Complexity:

__Runtime__: ```O(log n)``` -- Logarithmic Time

Because Binary Search operates by applying a condition to the value in the middle of our search space and thus cutting the search space in half, in the worse case, we will have to make ```O(log n)``` comparisons, where ```n``` is the number of elements in our collection.

__Why log n?__

- Binary search is performed by dividing the existing array in half.
- So every time you a call the subroutine (or complete one iteration) the size reduced to half of the existing part.
- First ```N``` become ```N/2```, then it become ```N/4``` and go on till it find the element or size become ```1```.
- The maximum no of iterations is ```log N``` (base 2).

__Space__: ```O(1)``` -- Constant Space

Although Binary Search does require keeping track of 3 indices, the iterative solution does not typically require any other additional space and can be applied directly to the collection itself, therefore warrants ```O(1)``` or constant space.

---

### Other Types of Binary Search:

#### [Median of Two Sorted Arrays](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/4.%20Median%20of%20Two%20Sorted%20Arrays)
#### [Closest Binary Search Tree Value](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/270.%20Closest%20Binary%20Search%20Tree%20Value)
#### [Search in a Sorted Array of Unknown Size](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/702.%20Search%20in%20a%20Sorted%20Array%20of%20Unknown%20Size)

### Conclusion

#### [Pow(x, n)](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/50.%20Pow(x,%20n))
#### [Valid Perfect Square](https://github.com/quananhle/Python/edit/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/367.%20Valid%20Perfect%20Square)
#### [Find Smallest Letter Greater Than Target](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/744.%20Find%20Smallest%20Letter%20Greater%20Than%20Target)

### More Practices

#### [Find Minimum in Rotated Sorted Array](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/Template%202/153.%20Find%20Minimum%20in%20Rotated%20Sorted%20Array)
#### [Find Minimum in Rotated Sorted Array II](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Concepts/Binary/Binary%20Search/154.%20Find%20Minimum%20in%20Rotated%20Sorted%20Array%20II)
#### Intersection of Two Arrays
#### Intersection of Two Arrays II
#### Two Sum II - Input array is sorted

### More Practices II

#### Find the Duplicate Number
#### Median of Two Sorted Arrays
#### Find K-th Smallest Pair Distance
