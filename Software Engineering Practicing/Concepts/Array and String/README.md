# Array and String

### Immutable String

#### Beware of String Concatenation

![image](https://user-images.githubusercontent.com/35042430/209711554-1943c026-bcc5-4644-98e4-390f3344b1e2.png)

In Java, since the string is ```immutable```, concatenation works by first allocating enough space for the new string, copy the contents from the old string and append to the new string.

Therefore, the time complexity in total will be:

![image](https://user-images.githubusercontent.com/35042430/209711589-fb1d8c28-9a00-42b5-964d-599d1dbd44c8.png)

#### Solutions

To concatenate strings often, it will be better to use some other data structures like ```StringBuilder```. The below code runs in ```O(n)``` complexity.

![image](https://user-images.githubusercontent.com/35042430/209711635-dd26308d-4f07-4f6a-af9d-15e1010ab5bf.png)

String to be mutable, convert to char array

![image](https://user-images.githubusercontent.com/35042430/209711718-1ec73b82-10b4-4543-b72b-280cd1151fb0.png)

---

### Two-Pointer Technique

To summarize, one of the typical scenarios to use two-pointer technique is that you want to

      Iterate the array from two ends to the middle.

So you can use the two-pointer technique:

      One pointer starts from the beginning while the other pointer starts from the end.

And it is worth noting that this technique is often used in a ```sorted``` array.

### Two-pointer Technique - Scenario II

      Given an array and a value, remove all instances of that value in-place and return the new length.
      
```Java
public int removeElement(int[] nums, int val) {
    int k = 0;
    for (int i = 0; i < nums.length; ++i) {
        if (nums[i] != val) {
            nums[k] = nums[i];
            k++;
        }
    }
    return k;
}
```

We use two pointers, one faster-runner ```i``` and one slower-runner ```k```, in the example above. ```i``` moves one step each time while ```k``` moves one step only if a new needed value is added.

This is a very common scenario of using the two-pointer technique when you need:

      One slow-runner and one fast-runner at the same time.

The key to solving this kind of problems is to

      Determine the movement strategy for both pointers.

Similar to the previous scenario, you might sometimes need to ```sort``` the array before using the two-pointer technique. And you might need a ```greedy``` thought to determine your movement strategy.

---

### Array-related Techniques

1. As we mentioned, we can call the built-in function to sort an array. But it is useful to understand the principle of some widely-used sorting algorithms and their complexity.

2. ```Binary search``` is also an important technique used to search a specific element in a sorted array.

3. It is not easy to use ```two-pointer``` technique flexibly. This technique can also be used to solve:

- Slow-pointer and fast-pointer problem in Linked List
- Sliding Window Problem

4. The ```two-pointer``` technique sometimes will relate to ```Greedy Algorithm``` which helps us design our pointers' movement strategy.

---

## Problems
