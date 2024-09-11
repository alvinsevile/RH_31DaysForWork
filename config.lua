Config = {}

Config.Framework = 'esx' -- Or 'qbcore'

-- Marker Configuration
-- MARKERS: https://docs.fivem.net/docs/game-references/markers/
Config.MarkerPos = vector3(100.0, -1000.0, 28.0) -- Change coordinates as needed
Config.MarkerSize = vector3(1.5, 1.5, 1.5) -- Change marker size as needed
Config.MarkerColor = {r = 0, g = 255, b = 0, a = 100} -- Change marker color as needed
Config.MarkerType = 1  -- Change marker type as needed

-- Blip Configuration
-- BLIPS: https://docs.fivem.net/docs/game-references/blips/
Config.Blip = {
    Pos = vector3(100.0, -1000.0, 28.0),
    Sprite = 280,
    Display = 4,
    Scale = 1.0,
    Colour = 2,
    Name = "Taxi Job"
}

-- Job Configuration
Config.JobName = 'taxi'
Config.JobDuration = 31 -- In real days / client.lua line 43
Config.JobPrice = 150000 -- Price to acquire the job
