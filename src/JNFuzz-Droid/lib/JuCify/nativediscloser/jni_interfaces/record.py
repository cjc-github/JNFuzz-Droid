from base64 import b64encode
from ast_protobuf.ast_serialization import convertAst

def cls_2_dot_pattern(cls_name):
    """ Transform all class names to the dot seperated form.
    """
    if isinstance(cls_name, str):
        cls_name = cls_name.replace('/', '.')
    return cls_name


def sig_refine(sig):
    """ To correct deformed signture patterns. e.g., signatures contains
    spaces.
    """
    sig = sig.replace(' ', '')
    return sig

def get_str_from_symb_expr(expr):
    return b64encode(convertAst(expr).SerializeToString()).decode()

class Invokee:
    def __init__(self, method, argument_expressions, return_value, guard_condition):
        self.cls_name = cls_2_dot_pattern(method.cls.name) if method.cls is not None else None
        self.desc = method.cls.desc if method.cls is not None else None
        self.method_name = method.name
        self.signature = sig_refine(method.signature)
        self.argument_expressions = argument_expressions
        self._static = method.static
        self.exit = None
        self.return_value = return_value
        self.guard_condition = guard_condition

    def __str__(self):
        s = f'{self.cls_name}, {self.method_name}, {self.signature}, {self._static}, {self.exit},'
        s += "\"" + ", ".join([get_str_from_symb_expr(expr) for expr in self.argument_expressions]) + "\", "
        if self.return_value != None:
            s += f'{self.return_value.args[0]}, '
        else:
            s += ', '
        s += f'{self.guard_condition.bits}, {self.guard_condition.n_bits}, '
        s += "\"" + ", ".join([get_str_from_symb_expr(expr) for expr in self.guard_condition.cond]) + "\""        
        if self.desc:
            s += f', {self.desc}'
        return s

class ReturnValue:
    def __init__(self, return_value, guard_condition):
        self.return_value = return_value
        self.guard_condition = guard_condition

    def __str__(self):
        s = get_str_from_symb_expr(self.return_value)
        s += f', {self.guard_condition.bits}, {self.guard_condition.n_bits}, '
        s += "\"" + ", ".join([get_str_from_symb_expr(expr) for expr in self.guard_condition.cond]) + "\""
        return s

class GetField:
    def __init__(self, is_static, obj, classname, field_name, guard_condition):
        self.is_static = is_static
        self.obj = obj
        self.classname = classname
        self.field_name = field_name
        self.guard_condition = guard_condition

    def __str__(self):
        s = f'{self.is_static}, '
        s += get_str_from_symb_expr(self.obj)
        s += f', {self.classname}, {self.field_name}, {self.guard_condition.bits}, {self.guard_condition.n_bits}, '
        s += "\"" + ", ".join([get_str_from_symb_expr(expr) for expr in self.guard_condition.cond]) + "\""
        return s

class SetField:
    def __init__(self, is_static, obj, classname, field_name, new_value, guard_condition):
        self.is_static = is_static
        self.classname = classname
        self.obj = obj
        self.field_name = field_name
        self.new_value = new_value
        self.guard_condition = guard_condition

    def __str__(self):
        s = f'{self.is_static}, '
        s += get_str_from_symb_expr(self.obj)
        s += f', {self.classname}, {self.field_name}, '
        s += get_str_from_symb_expr(self.new_value)
        s += f', {self.guard_condition.bits}, {self.guard_condition.n_bits}, '
        s += "\"" + ", ".join([get_str_from_symb_expr(expr) for expr in self.guard_condition.cond]) + "\""
        return s

class Record:
    # global records, indexed by the address of corresponding JNI function pointer
    RECORDS = dict()

    def __init__(self, cls_name, method_name, signature, func_ptr, symbol_name,
             static_method=None, obfuscated=None, static_export=False):
        self.cls = cls_2_dot_pattern(cls_name)
        self.method_name = method_name
        self.signature = sig_refine(signature)
        self.func_ptr = func_ptr
        self.symbol_name = symbol_name
        self.static_method = static_method
        self.obfuscated = obfuscated
        self.static_export = static_export
        self._invokees = None # list of method invoked by current native method
        self._return_values = None # list of return value by current native method
        self._get_fields = None # list of field get by the current native method
        self._set_fields = None # list of field set by the current native method
        Record.RECORDS.update({func_ptr: self}) # add itself to global record

    def add_elem(self, elem):
        if isinstance(elem, Invokee):
            self.add_invokee(elem)
        elif isinstance(elem, ReturnValue):
            self.add_return_value(elem)
        elif isinstance(elem, GetField):
            self.add_get_field(elem)
        elif isinstance(elem, SetField):
            self.add_set_field(elem)
        else:
            raise TypeError("Invalid type for elem")
        
    def add_invokee(self, param, exit=None, arguments=[], return_value=None, guard_condition=None):
        """Add the Java invokee method information
        The invokee is a Java method invoked by current native function.

        Args:
        *param: should be either an instance of class Invokee or 3 strings
                describing invokee's class name, method name and the signature
                of the method.
        exit: the address of the binary CG node from where the invokee is invoked
        """
        invokee = None
        if isinstance(param, Invokee):
            invokee = param
        else:
            invokee = Invokee(param, arguments, return_value, guard_condition)
        if exit is not None:
            invokee.exit = exit
        if self._invokees is None:
            self._invokees = list()
        self._invokees.append(invokee)

    def add_return_value(self, param, guard_condition=None):
        return_value = None
        if isinstance(param, ReturnValue):
            return_value = param
        else:
            return_value = ReturnValue(param, guard_condition)
        if self._return_values is None:
            self._return_values = list()
        self._return_values.append(return_value)

    def add_get_field(self, param, obj=None, classname=None, field_name="", guard_condition=None):
        get_field = None
        if isinstance(param, GetField):
            get_field = param
        else:
            get_field = GetField(param, obj, classname, field_name, guard_condition)
        if self._get_fields is None:
            self._get_fields = list()
        self._get_fields.append(get_field)

    def add_set_field(self, param, obj=None, classname=None, field_name="", new_value=None, guard_condition=None):
        set_field = None
        if isinstance(param, SetField):
            set_field = param
        else:
            set_field = SetField(param, obj, classname, field_name, new_value, guard_condition)
        if self._set_fields is None:
            self._set_fields = list()
        self._set_fields.append(set_field)

    def is_invoker(self):
        return self._invokees is not None

    def get_num_invokees(self):
        num = 0
        if self._invokees is not None:
            num = len(self._invokees)
        return num

    def get_invokees(self):
        return self._invokees

    def get_return_values(self):
        return self._return_values

    def get_get_fields(self):
        return self._get_fields

    def get_set_fields(self):
        return self._set_fields

    def __str__(self):
        result = ''
        invoker = f'{self.cls}, {self.method_name}, {self.signature}, {self.symbol_name}, {self.static_export}'
        if self._invokees is None and self._return_values is None and self._get_fields is None and self._set_fields is None:
            result = '0, ' + invoker
        if self._invokees is not None:
            for invokee in self._invokees:
                result += '1, ' + invoker + ', ' + str(invokee) + '\n'
        if self._return_values is not None:
            for return_value in self._return_values:
                result += '2, ' + invoker + ', ' + str(return_value) + '\n'
        if self._get_fields is not None:
            for get_field in self._get_fields:
                result += '3, ' + invoker + ', ' + str(get_field) + '\n'
        if self._set_fields is not None:
            for set_field in self._set_fields:
                result += '4, ' + invoker + ', ' + str(set_field) + '\n'

        return result.strip()


class RecordNotFoundError(Exception):
    pass
