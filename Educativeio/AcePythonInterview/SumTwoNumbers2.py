def binary_search(a, item):
    """Binary search for the index"""

    first = 0 
    last = len(a) - 1
    found = False
    index = -1 # I beleive this is just a placeholder

    while first <= last and not found:
        mid = (first + last) // 2
        if a[mid] == item:
            index = mid
            found = True
        else:
            if item < a[mid]:
                last = mid - 1
            else:
                first = mid + 1
    if found:
        return index
    else:
        return -1

def find_sum(lst, k):
    lst.sort()
    for j in range(len(lst)):
        index = binary_search(lst, k - lst[j])
        if index is not -1 and index is not j:
            return [lst[j], k - lst[j]]

print(find_sum([1, 5, 3], 2))
print(find_sum([1, 2, 3, 4], 5))


