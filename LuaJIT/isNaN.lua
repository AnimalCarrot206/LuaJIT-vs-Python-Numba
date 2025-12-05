local math = math
local positiveHuge = math.huge
local negativeHuge = -positiveHuge
return function (x)
    return x ~= x or x == negativeHuge or x == positiveHuge
end