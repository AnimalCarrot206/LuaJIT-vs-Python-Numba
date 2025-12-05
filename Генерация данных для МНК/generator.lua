local random = math.random
-- Функция генерации данных для метода наименьших квадратов (МНК)
-- Генерирует данные по формулам, представленным в системе (1)
return function(n)
    local test_cases_x = {}
    local test_cases_y = {}

    for i = 1, n, 1 do
        local x = i * 0.5
        local y = 2 * x + 3 + (random() - 0.5) * 4

        table.insert(test_cases_x, x)
        table.insert(test_cases_y, y)
    end
    return test_cases_x,  test_cases_y
end