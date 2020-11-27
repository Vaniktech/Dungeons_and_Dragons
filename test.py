import os

a = 146
os.system("pdftotext -f " + str(a) + " -l " + str(a) + " -layout pdf/test.pdf")

file = open('pdf/test.txt', 'r')

for line in file:
    if "Стёганный" in line:
        pars = line
        print(pars)

pars = pars.replace("         ", "")
print(pars)

