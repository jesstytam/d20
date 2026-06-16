local dice = require("lua.dice")

describe("roll_d20", function ()
    it("should return a random number between 1 and 20 inclusive", function ()
        local result = dice.roll_d20()
        assert.is_true(result>=1)
        assert.is_true(result<=20)
    end)
end)