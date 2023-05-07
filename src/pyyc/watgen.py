
import ast
from ast import *
from helper import  WatConverter, Type
import watfunc

class WatGen():
    def __init__(self):
        self.wat    =   WatConverter()
        self.locals =  []

    def get_wat(self, n):
        self.visit(n)
        return self.wat.expressions


    def visit(self, n):
        ##  Traverse the AST and convert to json format keys and value. using helper function to convert to webassembly which looks almost similar
        ##  Done for call functions only. we need to import circle rectangle because we are using from cruntime.
        ##  currently we can do circle(x,y,z) or rectangle(x,y,h,w)

        if isinstance(n, Module):
            ## lets' do the imports ## import the functions from cruntime

            body = []
            for b in n.body:
                body.append(self.visit(b))


            module = {'module' : {
                 'body': [watfunc.watfunc, body]
            }}

            self.wat.add(module, self.locals)


        elif isinstance(n, Assign):
            lval = n.targets[0].id
            rval = self.visit(n.value)

            self.locals.append({'name': lval, 'type': Type.i32})

            assignment = {
                'assignment':{
                   'lval' : lval,
                   'rval' : rval
                }
            }

            return assignment


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


        elif isinstance(n, BinOp):
            binop = {
                'bin_op':{
                    'op' : self.visit(n.op),
                    'left': self.visit(n.left),
                    'right': self.visit(n.right)
                }
            }

            return binop

        elif isinstance(n, UnaryOp):
            unary_sub = {
                'unary_op':{
                    'op' :'sub',
                    'operand': self.visit(n.operand)
                }
            }
            return unary_sub

        elif isinstance(n, Compare):
            ## let's just do bin op only
            compare = {
                'bin_op':{
                    'op'    :  self.visit(n.ops[0]),
                    'left'  :  self.visit(n.left),
                    'right' :  self.visit(n.comparators[0])
                }
            }
            return compare

        elif isinstance(n, If):
            If_cond = {
                'if':{
                    'cond': self.visit(n.test),
                    'then': [self.visit(b)  for b in n.body],
                    'else': [self.visit(node) for node in n.orelse]
                }
            }
            print("if condition", If_cond)
            return If_cond

        elif isinstance(n, While):
            While_cond = {
                'while':{
                    'cond': self.visit(n.test),
                    'body': [self.visit(b) for b in n.body]
                }
            }
            return While_cond

        elif isinstance(n, Eq):
            return '=='
        elif isinstance(n, NotEq):
            return '!='
        elif isinstance(n, Gt):
            return '>'
        elif isinstance(n, Lt):
            return '<'
        elif isinstance(n, GtE):
            return '>='
        elif isinstance(n, LtE):
            return '<='
        elif isinstance(n, Add):
            return 'add'
        elif isinstance(n, Div):
            return '/'
        elif isinstance(n, Mult):
            return '*'
        elif isinstance(n, Sub):
            return ' - '

        else:
            print("Unrecognized watgen")
            print(ast.dump(n, indent=4))
            return n
