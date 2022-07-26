def find_product(lst):

    product = 1
    for number in lst:
        product *= number
    
    result = []
    for i in lst:
        if i == 0:
            result_zero = result.remove(0)
            product2 = 1
            for number in result_zero:
                product2 *= number 
            result.append(int(product2))
        else:
            result.append(int(product/i))
    print(result)
    return result



find_product([1, 2, 3, 4])