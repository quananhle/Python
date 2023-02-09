## 2306. Naming a Company

```Tag```: ```Hash Map``` ```Bitwise Manipulations```

#### Difficulty: Hard

You are given an array of strings ```ideas``` that represents a list of names to be used in the process of naming a company. The process of naming a company is as follows:

Choose 2 __distinct__ names from ```ideas```, call them ```ideaA``` and ```ideaB```.

Swap the first letters of ```ideaA``` and ```ideaB``` with each other.

If both of the new names are not found in the original ```ideas```, then the name ```ideaA ideaB``` (the __concatenation__ of ```ideaA``` and ```ideaB```, separated by a space) is a valid company name.

Otherwise, it is not a valid name.

Return _the number of **distinct** valid names for the company_.

---
