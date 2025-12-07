import random
from typing import Callable
from numba import jit


@jit
def monte_carlo_integral(
        func: Callable[[float], float],
        a: float,
        b: float,
        num_samples: int = 10**8
):
    summ = 0
    for i in range(num_samples):
        summ += func(a * random.random() * (b - 1))

    return (b - a) * summ / num_samples
