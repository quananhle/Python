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

![image](https://github.com/quananhle/Python/assets/35042430/1bd324ad-36dc-4951-9939-fffe28849687)

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

__Intuition__

While the non-ASCII delimiter approach can work well for many applications, it assumes that the delimiter character will not appear in the strings to be encoded. However, in many practical situations, we cannot make this assumption. The strings might contain any possible character, including our chosen delimiter. Therefore, we need a different approach that can handle this situation.

For our purpose, we select ```/:``` as the delimiter. This choice provides us with a unique pattern to signal the end of a string during the encoding and decoding process. However, there's still a potential issue: What happens if one of our strings naturally contains the sequence ```/:```? Let's examine how we can resolve this situation.

__Example 1__: Simple approach works

Suppose we have the following list of strings: ```["Hello", "World", "Nice", "To", "Meet", "You"]```.

If we use the simple approach to encode these strings, we just join them with our delimiter ```/:``` in between. This gives us: ```Hello/:World/:Nice/:To/:Meet/:You/:```.

When we decode this string, we split it at every ```/:```, which gives us back our original list of strings: ```["Hello", "World", "Nice", "To", "Meet", "You"]```. So the simple approach works in this case.

__Example 2__: Simple approach does not work

Now suppose we have a different list of strings: ```["Hello", "Wor/:ld", "Nice", "To", "Meet", "You"]```.

If we use the simple approach to encode these strings, we get: ```Hello/:Wor/:ld/:Nice/:To/:Meet/:You/:```.

However, when we decode this string by splitting it at every ```/:```, we get: ```["Hello", "Wor", "ld", "Nice", "To", "Meet", "You"]```, which is not the same as our original list of strings.

The string ```Wor/:ld``` has been incorrectly split into two strings: ```Wor``` and ```ld```. The problem is that our delimiter ```/:``` appears in the original string ```Wor/:ld```, which confuses our simple encoding and decoding approach.

To handle this, we use a technique called __escaping__. This is a common concept in computer programming.

So, what's the purpose of escaping? Let's say you have a character that has a special meaning in a certain context, like our delimiter ```/:```. If this character sequence appears in our original strings, it might confuse our encoding and decoding process. We need a way to signal that in this particular instance, we don't want to treat ```/:``` as a delimiter but as a part of the original string.

This is where escaping comes in. By choosing a specific character to act as an "escape character", we can denote that any special character following the escape character should be treated as a normal character instead of its special meaning. Here we choose the slash character / as our escape character.

Let's illustrate with an example. Consider we have a string ```Wor/:ld```. To avoid our delimiter ```/:``` being misinterpreted, we would "escape" the slash before the colon, making it ```//:```. So, the string becomes ```Wor//:ld```. Now, our encoding and decoding process will understand that ```/:``` in this context is not a delimiter, but a part of the original string.

Let's consider another example using the escaping approach for the problem. In this case, our input list of strings is: ```["Hello", "World/:", "How/are you?"]```.

We have one string ```World/:``` that contains our delimiter sequence ```/:``` and another string ```How/are you?``` that contains the slash character ```/```.

First, we'll encode the list of strings into a single string.

We iterate over each string in the list, and for each string, we iterate over each character. If a character is a slash ```/```, we add another slash to escape it, resulting in ```//```. If a character is not a slash, we simply add it to the output string. After we've processed all the characters in a string, we append our delimiter ```/:``` to mark the end of that string.

This gives us the following encoded string: ```Hello/:World//:/:How//are you?/:```.

Now, we'll decode the encoded string back into a list of strings.

We initialize an empty list to hold the decoded strings and an empty string to build the current string. Then, we iterate over the characters in the encoded string.

If a character is our escape character ```/```, we check the next character. If the next character is also a slash (so we have ```//```), it indicates that the original string had a ```/``` and we just escaped it. However, if the next character is a ```:``` (so we have ```/:```), it is our delimiter.

- If we find two characters ```//```, it indicates an escaped slash. We add ```/``` to the current string and move on.
- If we find two characters ```/:```, it indicates our delimiter. We add the current string to the output, clear it, and move on.

So, how does the algorithm detect when the delimiter ```/:``` is part of a string? In the encoded string, ```/:``` is converted to ```//:```. As we iterate over the encoded string, we see ```//``` (case 1), add ```/```, and then move on to the ```:```. To summarize:

- If we see ```//:```, it means ```/:``` was part of a string, not a delimiter. The first slash is the escape character and what comes after it is the contents of the string.
- If we see ```/:```, it must be a delimiter, because if it wasn't then it would have been escaped to ```//:```.

After we've processed all the characters in the encoded string, we return the list of decoded strings.

This gives us our original list of strings: ```["Hello", "World/:", "How/are you?"]```.

When we decode the string, we would recognize the escape character and understand that the ```/:``` sequence that follows is not a delimiter but part of the original string.

The concept of escaping in computing is widely used and has many real-world applications. Here are a few examples:

  - __HTML and XML__: In these markup languages, the characters ```<```, ```>```, and ```&``` have special meanings and are used to denote tags and entities. If you want to include these characters as text in a document, you need to use their escaped versions: ```&lt;```, ```&gt;```, and ```&amp;```.

  - __SQL Queries__: In SQL, single quotes are used to denote string literals. To include a single quote within the string itself, you need to escape it using two single quotes: ```'It''s a sunny day'```.

  - __Regular Expressions__: In regex, many characters like ```.```, ```*```, ```+```, ```?```, ```^```, ```(```, ```)```, ```{```, ```}```, ```[```, ```]```, ```\```, ```|```, ```/``` have special meanings. If you want to match these characters literally, you need to escape them using a backslash.

  - Programming Languages: Almost all programming languages have some form of escape sequences to denote special characters. For example, in Python, Java, and C++, ```\\n``` denotes a newline, ```\\t``` denotes a tab, ```\\"``` is used for a double quote within a string that is enclosed by double quotes, and ```\\'``` is used for a single quote within a string that is enclosed by single quotes.

These examples illustrate the escaping technique's importance in handling special characters across various domains in computing.

```Python
class Codec:
    def encode(self, strs: List[str]) -> str:
        """Encodes a list of strings to a single string."""
        # Initialize an empty list to hold the encoded strings
        encoded_string = list()

        # Iterate over each string in the input list
        for s in strs:
            # Replace each occurrence of '/' with '//'
            # This is our way of "escaping" the slash character
            # Then add our delimiter '/:' to the end
            encoded_string.append(s.replace('/', '//') + '/:')

        # Return the final encoded string
        return "".join(encoded_string)

    def decode(self, s: str) -> List[str]:
        """Decodes a single string to a list of strings."""
        # Initialize an empty list to hold the decoded strings
        decoded_strings = list()
        # Initialize a string to hold the current string being built
        current = list()
        # Initialize an index 'i' to start of the string
        i = 0

        # Iterate while 'i' is less than the length of the encoded string
        while i < len(s):
            # If we encounter the delimiter '/:'
            if s[i:i+2] == '/:':
                # Add the current_string to the list of decoded_strings
                decoded_strings.append("".join(current))
                # Clear current for the next string
                current = list()
                # Move the index 2 steps forward to skip the delimiter
                i += 2
            # If we encounter an escaped slash '//'
            elif s[i:i+2] == '//':
                # Add a single slash to current
                current.append('/')
                # Move the index 2 steps forward to skip the escaped slash
                i+= 2
            # Otherwise, just add the character to current
            else:
                current.append(s[i])
                i += 1
        
        return decoded_strings


# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(strs))
```

```Python
class Codec:
    def encode(self, strs: List[str]) -> str:
        """Encodes a list of strings to a single string."""
        # Initialize an empty list to hold the encoded strings
        encoded_string = list()

        # Iterate over each string in the input list
        for s in strs:
            # Replace each occurrence of '$' with '$$'
            # This is our way of "escaping" the slash character
            # Then add our delimiter '$:' to the end
            encoded_string.append(s.replace('$', '$$') + '$:')

        # Return the final encoded string
        return "".join(encoded_string)

    def decode(self, s: str) -> List[str]:
        """Decodes a single string to a list of strings."""
        # Initialize an empty list to hold the decoded strings
        decoded_strings = list()
        # Initialize a string to hold the current string being built
        current = list()
        # Initialize an index 'i' to start of the string
        i = 0

        # Iterate while 'i' is less than the length of the encoded string
        while i < len(s):
            # If we encounter the delimiter '$:'
            if s[i:i+2] == '$:':
                # Add the current_string to the list of decoded_strings
                decoded_strings.append("".join(current))
                # Clear current for the next string
                current = list()
                # Move the index 2 steps forward to skip the delimiter
                i += 2
            # If we encounter an escaped slash '$$'
            elif s[i:i+2] == '$$':
                # Add a single slash to current
                current.append('$')
                # Move the index 2 steps forward to skip the escaped slash
                i+= 2
            # Otherwise, just add the character to current
            else:
                current.append(s[i])
                i += 1
        
        return decoded_strings


# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(strs))
```

### Approach 3: Chunked Transfer Encoding

```Python
class Codec:
    def encode(self, strs: List[str]) -> str:
        encoded_string = list()

        for s in strs:
            encoded_string.append(str(len(s)) + '/:' + s)

        return "".join(encoded_string)

    def decode(self, s: str) -> List[str]:
        decoded_strings = list()
        i = 0
        while i < len(s):
            delimiter = s.find('/:', i)
            length = int(s[i:delimiter])
            str_ = s[delimiter + 2 : delimiter + 2 + length]
            decoded_strings.append(str_)
            i = delimiter + 2 + length

        return decoded_strings

# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(strs))
```
