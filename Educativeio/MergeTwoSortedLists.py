list1 = [1,3,4,5]  
list2 = [2,6,7,8]

def merge_lists(lst1, lst2):

    list1_pointer = 0
    list2_pointer = 0
    merged_list = []

    #left off here - it worked for the first 4 indicies.
    for i in range(len(list1) + len(list2) - 1):
        if list1[list1_pointer] < list2[list2_pointer]:
            merged_list.append(list1[list1_pointer])
            list1_pointer += 1
        else:
            merged_list.append(list2[list2_pointer])
            list2_pointer += 1

    return merged_list


#show me the money
print(merge_lists(list1, list2))