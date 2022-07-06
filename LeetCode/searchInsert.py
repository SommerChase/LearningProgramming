"https://leetcode.com/submissions/detail/740220866/"

class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:
        
        
        for i in range(len(nums)):
            if nums[i] == target:
                return i
            
            
        target_list = []
        for i in range(len(nums)):
            if nums[i] < target:
                target_list.append(i)
                
        if target_list == []:
            return 0
        
        return max(target_list) + 1