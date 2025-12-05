local derriative = require("derriative")
local isNaN = require("isNaN")

local math = math
local abs = math.abs
local huge = math.huge

return function (f, x0, eps, maxIter)
    eps = eps or 1e-12
    maxIter = maxIter or 1e8

    local currentRoot = x0

    for i = 1, maxIter, 1 do
        local functionCurrent = f(currentRoot)
        local derriativeCurrent = derriative(f, currentRoot)

        if abs(derriativeCurrent) < eps or isNaN(derriativeCurrent) then
            return currentRoot
        end

        local nextRoot = currentRoot - functionCurrent / derriativeCurrent

        if abs(nextRoot - currentRoot) <= eps then
            return nextRoot
        end
        currentRoot = nextRoot
    end

    return currentRoot
end