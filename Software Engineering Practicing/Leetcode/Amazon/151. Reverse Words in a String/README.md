## 151. Reverse Words in a String


#### Difficulty: Medium


Given an input string s, reverse the order of the words.

A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.

Return a string of the words in reverse order concatenated by a single space.

Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.


```{Python}
class Solution(object):
    def trim_space(self, s):
        output = list()
        # remove leading space
        while s[0] == ' ':
            s = s[1:]
        # remove trailing space
        while s[-1] == ' ':
            s = s[:-1]
        # trimp excessive space
        left, right = 0, len(s)-1        
        while left <= right:
            if s[left] != ' ':
                output.append(s[left])
            elif output[-1] != ' ':
                output.append(s[left])
            left += 1
        return output
                
    def reverse_list(self, s):
        # reverse the entire input
        return s[::-1]
        # return [s[i] for i in range(len(s)-1, -1, -1)]
        
    def reverse_each_word(self, s):
        # two pointers
        slow, fast = 0, 1
        while fast < len(s):
            # if space is detected
            if s[fast] == ' ':
                # reverse the word
                s[slow:fast] = s[slow:fast][::-1]
                # increment slow to the next word
                slow = fast + 1
            # if letter, increment fast until space is next
            fast += 1
            # handle the last word of the entire string
            if fast == len(s):
                s[slow:] = s[slow:][::-1]
        return s
        
    def reverseWords(self, s):
        """
        :type s: str
        :rtype: str
        """
        """
        # Step 1: trim leading, trailing, and reduce multiple spaces between two words to single space
        # Step 2: reverse the entire string
        # Step 3: reverse each word in the string
        # Step 4: join the list and return the string
        """
        return "".join(self.reverse_each_word(self.reverse_list(self.trim_space(s))))
```
