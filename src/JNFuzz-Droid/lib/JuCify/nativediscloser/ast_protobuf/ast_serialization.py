import claripy
from angr.state_plugins.sim_action_object import SimActionObject
import ast_protobuf.ast_pb2 as ast_pb2
# import ast_pb2

from pdb import pm

def get_closure_var(fn, var):
    k = fn.__code__.co_freevars
    v = [c.cell_contents for c in fn.__closure__]
    return dict(zip(k,v))[var]

def isOperatorName(name):
    # if name in ["BV", "String", "FP", "Bool", "VS"]:
    if "_" not in name:
        return False
    return True

def convertAst(ast):
    proto_ast = _convertAst(ast)
    if isinstance(ast, SimActionObject):
        ast = ast.ast
    t = type(ast).__name__
    op = type(proto_ast).__name__
    base = ast_pb2.Base()
    if t.startswith("BV"):
        if t == "BV":
            if op != "IfBlock":
                if op != t:
                    tmp = getattr(base.node_Bits.node_BV, "op_"+op)
                    tmp.MergeFrom(proto_ast)
                else:
                    base.node_Bits.node_BV.MergeFrom(proto_ast)
            else:
                base.node_Bits.node_IfBlock.MergeFrom(proto_ast)
        else:
            string = ast_pb2.BV()
            for attr in string.__dir__():
                if attr.endswith(op):
                    tmp = getattr(base.node_Bits.node_BV, attr)
                    tmp.MergeFrom(proto_ast)
    elif t.startswith("FP"):
        if t == "FP":
            if op != "IfBlock":
                if op != t:
                    tmp = getattr(base.node_Bits.node_FP, "op_"+op)
                    tmp.MergeFrom(proto_ast)
                else:
                    base.node_Bits.node_FP.MergeFrom(proto_ast)
            else:
                base.node_Bits.node_IfBlock.MergeFrom(proto_ast)
        else:
            string = ast_pb2.FP()
            for attr in string.__dir__():
                if attr.endswith(op):
                    tmp = getattr(base.node_Bits.node_FP, attr)
                    tmp.MergeFrom(proto_ast)
    elif t.startswith("String"):
        if t == "String":
            if op != "IfBlock":
                if op != t:
                    tmp = getattr(base.node_Bits.node_String, "op_"+op)
                    tmp.MergeFrom(proto_ast)
                else:
                    base.node_Bits.node_String.MergeFrom(proto_ast)
            else:
                base.node_Bits.node_IfBlock.MergeFrom(proto_ast)
        else:
            string = ast_pb2.String()
            for attr in string.__dir__():
                if attr.endswith(op):
                    tmp = getattr(base.node_Bits.node_String, attr)
                    tmp.MergeFrom(proto_ast)
    elif t.startswith("Bool"):
        # if t == "Bool":
        #     base.node_Bits.node_Bool.MergeFrom(proto_ast)
        # else:
        string = ast_pb2.Bool()
        for attr in string.__dir__():
            if attr.endswith(op):
                tmp = getattr(base.node_Bool, attr)
                tmp.MergeFrom(proto_ast)
    elif t.startswith("Int"):
        if t == "Int":
            if op != "IfBlock":
                if op != t:
                    tmp = getattr(base.node_Bits.node_Int, "op_"+op)
                    tmp.MergeFrom(proto_ast)
                else:
                    base.node_Bits.node_Int.MergeFrom(proto_ast)
            else:
                base.node_Bits.node_IfBlock.MergeFrom(proto_ast)
        else:
            string = ast_pb2.Int()
            for attr in string.__dir__():
                if attr.endswith(op):
                    tmp = getattr(base.node_Int, attr)
                    tmp.MergeFrom(proto_ast)
    return base

def is_ast_op_node(ast):
    if type(ast).__name__ + "_" + ast.op in ast_pb2.__dict__:
        return True
    if isinstance(ast.args, tuple):
        if len(ast.args) > 0:
            if type(ast.args[0]).__name__ + "_" + ast.op in ast_pb2.__dict__:
                return True
            elif "FP_" + ast.op in ast_pb2.__dict__:
                return True
    return False

def _convertAst(ast):
    if isinstance(ast, claripy.ast.Base):

        # Manually treated for compatibility issues with protobuf
        if ast.op == "And":
            ast.op = "__and__"
        if ast.op == "Or":
            ast.op = "__or__"

        # op node
        if is_ast_op_node(ast):
            node = None

            # If type is bool (ie comparison operators) the operators is stored in the argument type node
            if type(ast).__name__ == "Bool" and len(ast.args) > 0 \
               and type(ast.args[0]).__name__ + "_" + ast.op in ast_pb2.__dict__:
                NodeCls = getattr(ast_pb2, type(ast.args[0]).__name__ + "_" + ast.op)
                node = NodeCls()

            elif type(ast).__name__ + "_" + ast.op in ast_pb2.__dict__:
                NodeCls = getattr(ast_pb2, type(ast).__name__ + "_" + ast.op)
                node = NodeCls()

            elif "FP_" + ast.op in ast_pb2.__dict__:
                NodeCls = getattr(ast_pb2, "FP_" + ast.op)
                node = NodeCls()

            else:
                raise ValueError("op not found for ast: " + str(ast))

            try:
                i = 1
                for arg in ast.args:
                    argValue = _convertAst(arg)
                    if not isinstance(arg, claripy.ast.Base):
                        if type(arg).__name__ == "RM": # if remainder type
                            setattr(node, "arg%i"%i, str(argValue))
                        else:
                            setattr(node, "arg%i"%i, argValue)
                    else:
                        arg_typename = argValue.__class__.__name__
                        if isOperatorName(arg_typename): # If operator
                            SupArgCls = getattr(argValue, "return").__class__
                            supArgNode = SupArgCls()
                            subSupArgNode = getattr(supArgNode, "op_"+arg_typename)
                            subSupArgNode.CopyFrom(argValue)

                            subNode = getattr(node, "arg%i"%i)
                            subNode.CopyFrom(supArgNode)
                        else: # If BV, FP, String, VS
                            subNode = getattr(node, "arg%i"%i)
                            if isinstance(argValue, ast_pb2.IfBlock): # If "IfBlock"
                                subNode.node_IfBlock.CopyFrom(argValue)
                            else:
                                subNode.CopyFrom(argValue)

                    i += 1
            except AttributeError:
                print("WARNING: missing arguments (TODO): " + str(ast.args[i-1:]))

            return node

        # lief node
        elif ast.op.endswith("S") or ast.op.endswith("V"):
                NodeCls = getattr(ast_pb2, ast.op)
                node = NodeCls()

                if ast.op.endswith("S"):
                    node.symbol = ast.args[0]
                else:
                    node.value = ast.args[0]

                SupNodeCls = getattr(ast_pb2, ast.op[:-1])
                supNode = SupNodeCls()
                subSupNode = getattr(supNode, "node_"+ast.op)
                subSupNode.CopyFrom(node)
                
                return supNode

        # "oneof" node
        else:

            # "IfBlock"
            if ast.op == "If":
                ifBlock = ast_pb2.IfBlock()
                ifBlock.condition.CopyFrom(convertAst(ast.args[0]).node_Bool)
                ifBlock.then_block.CopyFrom(convertAst(ast.args[1]))
                ifBlock.else_block.CopyFrom(convertAst(ast.args[2]))

                return ifBlock
            elif ast.op in ["fpToFP", "fpToFPUnsigned"]:
                subNode = convertAst(ast.args[0]).node_Bits.node_BV
                FP = ast_pb2.FP()
                FP.fromBv.CopyFrom(subNode)
                return FP 
                
            else:
                raise ValueError("Serialization not implemented for ast: " + str(ast))
    elif isinstance(ast, SimActionObject):
        return _convertAst(ast.ast)
    else:
        return ast

if __name__ == "__main__":
    s = claripy.IntToStr((claripy.BVS("x", 64) * (claripy.BVV(9, 64) + claripy.BVS("x", 64)))[32:0]) + (claripy.StringV("toto") + claripy.StringS("toto", 32))

    b = convertAst(s)

    print(str(b))

    print(b.IsInitialized())

    # Parsing and Serialization
    # Finally, each protocol buffer class has methods for writing and reading messages of your chosen type using the protocol buffer binary format. These include:
    #     SerializeToString(): serializes the message and returns it as a string. Note that the bytes are binary, not text; we only use the str type as a convenient container.
    #     ParseFromString(data): parses a message from the given string.

