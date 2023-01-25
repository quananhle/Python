## 288. Unique Word Abbreviation

```Tag```: ```Hash Map```

#### Difficulty: Medium

The __abbreviation__ of a word is a concatenation of its first letter, the number of characters between the first and last letter, and its last letter. If a word has only two characters, then it is an abbreviation of itself.

For example:

- ```dog --> d1g``` because there is one letter between the first letter ```'d'``` and the last letter ```'g'```.
- ```internationalization --> i18n``` because there are 18 letters between the first letter ```'i'``` and the last letter ```'n'```.
- ```it --> it``` because any word with only two characters is an __abbreviation__ of itself.

Implement the ```ValidWordAbbr``` class:

- ```ValidWordAbbr(String[] dictionary)``` Initializes the object with a ```dictionary``` of words.
- ```boolean isUnique(string word)``` Returns ```true``` if __either__ of the following conditions are met (otherwise returns ```false```):
  - There is no word in ```dictionary``` whose __abbreviation__ is equal to ```word```'s __abbreviation__.
  - For any word in ```dictionary``` whose __abbreviation__ is equal to ```word```'s __abbreviation__, that word and ```word``` are __the same__.
 
---

__Example 1:__
```
Input
["ValidWordAbbr", "isUnique", "isUnique", "isUnique", "isUnique", "isUnique"]
[[["deer", "door", "cake", "card"]], ["dear"], ["cart"], ["cane"], ["make"], ["cake"]]
Output
[null, false, true, false, true, true]

Explanation
ValidWordAbbr validWordAbbr = new ValidWordAbbr(["deer", "door", "cake", "card"]);
validWordAbbr.isUnique("dear"); // return false, dictionary word "deer" and word "dear" have the same abbreviation "d2r" but are not the same.
validWordAbbr.isUnique("cart"); // return true, no words in the dictionary have the abbreviation "c2t".
validWordAbbr.isUnique("cane"); // return false, dictionary word "cake" and word "cane" have the same abbreviation  "c2e" but are not the same.
validWordAbbr.isUnique("make"); // return true, no words in the dictionary have the abbreviation "m2e".
validWordAbbr.isUnique("cake"); // return true, because "cake" is already in the dictionary and no other word in the dictionary has "c2e" abbreviation.
```

__Constraints:__

- 1 <= dictionary.length <= 3 * 10<sup>4</sup>
- ```1 <= dictionary[i].length <= 20```
- ```dictionary[i]``` consists of lowercase English letters.
- ```1 <= word.length <= 20```
- ```word``` consists of lowercase English letters.
- At most ```5000``` calls will be made to ```isUnique.```

---

### Hash Map

```Python
class ValidWordAbbr:
    
    def __init__(self, dictionary: List[str]):
        self.dict = collections.defaultdict(set)
        self.counter = collections.defaultdict(int)
        for word in dictionary:
            abbreviation = word[0] + str(len(word)-2) + word[-1]
            self.dict[abbreviation].add(word)
            self.counter[abbreviation] = 1 + self.counter.get(abbreviation, 0)

    def isUnique(self, word: str) -> bool:
        if len(word) == 1:
            return True
        abbreviation = word[0] + str(len(word)-2) + word[-1]
        # Check if there is word in dictionary whose abbreviation is equal to word's abbreviation
        if self.dict[abbreviation]:
            # Same abbreviation but not the same word
            if not word in self.dict[abbreviation]:
                return False
            # Other word in the dictionary has same abbreviation
            elif word in self.dict[abbreviation] and self.counter[abbreviation] != 1:
                return False
        # There is no word in dictionary whose abbreviation is equal to word's abbreviation
        return True


# Your ValidWordAbbr object will be instantiated and called as such:
# obj = ValidWordAbbr(dictionary)
# param_1 = obj.isUnique(word)
```
