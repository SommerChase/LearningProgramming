class Point:

    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z

    def sqSum(self):
        print(self.x**2 + self.y**2 + self.z**2)
        return self.x**2 + self.y**2 + self.z**2


heybb = Point(3, 3, 3)
heybb.sqSum() 