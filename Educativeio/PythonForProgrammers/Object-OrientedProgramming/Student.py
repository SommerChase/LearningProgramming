class Student:

    def __init__(self, name, phy, chem, bio):
        self.name = name
        self.phy = phy
        self.chem = chem
        self.bio = bio

    def totalObtained(self):
        # print(self.phy + self.chem + self.bio)
        return(self.phy + self.chem + self.bio)

    def percentage(self):
        # print((self.totalObtained()/300) * 100)
        return (self.totalObtained()/300) * 100

Chadly = Student("Chadly", 25, 25, 25)
Chadly.totalObtained()
Chadly.percentage()