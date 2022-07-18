list1 = [1,3,4,5]  
list2 = [2,6,7,8]

def merge_lists(lst1, lst2):

    list1_pointer = 0
    list2_pointer = 0
    total_counter = 0
    merged_list = []

    while list1_pointer < len(lst1) and list2_pointer < len(lst2):
        if lst1[list1_pointer] < lst2[list2_pointer]:
            merged_list.append(lst1[list1_pointer])
            list1_pointer += 1
            total_counter += 1
            print(merged_list)
        else:
            merged_list.append(lst2[list2_pointer])
            list2_pointer += 1
            total_counter += 1
            print(merged_list)

    while list1_pointer < len(lst1):
        merged_list.append(lst1[list1_pointer])
        list1_pointer += 1
        print(merged_list)
    while list2_pointer < len(lst2):
        merged_list.append(lst2[list2_pointer])
        list2_pointer += 1
        print(merged_list)
    

    return merged_list


#show me the money
print(merge_lists(list1, list2))
