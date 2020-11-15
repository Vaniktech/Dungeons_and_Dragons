import os

a = 146
os.system("pdftotext -f " + str(a) + " -l " + str(a) + " -layout pdf/test.pdf")

handle = open("pdf/test.txt", "r")
data = handle.readlines()  # read ALL the lines!
print(data)
handle.close()