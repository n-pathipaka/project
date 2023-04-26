
import ast
from ast import *
from helper import *

class Unify():
    def __init__(self):
       self.unified_ast = None
       self.lambda_converted_function = []

    def get_unified_ast(self, n):
        self.visit(n)
        return self.unified_ast
    

    def visit(self, n):
        ## Traversing the AST AND remove the redundant nodes and convert the lambdas to funcion
        ## that's the intution of this function
        ## for now converting assigned lambda to function, Do we need to more ? check with kelly

        if isinstance(n, Module):
            body = []
            for node in n.body:
                body.append(self.visit(node))
            self.unified_ast = Module(body, n.type_ignores)
            ## jUST ADD ALL THE LAMBDA CONVERTED FUNCTION TO THE START OF THE AST
            self.unified_ast.body = self.lambda_converted_function + self.unified_ast.body

        if isinstance(n, FunctionDef):
            body = []
            for node in n.body:
                if isinstance(node, Assign):
                    if isinstance(node.value, Lambda):
                        if 'unique_lambda' in node.targets[0].id:
                            self.lambda_converted_function.append(FunctionDef(node.targets[0].id, node.value.args, node.value.body, [], None))
                        else:
                            var = tempVar("unique_lambda")	
                            self.lambda_converted_function.append(FunctionDef(var, node.value.args, node.value.body, [], None))	
                            body.append(Assign(node.targets, var))
                    else:
                        body.append(self.visit(node))
                else:
                    body.append(self.visit(node))
            return FunctionDef(n.name, n.args, body, n.decorator_list, n.returns)
        ## for remaining all instances just return the node
        else:
            return n

        
