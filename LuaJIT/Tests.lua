local AllFunctions = require("AllFunctions")

local math = math
local table = table

local pi = math.pi

local ALGORITHMS_TO_TEST = {
    -- ["Метод половинного деления"] = require("Bisection"),
    -- ["Метол Ньютона-Рафсона"] = require("Newton"),
    -- ["Метод хорд"] = require("Chords"),
    -- ["Метод Симпсона"] = require("Simpson"),
    ["Метод Монте-Карло"] = require("MonteCarloIntegral"),
}

local ALGORITHMS_ARGUMENTS = {
    ["Метод половинного деления"] = {
        { AllFunctions.bisection_1, 2,   4 },
        { AllFunctions.bisection_2, 3.5, 4.5 },
        { AllFunctions.bisection_3, 1,   2 },
        { AllFunctions.bisection_4, 0,   1 },
    },

    ["Метол Ньютона-Рафсона"] = {
        { AllFunctions.newthon_1, 1 },
        { AllFunctions.newthon_2, 1 },
        { AllFunctions.newthon_3, 0.5 },
        { AllFunctions.newthon_4, 0.001 },
    },

    ["Метод хорд"] = {
        { AllFunctions.chords_1, 1, 3 },
        { AllFunctions.chords_2, 2, 3 },
        { AllFunctions.chords_3, 1, 2 },
        { AllFunctions.chords_4, 1, 2 },
    },

    ["Метод Симпсона"] = {
        { AllFunctions.simpson_1, 0, 2 },
        { AllFunctions.simpson_2, 0, 2 },
        { AllFunctions.simpson_3, 0, 2 },
        { AllFunctions.simpson_4, 0, 2 },
    },

    ["Метод Монте-Карло"] = {
        { AllFunctions.monte_carlo_1, 0, 2 },
        { AllFunctions.monte_carlo_2, 0, 1 },
        { AllFunctions.monte_carlo_3, 0, pi },
        { AllFunctions.monte_carlo_4, 0, pi },
    },
}

local RESULT_FORMATTERS
do
    local function rootResultFormatter(result)
        return string.format("КОРЕНЬ -> %f", result[1])
    end

    RESULT_FORMATTERS = {
        ["Метод половинного деления"] = rootResultFormatter,
        ["Метол Ньютона-Рафсона"] = rootResultFormatter,
        ["Метод хорд"] = rootResultFormatter,

        ["Метод Симпсона"] = rootResultFormatter,
        ["Метод Монте-Карло"] = rootResultFormatter,
    }
end

local function getStringForOutput(algorithmName, results, totalElapsedTime)
    local roofAndFloor = "==================================================\n"
    local rasdeliter = "-----------\n"
    local headString = string.format("[%s]: Итоговое время -> %f\n", algorithmName:upper(), totalElapsedTime)

    local dataString = ""

    for i, resultInfo in ipairs(results) do
        local mainData = string.format(
            "[ТЕСТ %d]: \n %s \n Время -> %f\n",
            i,
            RESULT_FORMATTERS[algorithmName](resultInfo.result),
            resultInfo.elsapsedTime
        )
        dataString = dataString .. mainData .. rasdeliter
    end

    return roofAndFloor .. headString .. dataString
end

local function doWholeTest(isOutputEnabled)
    local totalTestElapsedTime = 0
    local totalOfMethodsTime = {}

    for algorithmName, algorithmFunction in pairs(ALGORITHMS_TO_TEST) do
        local argumentsTable = ALGORITHMS_ARGUMENTS[algorithmName]
        local totalAlgorithmElapsedTime = 0
        local results = {}

        for _, argumentsList in ipairs(argumentsTable) do
            local start = os.clock()
            local result = { algorithmFunction(unpack(argumentsList)) }
            local elsapsedTime = os.clock() - start

            totalAlgorithmElapsedTime = totalAlgorithmElapsedTime + elsapsedTime
            table.insert(results, {
                result = result,
                elsapsedTime = elsapsedTime,
            })
            collectgarbage()
        end
        if isOutputEnabled then
            print(getStringForOutput(algorithmName, results, totalAlgorithmElapsedTime))
        end

        totalOfMethodsTime[algorithmName] = totalAlgorithmElapsedTime
        totalTestElapsedTime = totalTestElapsedTime + totalAlgorithmElapsedTime
    end

    return totalTestElapsedTime, totalOfMethodsTime
end

local ITERATIONS_COUNT = 10
local timeSum = 0
local totalOfMethods = {
    ["Метод половинного деления"] = 0,
    ["Метол Ньютона-Рафсона"] = 0,
    ["Метод хорд"] = 0,
    ["Метод Симпсона"] = 0,
    ["Метод Монте-Карло"] = 0,
}
-- Первый прогон, по аналогии с Python - прогрев (хоть и не требуюется)
for i = 1, ITERATIONS_COUNT + 1, 1 do
    local time, methods = doWholeTest(i ~= 1)
    if i ~= 1 then
        timeSum = timeSum + time
        for name, value in pairs(methods) do
            totalOfMethods[name] = totalOfMethods[name] + value
        end
    end
end

print(string.format("Среднее время выполнение тестов -> %f", timeSum / ITERATIONS_COUNT))
print("=================================================")
for methodName, totalElapsedTime in pairs(totalOfMethods) do
    print(string.format("Среднее время %s -> %f", methodName, totalElapsedTime / ITERATIONS_COUNT))
end
print("=================================================")
