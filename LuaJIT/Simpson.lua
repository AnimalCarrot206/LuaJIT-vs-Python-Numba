local math = math
local huge = math.huge

return function (f, a, b, n)
    n = n or 1e8
    if n < 0 then
        return huge
    end
    if n % 2 ~= 0 then
        n = n + 1
    end

    local h = (b - a) / n
    local sum = f(a) + f(b)

    for i = 1, n do
        sum = sum + (2 + (i % 2 * 2)) * f(a + i * h)
    end

    return (h / 3) * sum
end
