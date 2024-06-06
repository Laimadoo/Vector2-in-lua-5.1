local json = require("json")
local Vector2 = require("Vector2")

-- creating a vector
local a = Vector2(3, 4)
local b = Vector2(-2, 4)

-- addition
local c = a + b
print(json.encode(c))

-- subtraction
local c = b - a
print(json.encode(c))

-- multiplication
local c = 3 * b
print(json.encode(c))

-- division
local c = a / 2
print(json.encode(c))

-- lenght
print(c:magnitude())

-- normalization
c:normalized()
print(json.encode(c))

-- scalar product
local c = a:dot(b)
print(json.encode(c))

-- vector product
local c = a:cross(b)
print(json.encode(c))