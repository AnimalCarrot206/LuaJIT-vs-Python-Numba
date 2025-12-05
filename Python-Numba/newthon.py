from typing import Callable
from numba import jit
from derriative import derivative
import math


range_f = range
abs_f = abs
inf = math.inf

@jit
def newton_method(
        func: Callable[[float], float],
        x0: float,
        epsilon: float = 1e-12,
        max_iterations: int = 10**8
):
    x = x0
    
    for i in range_f(max_iterations):
        fx = func(x)
        fpx = derivative(func, x)

        if abs_f(fpx) < epsilon:
            return inf

        x_new = x - fx / fpx
        
        if abs_f(x_new - x) < epsilon or abs_f(fx) < epsilon:
            break
            
        x = x_new
    
    return x
