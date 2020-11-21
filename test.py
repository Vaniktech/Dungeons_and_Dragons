import os
from pyparsing import *

a = 146
os.system("pdftotext -f " + str(a) + " -l " + str(a) + " -layout pdf/test.pdf")

# test
s = 'import matplotlib.pyplot as plt'

module_name = Word(alphas + "_")
full_module_name = (module_name + ZeroOrMore(Suppress('.') + module_name))('modules')
import_as = (Optional(Suppress('as') + module_name))('import_as')
parse_module = (Suppress('import') + full_module_name + import_as).setParseAction(lambda t: {'import': t.modules.asList(
), 'as': t.import_as.asList()[0]})

print()

# ///////////////////////
#handle = open("pdf/test.txt", "r")
#data = handle.readlines()  # read ALL the lines!
#print(data)
#handle.close()