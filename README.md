# Stoic-Elevators
A Simple oxlib elevator system.
![STOIC (9)](https://github.com/TheStoicBear/Stoic-Elevators/assets/112611821/dc3bce1e-c077-49d3-987d-2c7fe0134733)


```lua
Config = {
    -- Define houses and their floors with XYZH coordinates
    houses = {
        ["Parking Garage"] = { -- You can use Spaces if you wish.
            Floors = {
                Floor1 = { x = -292.91, y = -780.73, z = 33.96, h = 155.91 },
                Floor2 = { x = -292.91, y = -780.73, z = 38.78, h = 158.74 },
                Floor3 = { x = -292.91, y = -780.73, z = 43.60, h = 158.74 },
                Floor4 = { x = -292.96, y = -780.80, z = 48.42, h = 147.40 }
            }
        },

        ["House2"] = {
            Floors = {
                Basement = { x = 200.0, y = 300.0, z = 20.0, h = 0.0 },
                GroundFloor = { x = 200.0, y = 300.0, z = 50.0, h = 0.0 },
                FirstFloor = { x = 200.0, y = 300.0, z = 100.0, h = 0.0 }
            }
        }
    }
}
```
