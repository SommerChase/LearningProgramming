






def wrap_string(str, n):
    result = str

    if n <= 0:
        return result
    
    result = '<' + str + '>'
    return wrap_string(result, n-1)



# Test code - do not edit
wrapped = wrap_string("Pearl", 3)
print(wrapped)