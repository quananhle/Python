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

### Stack

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

