class Solution:
    def addBinary(self, a: str, b: str) -> str:
        
        
        
        max_len = max(len(a), len(b))
        
        a_fill = a.zfill(max_len)
        b_fill = b.zfill(max_len)
        print(a_fill)
        print(b_fill)
        
        carry = 0
        result = ""
        for i in reversed(range(max_len)):

            print("Carry: ", carry)
            
            if a_fill[i] == b_fill[i] and a_fill[i] == '1':
                print('Option a')
                if carry == 0:
                    print("a1")
                    result = '0' + result
                    carry = 1
                    
                else:
                    print("a2")
                    result = '1' + result
                    carry = 1
                    
                
            if a_fill[i] == b_fill[i] and a_fill[i] == '0':
                print('Option b')                
                if carry == 0:
                    result = '0' + result
                    
                else:
                    result = '1' + result
                    carry = 0
            
            if a_fill[i] != b_fill[i]:
                print('Option c')                
                if carry == 0:
                    print('c1')
                    result = '1' + result
                    
                else:
                    print('c2')
                    result = '0' + result
                    carry = 1
                
        
        if carry == 1:
            result = str(carry) + result
        
        return result