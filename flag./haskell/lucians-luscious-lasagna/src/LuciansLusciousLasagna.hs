module LuciansLusciousLasagna (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes) where


-- TODO: define the expectedMinutesInOven constant
expectedMinutesInOven :: Int
expectedMinutesInOven = 40


-- TODO: define the preparationTimeInMinutes function
preparationTimeInMinutes x = x * 2

-- TODO: define the elapsedTimeInMinutes function
elapsedTimeInMinutes x y = preparationTimeInMinutes x + expectedMinutesInOven - y


