import math
from numba import jit

len_f = len
inf = math.inf


@jit
def linear_least_squares(x: [float], y: [float]):
    n = len_f(x)
    if n != len_f(y):
        return inf, inf

    sum_x = 0
    sum_y = 0
    sum_xy = 0
    sum_x2 = 0

    for i in range(n):
        x_element = x[i]
        y_element = y[i]

        sum_x += x_element
        sum_y += y_element
        sum_xy += x_element * y_element
        sum_x2 += x_element * x_element
    
    denominator = n * sum_x2 - sum_x**2
    if denominator == 0:
        return inf, inf

    a = (n * sum_xy - sum_x * sum_y) / denominator
    b = (sum_x2 * sum_y - sum_x * sum_xy) / denominator
    
    return a, b
