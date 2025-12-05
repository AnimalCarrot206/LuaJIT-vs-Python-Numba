local math = math
local random = math.random
local randomseed = math.randomseed

local clock = os.clock

return function(f, a, b, n)
    n = n or 1e8
    local sum = 0
    randomseed(clock())

    for i = 1, n do
        local x = a + (b - a) * random()
        sum = sum + f(x)
    end

    return (b - a) * sum / n
end
