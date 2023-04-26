
import ast
from ast import *
from helper import WasmModule, Type, Stack

class WatGen():
    def __init__(self):
        self.wat    =  WasmModule()
        self.fparms =  Stack()

    def get_wat(self, n):
        self.visit(n)
        return self.wat.expressions
        

        
    

    def visit(self, n):
        ## Traversing the AST AND remove the redundant nodes and convert the lambdas to funcion
        ## that's the intution of this function
        ## for now converting assigned lambda to function, Do we need to more ? check with kelly

        if isinstance(n, Module):
            ## lets' do the imports ## import the functions from cruntime
            import_obj = {
                'import':{
                    'cruntime':{
                        'circle':{
                            'func':{
                                'fname' : 'circle',
                                'params': [{'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}],
                                'ret'   : {}
                            }
                        },
                        'rectangle':{
                            'func':{
                                'fname'  : 'rectangle',
                                'params' : [{'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}, {'type': Type.i32}],
                                'ret'    : {}
                            }
                        }
                    }
                }
            }

            body = []
            for b in n.body:
                body.append(self.visit(b))
            

            module = {'module' : {
                 'body': [import_obj, body]
            }}

            self.wat.add(module)

        
        elif isinstance(n, Expr):
            return self.visit(n.value)
        
        elif isinstance(n, Call):
            ## calling circle, square or rectangle comes under this call function
            ## push all the arguments into stack
            call_func = {
                'call':{
                    'fname': n.func.id,
                    'args' : [self.visit(arg) for arg in n.args]
                }
            }

            return call_func
        

        elif isinstance(n, Constant):
            const = {
                'const': {
                    'value': n.value,
                    'type': Type.i32
                }
             }
            return const
        # return the variable name
        # also add all our variables to a list for later use
        elif isinstance(n, Name):
            name = {
                'name': n.id
            }
            return name

        else:
            return n
        


        

        
