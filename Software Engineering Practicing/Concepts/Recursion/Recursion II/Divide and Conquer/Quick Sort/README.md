## Quick Sort

![image](https://assets.leetcode.com/uploads/2019/03/24/quicksort.png)

```Python
class Solution:
    def quick_sort(self, nums: List[int]) -> List[int]:
        
        n = len(nums)

        def partition(lst, lo, hi):
            pivot = lst[hi]
            i = lo
            for j in range(lo, hi):
                if lst[j] < pivot:
                    lst[i], lst[j] = lst[j], lst[i]
                    i += 1
            lst[i], lst[hi] = lst[hi], lst[i]
            return i

        def qsort(lst, lo, hi):
            if lo < hi:
                p = partition(lst, lo, hi)
                qsort(lst, lo, p - 1)
                qsort(lst, p + 1, hi)

        qsort(nums, 0, n - 1)
        return nums
```
