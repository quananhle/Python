## 692. Top K Frequent Words

#### Difficulty: Medium

Given an array of strings ```words``` and an integer ```k```, return the ```k``` _most frequent strings_.

Return the answer __sorted__ by the __frequency__ from highest to lowest. Sort the words with the same frequency by their __lexicographical order__.

![image](https://user-images.githubusercontent.com/35042430/207662862-be95e5ab-7dcc-4275-a5d2-ea24b600f78a.png)

---

__Example 1:__
```
Input: words = ["i","love","leetcode","i","love","coding"], k = 2
Output: ["i","love"]
Explanation: "i" and "love" are the two most frequent words.
Note that "i" comes before "love" due to a lower alphabetical order.
```

__Example 2:__
```
Input: words = ["the","day","is","sunny","the","the","the","sunny","is","is"], k = 4
Output: ["the","is","sunny","day"]
Explanation: "the", "is", "sunny" and "day" are the four most frequent words, with the number of occurrence being 4, 3, 2 and 1 respectively.
```

__Constraints:__
```
1 <= words.length <= 500
1 <= words[i].length <= 10
words[i] consists of lowercase English letters.
k is in the range [1, The number of unique words[i]]
```

---

Follow-up: Could you solve it in O(n log(k)) time and O(n) extra space?
