## 1533. Find the Index of the Large Integer

```Tag```:

#### Difficulty: Medium

We have an integer array ```arr```, where all the integers in ```arr``` are equal except for one integer which is larger than the rest of the integers. You will not be given direct access to the array, instead, you will have an __API__ ```ArrayReader``` which have the following functions:

- ```int compareSub(int l, int r, int x, int y)```: where ```0 <= l, r, x, y < ArrayReader.length()```, ```l <= r and x <= y```. The function compares the sum of sub-array ```arr[l..r]``` with the sum of the sub-array ```arr[x..y]``` and returns:
  - ```1``` if ```arr[l]+arr[l+1]+...+arr[r] > arr[x]+arr[x+1]+...+arr[y]```.
  - ```0``` if ```arr[l]+arr[l+1]+...+arr[r] == arr[x]+arr[x+1]+...+arr[y]```.
  - ```-1``` if ```arr[l]+arr[l+1]+...+arr[r] < arr[x]+arr[x+1]+...+arr[y]```.
- ```int length()```: Returns the size of the array.

You are allowed to call ```compareSub()``` __20 times__ at most. You can assume both functions work in ```O(1)``` time.

Return _the index of the array ```arr``` which has the largest integer_.

![image](https://user-images.githubusercontent.com/35042430/212568856-9e45bf9e-a3e5-45e3-a66c-d181b70557b1.png)

---
