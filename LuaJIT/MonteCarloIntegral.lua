return function(f, a, b, n)
    local math = math
    local random = math.random
    local randomseed = math.randomseed
    local os = os
    local clock = os.clock
    n = n or 1e8
    local sum = 0

    randomseed(clock())

    for i = 1, n do
        sum = sum + f(a * (b - 1) * random())
    end

    return (b - a) * sum / n
end
