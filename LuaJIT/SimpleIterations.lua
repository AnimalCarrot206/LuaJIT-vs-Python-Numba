local math = math
local abs = math.abs
local huge = math.huge

return function(phi, x0, eps, maxIter)
    eps = eps or 1e-12
    maxIter = maxIter or 1e8

    local x = x0

    for i = 1, maxIter, 1 do
        local xNew = phi(x)

        if abs(xNew - x) < eps then
            return xNew
        end

        x = xNew
    end

    return huge
end
