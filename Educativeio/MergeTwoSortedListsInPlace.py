def merge_lists_inplace(lst1, lst2):

    l1_index = 0
    l2_index = 0

    while l1_index < len(lst1) and l2_index < len(lst2):
    
        if lst1[l1_index] > lst2[l2_index]:
            lst1.insert(l1_index, lst2[l2_index])
            l1_index += 1
            l2_index += 1
        else:
            l1_index += 1

    if l2_index < len(lst2):
        lst1.extend(lst2[l2_index:])
        
    return lst1
    # Time complexity is O(mn), which is longer than other solution,
    # but space complexity is O(m), which is smaller. Therefore,
    # the two approachess offer a trade-off between Time/Space.

print(merge_lists_inplace([4, 5, 6], [-2, -1, 0, 7]))