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

```Python
class Solution:
    def topKFrequent(self, words: List[str], k: int) -> List[str]:
        counter = collections.Counter(words)
        words = sorted(list(counter.keys()), key=lambda x: (-counter[x], x))
        return words[:k]
```

### Max Heap

```Python
class Solution:
    def topKFrequent(self, words: List[str], k: int) -> List[str]:
        counter = collections.Counter(words)
        h = [(-freq, word) for word, freq in counter.items()]
        heapq.heapify(h)
        return [heapq.heappop(h)[1] for _ in range(k)]
```

---

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

---

### Trie & Bucket Sort

```Python
words = ["ab", "ed", "ed", "ed", "ac"]
```

```"ab"``` and ```"ac"``` only occur once, but ```"ed"``` occurs three times. We build the following bucket and tries:

![image](https://leetcode.com/problems/top-k-frequent-words/Documents/692/692_bucket_trie.drawio.svg)

```#``` marks the node in a trie as a leaf in the graph above. We build a trie in bucket 1 to store the word ```"ab"``` and ```"ac"```, and another trie in bucket 3 to store the word ```"ed"```. Then we start from ```n = 5``` to ```1```, enumerate every bucket: if there is a non-empty trie in this bucket, we read words in the trie by traversing every path lexicographically. For example, when we traverse the trie in bucket 1, we first go to ```a``` and then go to ```b```, as ```b``` is a leaf node, we now get a complete word along this path as ```"ab"```. Similarly, we will traverse all tries and get the result ```["ed", "ab", "ac"]```.

__Algorithm__

We use the counting sorting, a special bucket sorting with bucket size as 1, to

1. Count the frequency of each word as what we did in all previous approaches, and get a counter ```counter```.
2. Initialize ```bucket``` of length ```N + 1``` (```N``` is the length of ```words```) with an empty trie in each bucket, that is, the trie in ```bucket[i]``` stores all words with frequency ```i```.
3. Enumerate words in ```counter```, and add each word to the trie mapping to its frequency.
4. Enumerate all frequencies ```i``` in from ```N``` to ```1```, traverse every ```bucket[i]``` to get all words within it from lexicographically smaller ones to the larger ones, and add the obtained words to the result until ```k``` words are obtained in the result. Then, this is our final result.

- Time Complexity: ```O(N)```
- Space Complexity: ```O(N)```

```Python
class Solution:
    def topKFrequent(self, words: List[str], k: int) -> List[str]:
        n = len(words)
        counter = collections.Counter(words)
        bucket = [{} for _ in range(n + 1)]
        self.k = k

        def add_word(trie: Mapping, word: str) -> None:
            root = trie
            for c in word:
                if not c in root:
                    root[c] = {}
                root = root[c]
            root['#'] = {}

        for word, freq in counter.items():
            add_word(bucket[freq], word)

        def get_word(trie: Mapping, prefix: str) -> List[str]:
            if self.k == 0:
                return []
            res = list()
            if '#' in trie:
                self.k -= 1
                res.append(prefix)
            for i in range(26):
                c = chr(ord('a') + i)
                if c in trie:
                    res += get_word(trie[c], prefix + c)
            return res

        res = list()
        for i in range(n, 0, -1):
            if self.k == 0:
                return res
            if bucket[i]:
                res += get_word(bucket[i], '')
        return res
```


