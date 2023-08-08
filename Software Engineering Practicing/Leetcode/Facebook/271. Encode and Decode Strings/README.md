## [271. Encode and Decode Strings](https://leetcode.com/problems/encode-and-decode-strings/)

```Tag```: ```Array & String``` ```Design```

#### Difficulty: Medium

Design an algorithm to encode __a list of strings__ to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.

Machine 1 (sender) has the function:
```
string encode(vector<string> strs) {
  // ... your code
  return encoded_string;
}
```

Machine 2 (receiver) has the function:
```
vector<string> decode(string s) {
  //... your code
  return strs;
}
```

So Machine 1 does:
```
string encoded_string = encode(strs);
```
and Machine 2 does:
```
vector<string> strs2 = decode(encoded_string);
```
```strs2``` in Machine 2 should be the same as ```strs``` in Machine 1.

Implement the ```encode``` and ```decode``` methods.

You are not allowed to solve the problem using any serialize methods (such as ```eval```).

![image](https://github.com/quananhle/Python/assets/35042430/56ff711f-f763-4d14-a180-eecbb35a7d52)

---

__Example 1:__
```
Input: dummy_input = ["Hello","World"]
Output: ["Hello","World"]
Explanation:
Machine 1:
Codec encoder = new Codec();
String msg = encoder.encode(strs);
Machine 1 ---msg---> Machine 2

Machine 2:
Codec decoder = new Codec();
String[] strs = decoder.decode(msg);
```

__Example 2:__
```
Input: dummy_input = [""]
Output: [""]
```

__Constraints:__

- $1 \le strs.length \le 200$
- $0 \le strs[i].length \le 200$
- ```strs[i]``` contains any possible characters out of ```256``` valid ASCII characters.
 
---

### Approach 1: Non-ASCII delimiter

To accomplish this, we often use a delimiter, which is a special character or sequence of characters that we insert between each string when we combine them into one. The key thing about a delimiter is that it must be a character or sequence of characters that doesn't occur in the strings we're encoding. This allows us to correctly separate the strings when we decode them.

In many cases, we might use a common ASCII character as the delimiter. ASCII (American Standard Code for Information Interchange) is a character encoding standard that includes most of the characters you see on a standard keyboard, like letters, digits, punctuation marks, and some control characters. For example, it is common to use a delimiter like a comma to separate integers. However, if the strings we're encoding could contain any ASCII character, then we can't use an ASCII character as the delimiter, because we wouldn't know whether that character is part of a string or a delimiter.

That's where the idea of a non-ASCII delimiter comes in. There are many more characters available than just the ones in the ASCII set. Unicode is a character encoding standard that includes virtually every character from every writing system in the world, plus many symbols, control characters, and more. There are many Unicode characters that are not commonly used in text, and we can use one of these as our delimiter.

For example, let's say we have a list of strings ```["abc", "d,ef"]``` and we wanted to use a comma as a delimiter. We would end up with the string ```"abc,d,ef"``` which would be converted back as ```["abc", "d", "ef"]```, which is incorrect. We can't tell the difference between a comma being a delimiter or part of a string.

In this approach, we could choose a Unicode character like $\pi$. We can use this character as our delimiter when we encode our list of strings, and then look for this character to find the boundaries between strings when we decode.

```Python
class Codec:
    def encode(self, strs: List[str]) -> str:
        """Encodes a list of strings to a single string."""
        return "😁".join(strs)

    def decode(self, s: str) -> List[str]:
        """Decodes a single string to a list of strings."""
        return s.split("😁")


# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(strs))
```

```Python
class Codec:
    def encode(self, strs: List[str]) -> str:
        """Encodes a list of strings to a single string."""
        return "π".join(strs)

    def decode(self, s: str) -> List[str]:
        """Decodes a single string to a list of strings."""
        return s.split("π")


# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(strs))
```

__Follow up:__ Could you write a generalized algorithm to work on any possible set of characters?

### Approach 2: Escaping

```Python

```
