## we all add the helper functions here to use acrosss files ###

def tempVar(body = 'tmp'):
        ## generate temporary variables
        if not hasattr(tempVar, "counter"):
            tempVar.counter = 0
        tempVar.counter += 1
        return body + "_" + str(tempVar.counter)


## we need to  kind implement lookup table 
## we will store all the current scope variables in a list
## if the varible doesn't found in current look back in the previous scope lists
## To store scope list, stack would be a good data structure as we need to check in reverse
class Stack():
    def __init__(self):
        self.list = []

    def push(self, val):
        self.list.append(val)

    def pop(self):
        return self.list.pop()

    def get(self, index):
        return self.list[index]

    def top(self):
        return self.list[len(self.list)-1]

    def size(self):
        return len(self.list)
    
    def getAll(self):
        return self.list
    
    def is_empty(self):
        return self.list == []
    

class WasmModule():
    '''
      generartes wat file
    '''

    def __init__(self):
        self.expressions = []
        self.fstack = Stack()
        self.indent = 0

    def add_exp(self, exp):
        if exp:
            if isinstance(exp, list):
                for s in exp:
                    s = " " * self.indent + str(s)
                    self.instructions.append(s)
            else:
                s = " " * self.indent + str(exp)
                self.expressions.append(s)


    def add(self, obj, locals=[]):
        # dispatch based on type
        if isinstance(obj, list):
            self.body(obj, locals)
        else:
            for attr in obj.keys():
                if attr == 'module':
                    self.module(obj[attr],locals)
                elif attr == 'body':
                    self.body(obj[attr],locals)
                elif attr == 'import':
                    self.imprt(obj[attr],locals)
                    ## For now after import functions we will set the all the values in a function
                    self.add_exp("(func $display")
                    self.indent +=4
                    ## just initialize all the locals in  the function
                    if locals is not None:
                        temp = set([])
                        for l in locals:
                            if l['name'] not in temp:
                                temp.add(l['name'])
                                self.decl_local(l)
                elif attr == 'call':
                    self.call(obj[attr],locals)
                elif attr == 'const':
                    self.const(obj[attr],locals)
                elif attr == 'name':
                    self.name(obj[attr],locals)
                elif attr == 'assignment':
                    self.assignment(obj[attr],locals)
                elif attr == 'rval':
                    self.rval(obj[attr],locals)
                elif attr == 'bin_op':
                    self.bin_op(obj[attr], locals)
                elif attr == 'unary_op':
                    self.unary_op(obj[attr], locals)
                elif attr == 'if':
                    self.if_(obj[attr], locals)
                
            

    def module(self, obj,locals):
        self.add_exp("(module")
        self.indent += 4
        for attr in obj.keys():
            self.add(obj,locals)
        self.indent -=4
        self.add_exp(')')
        self.add_exp("(export \"run\" (func $display))")
        self.indent -= 4
        self.add_exp(")")

    def body(self, obj,locals):
        for items in obj:
            self.add(items,locals)

    def assignment(self, obj,locals):
        self.add_exp("(local.set $%s" % obj['lval'])
        self.add(obj,locals)

    def rval(self, obj,locals):
        self.indent += 4
        self.add(obj,locals)
        self.indent -= 4
        self.add_exp(")")

    def const(self, obj,locals):
        self.add_exp("(%s.const %s)" % (obj['type'], obj['value']))

    def name(self, name,locals):
        self.add_exp("(local.get $%s)" % name)

    def call(self, obj,locals):
        ## need to wrap the call function in a explcit function, need to think a better logic , we cannot just call in web assembly 
        ## it should be in explicit function.
       
        self.add_exp("(call $%s" % (obj['fname']))
        self.indent += 4
        self.add(obj['args'],locals)
        self.indent -= 4
        self.add_exp(')')
        

    def bin_op(self, obj, locals):
        ## I think we can do greater and less than here only
        if obj['op'] == 'add':
            self.add_exp("(i32.add")
        if obj['op'] == '==':
            self.add_exp("(i32.eq")
        if obj['op'] == '!=':
            self.add_exp("(i32.ne")
        if obj['op'] == '>':
            self.add_exp("(i32.gt_u")
        if obj['op'] == '<':
            self.add_exp("(i32.lt_u")
        if obj['op'] == '>=':
            self.add_exp("(i32.ge_u")
        if obj['op'] == '<=':
            self.add_exp("(i32.le_u")


        ## load the operands and add 
        left = obj['left']
        right = obj['right']
        self.indent += 4
        self.add(left)
        self.add(right)
        self.indent -= 4
        self.add_exp(")")

    def unary_op(self, obj, locals):
        if obj['op'] == 'sub':
            self.add_exp("(i32.sub")
            self.indent += 4
            self.add_exp('(i32.const 0)')
            self.add(obj['operand'])
            self.indent -= 4
            self.add_exp(")")

    def if_(self, obj, locals):
        self.add_exp("(if")
        self.indent += 4
        self.add_exp("(i32.eq") 
        self.add(obj['cond'])
        self.add_exp('(i32.const 1)')
        self.add_exp(")")
        self.indent += 4

        self.add_exp("(then")
        self.indent += 4
        self.add(obj['then'])
        self.indent -= 4
        self.add_exp(")")
        
        self.add_exp("(else")
        self.indent += 4
        self.add(obj['else'])
        self.indent -= 4
        self.add_exp(")")
        
        self.indent -= 4
        self.indent -= 4
        
        self.add_exp(")")

    def imprt(self, obj,locals):
        '''
        WASM imports work on two level namespace
        '''
        for pobj in obj.keys():
            for cobj in obj[pobj].keys():
                import_object = obj[pobj][cobj]
                for attr in import_object.keys():
                    if attr == 'func':
                        self.import_func(
                            pobj, cobj, import_object[attr])
                    

    def import_func(self, pobj, obj, func):
        fname = func['fname']
        params = func['params']
        ret = func['ret']

        self.add_exp("(import \"%s\" \"%s\" (func $%s" % (pobj, obj, fname))
        self.indent += 4
        for param in params:
           self.decl_param(param)

        self.decl_ret(ret)
        self.indent -= 4
        self.add_exp("))")
        return self
    

    def decl_local(self, local):
        local_type = ''
        local_name = ''
        for attr in local.keys():
            if attr == 'type':
                local_type = ' ' + local[attr]
            elif attr == 'name':
                local_name = " $%s" % local[attr]
        if local_type is not None and local_name is not None:
            local_str = '(local' + local_name + local_type + ')'
        self.add_exp(local_str)

    def decl_param(self, param):
        param_type = ''
        param_name = ''
        for attr in param.keys():
            if attr == 'type':
                param_type += ' ' + param[attr]
            elif attr == 'name':
                param_name += " $%s" % param[attr]
        if param_type is not None and param_name is not None:
            param_str = '(param ' + param_name + param_type + ')'
        self.add_exp(param_str)

    def decl_ret(self, ret):
        ret_str = ''
        for attr in ret.keys():
            if attr == 'type':
                ret_str += ' ' + ret[attr]
            elif attr == 'name':
                ret_str += " $%s" % ret[attr]
        if ret and ret_str is not None:
            ret_str = '(result ' + ret_str + ')'
        self.add_exp(ret_str)

    def raw_append(self, stmt):
        self.add_exp(str(stmt))
        return self

    def clear(self):
        self.expressions = []

class Type:
    i32 = 'i32'
    i64 = 'i64'
    f32 = 'f32'
    f64 = 'f64'