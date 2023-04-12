## [71. Simplify Path](https://leetcode.com/problems/simplify-path/)

```Tag```: ```Stack``` ```Regular Expression```

#### Difficulty: Medium

Given a string ```path```, which is an __absolute path__ (starting with a slash ```'/'```) to a file or directory in a Unix-style file system, convert it to the simplified __canonical path__.

In a Unix-style file system, a period ```'.'``` refers to the current directory, a double period ```'..'``` refers to the directory up a level, and any multiple consecutive slashes (i.e. ```'//'```) are treated as a single slash ```'/'```. For this problem, any other format of periods such as ```'...'``` are treated as file/directory names.

The __canonical path__ should have the following format:

- The path starts with a single slash ```'/'```.
- Any two directories are separated by a single slash ```'/'```.
- The path does not end with a trailing ```'/'```.
- The path only contains the directories on the path from the root directory to the target file or directory (i.e., no period ```'.'``` or double period ```'..'```)

Return _the simplified **canonical path**_.

![image](https://user-images.githubusercontent.com/35042430/231329579-10b7c3c7-f2b7-4e61-8a5a-9fa4e83d59b7.png)

---

__Example 1:__
```
Input: path = "/home/"
Output: "/home"
Explanation: Note that there is no trailing slash after the last directory name.
```

__Example 2:__
```
Input: path = "/../"
Output: "/"
Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
```

__Example 3:__
```
Input: path = "/home//foo/"
Output: "/home/foo"
Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.
```

__Constraints:__

- ```1 <= path.length <= 3000```
- ```path``` consists of English letters, digits, period ```'.'```, slash ```'/'``` or ```'_'```.
- ```path``` is a valid absolute Unix path.

---

![image](https://leetcode.com/problems/simplify-path/Figures/71/img_fixed.png)

### Stack

__Algorithm__

1. Initialize a stack, ```S``` that we will be using for our implementation.
2. Split the input string using ```/``` as the delimiter. This step is really important because no matter what, the given input is a ```valid``` path and we simply have to shorten it. So, that means that whatever we have between two ```/``` characters is either a directory name or a special character and we have to process them accordingly.
3. Once we are done splitting the input path, we will process one component at a time.
4. If the current component is a ```.``` or an empty string, we will do nothing and simply continue. Well if you think about it, the split string array for the string ```/a//b``` would be ```[a,,b]```. yes, that's an empty string in between ```a``` and ```b```. Again, from the perspective of the overall path, it doesn't mean anything.
5. If we encounter a double-dot ```..```, we have to do some processing. This simply means go one level up in the current directory path. So, we will pop an entry from our stack if it's not empty.
6. Finally, if the component we are processing right now is not one of the special characters, then we will simply add it to our stack because it's a legitimate directory name.
7. Once we are done processing all the components, we simply have to connect all the directory names in our stack together using ```/``` as the delimiter and we will have our shortest path that leads us to the same directory as the one provided as an input.

- __Time Complexity__: ```O(N)```
- __Space Complexity__: ```O(N)```

```Python
class Solution:
    def simplifyPath(self, path: str) -> str:
        stack = list()
        directory = path.split("/")

        for dir in directory:
            if not dir or dir == ".":
                continue
            elif dir == "..":
                if stack:
                    stack.pop()
            else:
                stack.append(dir)
        
        ans = "/" + "/".join(stack)

        return ans
```

```Python
class Solution:
    def simplifyPath(self, path: str) -> str:
        res = list()
        to_go_back = 0
        path = path.split('/')
        for dir in path[::-1]:
            if dir == '' or dir == '.':
                continue
            elif dir == '..':
                to_go_back += 1
            elif to_go_back:
                to_go_back -= 1
            else:
                res.append(dir)

        ans = '/'.join(res[::-1])
        return '/' + ans if not ans or ans[0] != '/' else ans
```

### Regular Expression

```Python
class Solution:
    def simplifyPath(self, path: str) -> str:
        # solves r2
        path = re.sub("[/]+", "/", path)

        # solve r4 part I
        last_path = ""
        while last_path != path:
            last_path = path
            path = re.sub("/[.]/", "/", path)
            
        path = re.sub("^[.]/", "/", path)
        path = re.sub("/[.]$", "/", path)

        # solve r3
        path = re.sub("/$", "", path)

        # solve r1 part I
        path = re.sub("^/", "", path)

        # solve r4 part II
        path_stack = []
        for dir in path.split("/"):
            if dir != "..":
                path_stack.append(dir)
            elif path_stack:
                path_stack.pop()

        # solve r1 part II
        return "/" + "/".join(path_stack)
```


