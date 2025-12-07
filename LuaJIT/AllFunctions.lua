
local math = math
local log = math.log
local exp = math.exp
local tanh = math.tanh
local cos = math.cos
local sin = math.sin


local result = {}

-- BISECTION ===========================================

do
    local function bisection_1(x)
        return cos(x) + x - 2
    end


    local function bisection_2(x)
        return 2 * log(x) + x - 7
    end


    local function bisection_3(x)
        return x ^ 2 + sin(x) - 2
    end


    local function bisection_4(x)
        return 3 * sin(x) + x - 2
    end

    result.bisection_1 = bisection_1
    result.bisection_2 = bisection_2
    result.bisection_3 = bisection_3
    result.bisection_4 = bisection_4
end
-- BISECTION ===========================================


-- NEWTHON ===========================================
do
    local function newthon_1(x)
        return x ^ 2 - 2
    end


    local function newthon_2(x)
        return x ^ 3 - x - 2
    end


    local function newthon_3(x)
        return cos(x) - x ^ 3
    end


    local function newthon_4(x)
        return log(x) - x ^ 2 + 5
    end

    result.newthon_1 = newthon_1
    result.newthon_2 = newthon_2
    result.newthon_3 = newthon_3
    result.newthon_4 = newthon_4
end
-- NEWTHON ===========================================


-- CHORDS ===========================================

do
    local function chords_1(x)
        return x * x - 4
    end


    local function chords_2(x)
        return (x * x * x) - 2 * x - 5
    end


    local function chords_3(x)
        return exp(x) - 2 * x - 2
    end


    local function chords_4(x)
        return (x * x * x * x) - 3 * (x * x) + x - 1
    end

    result.chords_1 = chords_1
    result.chords_2 = chords_2
    result.chords_3 = chords_3
    result.chords_4 = chords_4
end
-- CHORDS ===========================================


-- SIMPSON ===========================================
do
    local function simpson_1(x)
        return (x * x)
    end


    local function simpson_2(x)
        return (x * x * x)
    end

    local function simpson_3(x)
        return (x * x * x * x)
    end


    local function simpson_4(x)
        return (x * x * x * x * x)
    end

    result.simpson_1 = simpson_1
    result.simpson_2 = simpson_2
    result.simpson_3 = simpson_3
    result.simpson_4 = simpson_4
end
-- SIMPSON ===========================================


-- MONTE-CARLO ===========================================

do
    local A, B = 3, 1
    
    local function monte_carlo_1(x)
        return (x * x) + 3 * x + 1
    end


    local function monte_carlo_2(x)
        return exp(-x)
    end


    local function monte_carlo_3(x)
        return sin(x)
    end


    local function monte_carlo_4(x)
        return cos(x)
    end

    result.monte_carlo_1 = monte_carlo_1
    result.monte_carlo_2 = monte_carlo_2
    result.monte_carlo_3 = sin
    result.monte_carlo_4 = cos
end
-- MONTE-CARLO ===========================================

return result
