import time
from typing import Callable
from numba import jit


@jit
def simpson_integral(func: Callable[[float], float], a: float, b: float, n: int = 10**8):
    if n % 2 != 0:
        n += 1

    h = (b - a) / n
    summ = func(a) + func(b)

    for i in range(1, n, 1):
        if i % 2 == 1:
            summ += 4 * func(a + i * h)
        else:
            summ += 2 * func(a + i * h)

    return (h / 3) * summ