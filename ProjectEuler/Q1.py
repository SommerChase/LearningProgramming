def Multiplesof3or5(multiples, num):

    listMultiples = []

    for i in range(1, num):
        if i % 3 == 0 or i % 5 == 0:
            listMultiples.append(i)

    return sum(listMultiples)



print(Multiplesof3or5([3,5], 1000))