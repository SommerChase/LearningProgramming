"""
https://leetcode.com/submissions/detail/739613581/
"""
"""class Solution:
    def fib(self, n: int) -> int:
        
        if n == 0:
            return 0
        if n == 1:
            return 1
            
        return self.fib(n - 2) + self.fib(n - 1)"""


from numpy import sqrt

class Solution:
    def fib(self, n: int) -> int:

        return int((1/sqrt(5)) * ((pow(((1 + sqrt(5))/2), n)) - (pow(((1 - sqrt(5))/2), n))))


print(Solution().fib(7))