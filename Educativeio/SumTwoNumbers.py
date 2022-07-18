def find_sum(lst, k):
    """Finds the sum of two numbers in lst that add to k.
    
    Args:
        lst: A list of integers that will be added to reach the target.
        k: An integer that will be used as the target.

    Returns:
        A list of two numbers from lst that add up to k.

    Raises:
        Returned None. There are no pairs from lst that sum to k"
    """

    result = []

    for i in lst:
        for j in lst:
            if i + j == k and i is not j:
                result.append([i,j])
    
    if result == []:
        raise TypeError("Returned None. There are no pairs from lst that sum to k")

    return result[0]
    # This function is Time Complexity O(n^2) because it takes the list x list.


find_sum([1,2],81)
find_sum([1, 21, 3, 14, 5, 60, 7, 6],81)
