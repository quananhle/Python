## [692. Top K Frequent Words](https://leetcode.com/problems/top-k-frequent-words/)

```Tag```: ```Heap``` ```Trie``` ```Hash Map``` ```Sorting```

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

### Hash Map and Sort()

```Python
class Solution(object):
    def topKFrequent(self, words, k):
        """
        :type words: List[str]
        :type k: int
        :rtype: List[str]
        """
        # Hash Map and Sort()
        #### Time Complexity: O(NlogN), sort operations take O(NlogN) time
        #### Space Complexity: O(N), extra space used to build hash map
        counter = dict()
        for word in words:
            '''
            if word not in counter:
                counter[word] = 1
            else:
                counter[word] += 1
            '''    
            counter[word] = 1 + counter.get(word, 0)
        return sorted(list(counter.keys()), key=lambda x: (-counter[x], x))[:k]
```

### Follow-up: Could you solve it in ```O(n log(k))``` time and ```O(n)``` extra space?

### Min Heap

```Python
class Solution(object):
    def topKFrequent(self, words, k):
        """
        :type words: List[str]
        :type k: int
        :rtype: List[str]
        """
        # Min Heap
        ### Implement iterative heapify
        #### Time Complexity: O(Nlogk), adding element to heap takes O(logk) time while looping through counter
        #### Space Complexity: O(N), extra space used to build Hash Map
        counter = dict()
        for word in words:
            counter[word] = 1 + counter.get(word, 0)
        res = list()
        for word,freq in counter.items():
            heapq.heappush(res, Pair(word,freq))
            if len(res) > k:
                heapq.heappop(res)
        return [p.word for p in sorted(res, reverse=True)]

class Pair:
    def __init__(self, word, freq):
        self.word = word
        self.freq = freq
    def __lt__(self, other):
        return self.freq < other.freq or (self.freq == other.freq and self.word > other.word)
```

```Python
class Solution(object):
    def topKFrequent(self, words, k):
        """
        :type words: List[str]
        :type k: int
        :rtype: List[str]
        """
        # Min Heap
        ### Implement iterative heapify
        #### Time Complexity: O(Nlogk), adding element to heap takes O(logk) time while looping through counter
        #### Space Complexity: O(N), extra space used to build Hash Map
        ### Implement iterative heapify
        counter = dict()
        for word in words:
            counter[word] = 1 + counter.get(word, 0)
        # Generate a priority queue
        res = list()
        heapq.heapify(res)
        for word,freq in counter.items():
            heapq.heappush(res, (Element(freq, word), word))
            if len(res) > k:
                heapq.heappop(res)
        return [heapq.heappop(res)[1] for _ in range(k)][::-1]

class Element:
    def __init__(self, count, word):
        self.count = count
        self.word = word
    
    def __lt__(self, other):
        # If words have the same frequencies
        if self.count == other.count:
            # Compare the word in lexicographical order
            return self.word > other.word
        else:
            return self.count < other.count
    
    def __eq__(self, other):
        return self.count == other.count and self.word == other.word
```


