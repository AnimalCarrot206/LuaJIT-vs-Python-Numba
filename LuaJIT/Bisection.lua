local math = math
local huge = math.huge

return function (f, a, b, eps, maxIter)
    eps = eps or 1e-12
    maxIter = maxIter or 1e8

    local fA = f(a)
    local fB = f(b)

    if (fA > 0) == (fB > 0) then
        return huge
    end

    if fA == 0 then
        return a
    elseif fB == 0 then
        return b
    end

    for i = 1, maxIter, 1 do
        if b - a <= eps then
            break
        end
        local c = (a + b) / 2

        if (f(a) > 0) ~= (f(c) > 0) then
            b = c
        else
            a = c
        end
    end

    return (a + b) / 2
end
