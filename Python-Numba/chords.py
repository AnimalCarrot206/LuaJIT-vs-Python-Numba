from typing import Callable
from numba import jit
import math


range_f = range
abs_f = abs
inf = math.inf


@jit
def chord_method(func: Callable[[float], float], a: float, b: float, eps: float = 1e-12, max_iter: int = 10**8):
    if func(a) * func(b) >= 0:
        return inf

    x_prev = a
    x_curr = b

    for i in range_f(max_iter):
        x_next = x_curr - func(x_curr) * (x_curr - x_prev) / (func(x_curr) - func(x_prev))

        if abs_f(x_next - x_curr) < eps:
            return x_next

        x_prev, x_curr = x_curr, x_next

    return x_curr
