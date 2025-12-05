local math = math
local abs = math.abs
local huge = math.huge

return function(f, a, b, eps, maxIter)
    eps = eps or 1e-12
    maxIter = maxIter or 1e8

    local fa = f(a)
    local fb = f(b)

    if fa * fb > 0 then
        return huge
    end

    local c = a

    for i = 1, maxIter, 1 do
        c = (a * fb - b * fa) / (fb - fa)
        local fc = f(c)

        if abs(fc) < eps then
            return c
        end

        if fa * fc < 0 then
            b = c
            fb = fc
        else
            a = c
            fa = fc
        end
    end

    return huge
end
