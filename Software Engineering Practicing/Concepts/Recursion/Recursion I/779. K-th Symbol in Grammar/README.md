## 779. K-th Symbol in Grammar




We build a table of ```n``` rows (__1-indexed__). We start by writing ```0```` in the 1<sup>st</sup> row. Now in every subsequent row, we look at the previous row and replace each occurrence of ```0``` with ```01```, and each occurrence of ```1``` with ```10```.

For example, for ```n = 3```, the 1<sup>st</sup> row is ```0```, the 2<sup>nd</sup> row is ```01```, and the 3<sup>rd</sup> row is ```0110```.
Given two integer ```n``` and ```k```, return _the k<sup>th</sup> (__1-indexed__) symbol in the n<sup>th</sup> row of a table of ```n``` rows_.

![image](https://user-images.githubusercontent.com/35042430/217025342-0682e08f-7e78-4f97-8d11-465bee862b93.png)

---
