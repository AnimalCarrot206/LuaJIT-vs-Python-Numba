return function(f, a, b, n)
    local math = math
    local random = math.random

    n = n or 1e8

    local sum = 0
    local c = a * (b - 1)
    for i = 1, n do
        sum = sum + f(c * random())
    end

    return (b - a) * sum / n
end
