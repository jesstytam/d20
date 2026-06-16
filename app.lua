--say hello

today = os.date("%A, %m %B %Y")
print("Hello! Today is", today, ".")
print("Press ENTER to roll your D20!")

--generate a random value between 1 & 20
--do NOT set seed!

function roll_d20()

    roll_value = math.random(1, 20)
    roll_value_int = tonumber(roll_value)
    return roll_value_int

end

--roll d20

while true do

    local input = io.read() --this waits for the ENTER

    if input=="q" then
        print("Goodbye adventurer!")
        break
    end

    local dice_value = roll_d20() --set value variable

    print(dice_value, "\n")

    if dice_value==1 then
        print("Wow... A nat 1... Better luck next time...")
    elseif dice_value==20 then
        print("Congratulations! A nat 20!")
    else
        print("Ta-da!")
    end

    print("Press ENTER to roll again, or type q to quit")

end