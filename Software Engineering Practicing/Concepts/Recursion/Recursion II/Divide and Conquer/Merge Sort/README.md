## Merge Sort

```Python
class Solution:
    def merge_sort(self, nums: List[int]) -> List[int]:
        if len(nums) <= 1:
            return nums
        
        def merge(left_list, right_list):
            l, r = len(left_list), len(right_list)
            left_cursor = right_cursor = cursor = 0
            res = list()
            while left_cursor < l and right_cursor < r:
                if left_list[left_cursor] < right_list[right_cursor]:
                    res.append(left_list[left_cursor])
                    left_cursor += 1
                else:
                    res.append(right_list[right_cursor])
                    right_cursor += 1
            res.extend(left_list[left_cursor:])
            res.extend(right_list[right_cursor:])
        
            return res
        
        pivot = len(nums) // 2
        left_list = self.merge_sort(nums[:pivot])
        right_list = self.merge_sort(nums[pivot:])
        
        return merge(left_list, right_list)
```
