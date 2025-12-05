import math

from numba import jit

inf = math.inf
abs_f = abs
range_f = range


@jit
def bisection_method(f, a, b, eps=1e-12, max_iter=10**8):
    f_a = f(a)
    f_b = f(b)

    if (f_a > 0) == (f_b > 0):
        return inf

    if f_a == 0:
        return a
    elif f_b == 0:
        return b

    for i in range_f(max_iter):
        if abs_f(b - a) <= eps:
            break

        c = (a + b) / 2

        if (f(a) > 0) != (f(c) > 0):
            b = c
        else:
            a = c

    return (a - b) / 2
