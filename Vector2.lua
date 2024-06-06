local vector2MT
vector2MT = {
    __add = function(v1, v2)
        local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
        local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

        if tv1 == tv2 and tv1 == "vector2" then
            return setmetatable({
                x = v1.x + v2.x,
                y = v1.y + v2.y
            }, vector2MT)
        elseif tv1 == "vector2" and tv2 == "number" then
            return setmetatable({
                x = v1.x + v2,
                y = v1.y + v2
            }, vector2MT)
        elseif tv1 == "number" and tv2 == "vector2" then
            return setmetatable({
                x = v1 + v2.x,
                y = v1 + v2.y
            }, vector2MT)
        end
    end,

    __sub = function(v1, v2)
        local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
        local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

        if tv1 == tv2 and tv1 == "vector2" then
            return setmetatable({
                x = v1.x - v2.x,
                y = v1.y - v2.y
            }, vector2MT)
        elseif tv1 == "vector2" and tv2 == "number" then
            return setmetatable({
                x = v1.x - v2,
                y = v1.y - v2
            }, vector2MT)
        elseif tv1 == "number" and tv2 == "vector2" then
            return setmetatable({
                x = v1 - v2.x,
                y = v1 - v2.y
            }, vector2MT)
        end
    end,

    __mul = function(v1, v2)
        local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
        local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

        if tv1 == tv2 and tv1 == "vector2" then
            return setmetatable({
                x = v1.x * v2.x,
                y = v1.y * v2.y
            }, vector2MT)
        elseif tv1 == "vector2" and tv2 == "number" then
            return setmetatable({
                x = v1.x * v2,
                y = v1.y * v2
            }, vector2MT)
        elseif tv1 == "number" and tv2 == "vector2" then
            return setmetatable({
                x = v1 * v2.x,
                y = v1 * v2.y
            }, vector2MT)
        end
    end,

    __div = function(v1, v2)
        local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
        local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

        if tv1 == tv2 and tv1 == "vector2" then
            return setmetatable({
                x = v1.x / v2.x,
                y = v1.y / v2.y
            }, vector2MT)
        elseif tv1 == "vector2" and tv2 == "number" then
            return setmetatable({
                x = v1.x / v2,
                y = v1.y / v2
            }, vector2MT)
        elseif tv1 == "number" and tv2 == "vector2" then
            return setmetatable({
                x = v1 / v2.x,
                y = v1 / v2.y
            }, vector2MT)
        end
    end,

    __index = {
        magnitude = function(v)
            return math.sqrt(v.x ^ 2 + v.y ^ 2)
        end,

        normalized = function(v)
            local m = math.sqrt(v.x ^ 2 + v.y ^ 2)
            v.x = v.x / m
            v.y = v.y / m
        end,

        dot = function(v1, v2)
            local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
            local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

            if tv1 == tv2 and tv1 == "vector2" then
                return v1.x * v2.x + v1.y * v2.y
            end
        end,

        cross = function(v1, v2)
            local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
            local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

            if tv1 == tv2 and tv1 == "vector2" then
                return v1.x * v2.y - v1.y * v2.x
            end
        end

    }
}

local Vector2 = function(x, y)
    return setmetatable({
        x = type(x) == "number" and x or 0,
        y = type(y) == "number" and y or 0
    }, vector2MT)
end

return Vector2