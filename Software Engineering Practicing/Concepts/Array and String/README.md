# Array and String

### Immutable String

#### Beware of String Concatenation

![image](https://user-images.githubusercontent.com/35042430/209711554-1943c026-bcc5-4644-98e4-390f3344b1e2.png)

In Java, since the string is ```immutable```, concatenation works by first allocating enough space for the new string, copy the contents from the old string and append to the new string.

Therefore, the time complexity in total will be:

![image](https://user-images.githubusercontent.com/35042430/209711589-fb1d8c28-9a00-42b5-964d-599d1dbd44c8.png)

#### Solutions

To concatenate strings often, it will be better to use some other data structures like ```StringBuilder```. The below code runs in ```O(n)``` complexity.

![image](https://user-images.githubusercontent.com/35042430/209711635-dd26308d-4f07-4f6a-af9d-15e1010ab5bf.png)

String to be mutable, convert to char array

![image](https://user-images.githubusercontent.com/35042430/209711718-1ec73b82-10b4-4543-b72b-280cd1151fb0.png)
