local Vector2 = require("Vector2")

-- creating a vector
local a = Vector2(3, 4)
local b = Vector2(-2, 4)

-- tostring
print(a, b)

-- addition
local c = a + b
print(c)

-- subtraction
local c = b - a
print(c)

-- multiplication
local c = 3 * b
print(c)

-- division
local c = a / 2
print(c)

-- power
local c = a^2
print(c)

-- unary minus
local c = -b
print(c)

-- normalization
c:normalized()
print(c)

-- rotation
c = b:rotation(math.rad(45))
print(c)

-- equal
print(a == b)

-- lenght
print(a:magnitude())

-- angle
print(a:angle())

-- scalar product
local c = a:dot(b)
print(c)

-- vector product
local c = a:cross(b)
print(c)
