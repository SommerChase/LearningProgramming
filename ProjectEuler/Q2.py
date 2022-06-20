def Fibbibaby(maxFib):

    fibsters = [1,1]
    fibstersEvenSteven = []

    for i in range(2, maxFib):
        if max(fibsters) <= maxFib:
            fibsters.append(fibsters[i - 2] + fibsters[i - 1])

    for i in fibsters:
        if i % 2 == 0:
            fibstersEvenSteven.append(i)
    

    return sum(fibstersEvenSteven)


print(Fibbibaby(4000000))