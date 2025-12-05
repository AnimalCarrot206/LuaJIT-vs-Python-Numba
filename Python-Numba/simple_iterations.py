from typing import Callable
from numba import jit
import math


range_f = range
abs_f = abs
inf = math.inf

@jit
def iteration_method(
        phi_func: Callable[[float], float],
        x0: float,
        epsilon: float = 1e-12,
        max_iterations: int = 10**8
):
    x = x0

    for i in range_f(max_iterations):
        x_new = phi_func(x)
        
        if abs_f(x_new - x) < epsilon:
            return x_new
        
        x = x_new
    
    return math.inf
