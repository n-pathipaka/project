import sys
import ast
from ast import *

from parse import Parser
from flatten import Flatten
from watgen  import WatGen
from print_x86 import x86_File


# uploading to github (so you don't have to comment stuff)
github = True
# print the original file contents
print_original_file = True
# print the original ast from file
print_original_ast = True
# print the flattened ast
print_flattened_ast = False
# print the flattened program
print_flattened_prog = True
# print the uniqfy stuff
print_uniqufy_asts = True
# print heap stuff
print_heapify_ast = False
# print explicate
print_explicate_stuff = False
# print the IR
print_x86_IR = True
# output control flow graph to pdf
output_cfg = False
# display liveness analysis
display_liveness = False
# output interference graph
output_interference = False
# out spill stuff
print_spill_info = False
# print variable definitions
print_var_homes = False
# output final interference
print_final_IR = False
# show the assembly in console
print_assembly = False

class Compile:
    def compile(self, filename):
        print("----- compiling file -----")
        print(filename)
        # parse file to ast
        parser = Parser(print_original_file, print_original_ast)
        file_ast = parser.parse_file(filename)

     
        # flatten ast to new ast
        flatten = Flatten(print_flattened_ast, print_flattened_prog)
        flattened_ast = flatten.flatten(file_ast)


        print(ast.dump(flattened_ast, indent = 4))

        watgen = WatGen()
        watProgram = watgen.get_wat(flattened_ast)

        x86er = x86_File(print_assembly)
        x86er.print_file( watProgram, filename, '.wat')
        
compiler = Compile()
compiler.compile(sys.argv[1])