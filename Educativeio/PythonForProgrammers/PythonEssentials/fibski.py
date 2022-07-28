def fib(n):

    fibski = [0, 1]

    for i in range(2, n):
        next_num = fibski[i - 2] + fibski[i - 1]
        fibski.append(next_num)
    
    print(fibski)
    return fibski[n - 1]

fib(5)