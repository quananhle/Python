## 93. Restore IP Addresses

```Tag```: ```Backtracking```

#### Difficulty: Medium

A __valid IP address__ consists of exactly four integers separated by single dots. Each integer is between ```0``` and ```255``` (__inclusive__) and cannot have leading zeros.

- For example, ```"0.1.2.201"``` and ```"192.168.1.1"``` are __valid__ IP addresses, but ```"0.011.255.245"```, ```"192.168.1.312"``` and ```"192.168@1.1"``` are __invalid__ IP addresses.

Given a string ```s``` containing only digits, return _all possible valid IP addresses that can be formed by inserting dots into ```s```_. You are __not__ allowed to reorder or remove any digits in ```s```. You may return the valid IP addresses in __any__ order.

![image](https://user-images.githubusercontent.com/35042430/213847192-eff12b37-48b3-4bed-85d3-45908567bf95.png)

---

__Example 1:__
```
Input: s = "25525511135"
Output: ["255.255.11.135","255.255.111.35"]
```

__Example 2:__
```
Input: s = "0000"
Output: ["0.0.0.0"]
```

__Example 3:__
```
Input: s = "101023"
Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]
```

__Constraints:__
```
1 <= s.length <= 20
s consists of digits only.
```

---

### Backtracking

__Time Complexity__: O(M<sup>N * N), traverse the size N of the input array, and have possibilities O(M * N)

__Space Complexity__: O(N), the size of up to the size of input array

```Python
class Solution:
    def restoreIpAddresses(self, s: str) -> List[str]:
        # Backtracking
        res = list()
        address = [int(s[0])]

        def backtracking(i):
            # If i == len(s), we have reached to the end of s
            if i == len(s):
                # Check if the current address consists of exactly four integers
                if len(address) == 4:
                    res.append('.'.join(map(str, address)))
                return
            
            # Check if not leading zeroes or the current integer is between 0 and 255
            if address[-1] != 0 and address[-1] * 10 + int(s[i]) <= 255:
                last_integer = address[-1]
                address[-1] = last_integer * 10 + int(s[i])
                # Keep checking the next character in string s
                backtracking(i + 1)
                # If the IP address is invalid, drop the path or backtrack
                address[-1] = last_integer
                                
            if len(address) < 4:
                address.append(int(s[i]))
                backtracking(i + 1)
                address.pop()

        backtracking(1)
```
