## [271. Encode and Decode Strings](https://leetcode.com/problems/encode-and-decode-strings/)

```Tag```: ```Array & String```

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

Follow up: Could you write a generalized algorithm to work on any possible set of characters?
