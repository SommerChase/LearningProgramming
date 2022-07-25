def find_sum(lst, k):
    lst.sort()
    index1 = 0
    index2 = len(lst) - 1
    result = []
    sum = 0

    while index1 != index2:
        sum = lst[index1] + lst[index2]
        if sum < k:
            index1 += 1
        elif sum > k:
            index2 -= 1
        else:
            result.append(lst[index1])
            result.append(lst[index2])
            return result
    return False


print(find_sum([1, 2, 3, 4], 5))
print(find_sum([1, 2, 3, 4], 2))