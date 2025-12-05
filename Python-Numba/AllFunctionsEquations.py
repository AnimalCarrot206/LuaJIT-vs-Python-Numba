import math
from numba import jit


log = math.log
exp = math.exp
tanh = math.tanh
cos = math.cos
sin = math.sin


# BISECTION ===========================================
@jit
def bisection_1(x):
    return cos(x) + x - 2


@jit
def bisection_2(x):
    return 2 * log(x) + x - 7


@jit
def bisection_3(x):
    return x ** 2 + sin(x) - 2


@jit
def bisection_4(x):
    return 3 * sin(x) + x - 2
# BISECTION ===========================================


# NEWTHON ===========================================
@jit
def newthon_1(x):
    return x ** 2 - 2


@jit
def newthon_2(x):
    return x ** 3 - x - 2


@jit
def newthon_3(x):
    return cos(x) - x ** 3


@jit
def newthon_4(x):
    return log(x) - x ** 2 + 5
# NEWTHON ===========================================


# CHORDS ===========================================
@jit
def chords_1(x):
    return x ** 2 - 4


@jit
def chords_2(x):
    return x ** 3 - 2 * x - 5


@jit
def chords_3(x):
    return exp(x) - 2 * x - 2


@jit
def chords_4(x):
    return x ** 4 - 3* x ** 2 + x - 1
# CHORDS ===========================================


# SIMPLE ITERATIONS ===========================================
@jit
def simple_iterations_1(x):
    return cos(x) + 0.1 * sin(5 * x)


@jit
def simple_iterations_2(x):
    return (x + 1 / x) / 2 + 0.1 * sin(10 * x)


@jit
def simple_iterations_3(x):
    return 0.99 * x + 0.01 * (x ** 3 - 2)


@jit
def simple_iterations_4(x):
    return 2 * sin(x) + x / 3
# SIMPLE ITERATIONS ===========================================


# SIMPSON ===========================================
@jit
def simpson_1(x):
    return x ** 2


@jit
def simpson_2(x):
    return x ** 3


@jit
def simpson_3(x):
    return x ** 4


@jit
def simpson_4(x):
    return x ** 5
# SIMPSON ===========================================


# MONTE-CARLO ===========================================
@jit
def monte_carlo_1(x):
    return x ** 2 + 3 * x + 1


@jit
def monte_carlo_2(x):
    return exp(-x)


@jit
def monte_carlo_3(x):
    return sin(x)


@jit
def monte_carlo_4(x):
    return cos(x)
# MONTE-CARLO ===========================================
