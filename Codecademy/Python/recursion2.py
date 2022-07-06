# define flatten() below...
def flatten(my_list):
  result = []
  for l in my_list:
    if isinstance(l, list):
      print("List found!")
      flat_list = flatten(l)
      result += flat_list
    else:
      result.append(l)
  return result

### reserve for testing...
planets = ['mercury', 'venus', ['earth'], 'mars', [['jupiter', 'saturn']], 'uranus', ['neptune', 'pluto']]

print(flatten(planets))