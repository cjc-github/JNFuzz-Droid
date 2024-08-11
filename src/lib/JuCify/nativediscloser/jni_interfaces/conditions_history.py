from claripy.ast.bool import BoolV
from angr import ExplorationTechnique, SimStatePlugin
from angr.sim_state import SimState

class ConditionHistoryPlugin(SimStatePlugin):
    def __init__(self, bits=0, n_bits=0, cond=[]):
        super(ConditionHistoryPlugin, self).__init__()
        self.bits = bits
        self.n_bits = n_bits
        self.cond = cond

    def add_new_cond(self, bit, cond):
        self.cond = cond
        if bit:
            self.bits = self.bits + (bit << self.n_bits)
        self.n_bits += 1

    def _check_masked_bits_are_equals(self, o):
        return self.bits & ((1<<self.n_bits)-1) == o.bits & ((1<<self.n_bits)-1)
        
    # is_older_than
    def __le__(self, o):
        return (self.n_bits <= o.n_bits) and (self._check_masked_bits_are_equals(o))

    def __lt__(self, o):
        return (self.n_bits < o.n_bits) and (self._check_masked_bits_are_equals(o))

    def __ge__(self, o):
        return not self.__lt__(o)

    def __gt__(self, o):
        return not self.__le__(o)

    @SimStatePlugin.memo
    def copy(self, memo):
        return ConditionHistoryPlugin(self.bits, self.n_bits, self.cond)

SimState.register_default('cond_hist', ConditionHistoryPlugin)

claripyTrue = BoolV(True)
def exclude_identical_constraints(l1, l2):
    return [x for x in l1 if list(filter(lambda y: (x==y) is claripyTrue, l2)) == []]

class ConditionsHistoryUpdater(ExplorationTechnique):
    def successors(self, simgr, state, **kwargs):
        next_states = simgr.successors(state, **kwargs)
        if len(next_states.successors) > 2:
            raise Exception('More than two successors, not handled!')
        if len(next_states.successors) > 1:
            b = 0
            for st in next_states.successors:
                cond = exclude_identical_constraints(st.solver.constraints, st.history.parent.state.solver.constraints)
                st.cond_hist.add_new_cond(b, cond)
                b += 1

        return next_states
