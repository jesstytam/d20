local D = {}

function D.roll_d20()

    roll_value = math.random(1, 20)
    roll_value_int = tonumber(roll_value)
    return roll_value_int

end

return D