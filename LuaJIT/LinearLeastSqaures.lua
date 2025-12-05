local math = math
local huge = math.huge

return function (xData, yData)
    local n = #xData
    if n ~= #yData then
        return huge
    end

    local sum_x, sum_y, sum_xy, sum_xx = 0, 0, 0, 0

    for i, x in ipairs(xData) do
        local y = yData[i]

        sum_x = sum_x + x
        sum_y = sum_y + y
        sum_xy = sum_xy + x * y
        sum_xx = sum_xx + x * x
    end

    local denominator = n * sum_xx - sum_x * sum_x
    if denominator == 0 then
        return huge
    end

    local a = (n * sum_xy - sum_x * sum_y) / denominator
    local b = (sum_y * sum_xx - sum_x * sum_xy) / denominator

    return a, b
end
