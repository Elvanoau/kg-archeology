Config = {}

Config.Debug = false

Config.Setup = {
    useBothItems = true,        -- If you want to use the trowel and brush
    trowelName = "",      -- Name Of Your Trowel Item
    brushName = "",       -- If useBothItems is false you can set this to nil
    searchTime = {
        stage1 = 25,        -- In Seconds
        stage2 = 10,        -- In Seconds
    },
}

Config.Zone = {
    coords = vector3(0.0, 0.0, 0.0)
    radius = 30.0,
}

Config.Rewards = {      -- Rewards Chance Has To Equal 100
    ["Ammonite"] = {
        chance = 14,
        item = "ammonite",
    },
    ["Argopecten"] = {
        chance = 16,
        item = "argopecten",
    },
    ["Viviparus"] = {
        chance = 40,
        item = "viviparus",
    },
    ["Inoceramus"] = {
        chance = 30,
        item = "inoceramus",
    },
}