## [271. Encode and Decode Strings](https://github.com/quananhle/Python/tree/main/Software%20Engineering%20Practicing/Leetcode/Facebook/271.%20Encode%20and%20Decode%20Strings)

```Python
class Codec:
    def encode(self, strs: List[str]) -> str:
        """Encodes a list of strings to a single string."""
        encoded_list = list()

        for word in strs:
            '''
            encoded_list.append(word.replace('/', '//') + '/:')
            '''
            temp = list()
            for c in word:
                if c == '/':
                    temp.append('//')
                else:
                    temp.append(c)
            encoded_list.append("".join(temp))
            encoded_list.append('/:')

        return "".join(encoded_list)

    def decode(self, s: str) -> List[str]:
        """Decodes a single string to a list of strings."""
        n = len(s)
        decoded_list = list()
        word = list()
        end = 0

        while end < n:
            if s[end:end + 2] == '/:':
                decoded_list.append("".join(word))
                word = list()
                end += 2
            elif s[end:end + 2] == '//':
                word.append('/')
                end += 2
            else:
                word.append(s[end])
                end += 1

        return decoded_list

# Your Codec object will be instantiated and called as such:
# codec = Codec()
# codec.decode(codec.encode(strs))
```
