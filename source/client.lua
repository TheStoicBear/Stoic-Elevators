local currentHouse = nil
local currentFloor = nil

-- Function to teleport player to specified coordinates with screen fading
local function teleportPlayer(coords)
    -- Fade out screen
    DoScreenFadeOut(3500)
    -- Implement teleportation logic
    Citizen.Wait(3500) -- Wait for the screen to fade out completely before teleporting
    -- Teleport the player
    SetEntityCoordsNoOffset(PlayerPedId(), coords.x, coords.y, coords.z, coords.h, false, false, false)
    -- Fade in screen
    DoScreenFadeIn(2500)
end

-- Function to display floor selection menu
local function showFloorMenu(house)
    local options = {}
    -- Sort the floors based on their keys
    local sortedFloors = {}
    for floor, coords in pairs(Config.houses[house].Floors) do
        table.insert(sortedFloors, floor)
    end
    table.sort(sortedFloors)
    -- Insert the sorted floors into the options table
    for _, floor in ipairs(sortedFloors) do
        local coords = Config.houses[house].Floors[floor]
        table.insert(options, {
            title = "Go to " .. floor,
            onSelect = function()
                teleportPlayer(coords)
                showFloorMenu(house)  -- Display menu again for the selected house
            end
        })
    end

    lib.registerContext({
        id = "elevator_menu_" .. house,
        title = "Elevator Menu - " .. house,
        options = options,
        canClose = true
    })

    lib.showContext("elevator_menu_" .. house)
end

-- Define zone boxes for each house floor
local zoneBoxes = {}
for house, floors in pairs(Config.houses) do
    for floor, coords in pairs(floors.Floors) do
        zoneBoxes[house .. "_" .. floor] = lib.zones.box({
            coords = vector4(coords.x, coords.y, coords.z, coords.h),
            size = vector3(1, 1, 1),
            onEnter = function()
                if currentHouse ~= house then
                    showFloorMenu(house)
                end
            end,
            onExit = function()
                -- You can implement any logic here when the player exits the zone
            end
        })
    end
end

-- Event handler for player entering XYZH
RegisterNetEvent("playerEnteredXYZH")
AddEventHandler("playerEnteredXYZH", function(x, y, z, h, house)
    if Config.houses[house] then
        showFloorMenu(house)
    else
        print("House not found.")
    end
end)