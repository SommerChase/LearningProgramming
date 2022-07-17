#List Challenge 1: My initial answer
def remove_even(lst):
    # Write your code here!
    other_list = []
    for l in lst:
        if l % 2 != 0:
            other_list.append(l)
    return other_list

#A more pythonic way of writing it.
def remove_even_lc(lst):
    odd_lst = [o for o in lst if o % 2 != 2]
    return odd_lst

print(remove_even_lc([3, 2, 41, 3, 34]))