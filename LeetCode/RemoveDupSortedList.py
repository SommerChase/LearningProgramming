# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def deleteDuplicates(self, head: Optional[ListNode]) -> Optional[ListNode]:
        
        if head is None:
            return head
        
        prev = head
        current = head.next
        
        while current is not None:
            if prev.val == current.val:
                current = current.next
                prev.next = current
            else:
                current = current.next
                prev = prev.next
                
        return head