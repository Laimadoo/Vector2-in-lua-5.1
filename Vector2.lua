local map = function(oV, oM, oMx, nM, nMx)
    return ((oV - oM) / (oMx - oM)) * (nMx - nM) + nM
end

local vector2MT
vector2MT = {
    __tostring = function(v)
        return "vector2: " .. v.x .. ", " .. v.y
    end,

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

    __pow = function(v1, v2)
        local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
        local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

        if tv1 == tv2 and tv1 == "vector2" then
            return setmetatable({
                x = v1.x ^ v2.x,
                y = v1.y ^ v2.y
            }, vector2MT)
        elseif tv1 == "vector2" and tv2 == "number" then
            return setmetatable({
                x = v1.x ^ v2,
                y = v1.y ^ v2
            }, vector2MT)
        elseif tv1 == "number" and tv2 == "vector2" then
            return setmetatable({
                x = v2 ^ v1.x,
                y = v2 ^ v1.y
            }, vector2MT)
        end
    end,

    __eq = function(v1, v2)
        local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
        local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

        if tv1 == tv2 and tv1 == "vector2" then
            return v1.x == v2.x and v1.y == v2.y
        end
    end,

    __unm = function(v)
        return setmetatable({
            x = -v.x,
            y = -v.y
        }, vector2MT)
    end,

    __index = {
        magnitude = function(v)
            return math.sqrt(v.x^2 + v.y^2)
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
        end,

        angle = function(v)
            return math.deg(math.atan2(v.y, v.x))
        end,

        rotation = function(v1, v2)
            local tv1 = type(v1) == "table" and getmetatable(v1) == vector2MT and "vector2" or type(v1)
            local tv2 = type(v2) == "table" and getmetatable(v2) == vector2MT and "vector2" or type(v2)

            if tv1 == tv2 and tv1 == "vector2" then
                local aR = math.atan2(v2.y, v2.x) - math.atan2(v1.y, v1.x)
                local l = math.sqrt(v1.x^2 + v1.y^2)
                local nA = math.atan2(v1.y, v1.x) + aR
                return setmetatable({
                    x = l * math.cos(nA),
                    y = l * math.sin(nA)
                }, vector2MT)
            elseif tv1 == "vector2" and tv2 == "number" then
                return setmetatable({
                    x = v1.x * math.cos(v2) - v1.y * math.sin(v2),
                    y = v1.x * math.sin(v2) + v1.y * math.cos(v2)
                }, vector2MT)
            end
        end,

        unpack = function(v)
            return v.x, v.y
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
