def move_to_end(lst, val):
    """
    In lst, moves all occurences of val to the end of the list using recursion.
    """
    result = []

    if len(lst) == 0:
        return []

    if lst[0] == val:
        result += move_to_end(lst[1:], val) #The += tripped me up here
        result.append(lst[0])
    else:
        result.append(lst[0])
        result += move_to_end(lst[1:], val)

    return result



# Test code - do not edit
gemstones = ["Amber", "Sapphire", "Amber", "Jade"]
print(move_to_end(gemstones, "Amber"))