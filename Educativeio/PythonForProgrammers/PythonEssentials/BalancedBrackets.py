def check_balance(brackets):

    if brackets is None:
        return True

    stack = []

    for i in brackets:
        if i == '[':
            stack.append(i)
        elif i == ']' and stack[-1] == '[':
            stack.pop()
        else:
            return False

    if len(stack) > 0:
        return False

    return True