from typing import Callable
from numba import jit


@jit
def derivative(f: Callable[[float], float], x0: float, eps: float = 1e-12):
    return (f(x0 + eps) - f(x0)) / eps
