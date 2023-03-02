## [443. String Compression](https://leetcode.com/problems/string-compression/)

```Tag```: ```String``` ```Array``` ```Two Pointers```

#### Difficulty: Medium

Given an array of characters ```chars```, compress it using the following algorithm:

Begin with an empty string ```s```. For each group of consecutive repeating characters in ```chars```:

- If the group's length is ```1```, append the character to ```s```.
- Otherwise, append the character followed by the group's length.

The compressed string ```s``` __should not be returned separately__, but instead, be stored __in the input character array ```chars```__. Note that group lengths that are ```10``` or longer will be split into multiple characters in ```chars```.

After you are done __modifying the input array__, return _the new length of the array_.

You must write an algorithm that uses only constant extra space.

---
