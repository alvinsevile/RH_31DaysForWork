# FiveM 31 Days of Work - ESX/QBCore Compatible

This resource for FiveM allows the implementation of temporary jobs on the server, compatible with ESX and QBCore frameworks. Players can purchase a specific job for a limited time, and once that time has elapsed, they are reassigned as unemployed.

# Features

- Compatibility with ESX and QBCore
- Assigns jobs to players for a limited time.
- The assigned job is automatically removed when the time expires.
- Easily configure the job name, duration, price, and map coordinates.
- Receive notifications both when receiving and losing the job.

# Requirements

- es_extended or qb-core

# Installation

- Download or clone this repository into your FiveM resources folder:

```
git clone https://github.com/RHScripts/RH_31DaysForWork.git
```

- Add the resource to your `server.cfg` file:

```
ensure RH_31DaysForWork
```

- Configure the `config.lua` file according to your preferences.

# Configuration

The `config.lua` file includes several options to customize the behavior of the temporary job system:

```
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

```

# Explicación de las opciones:

- Framework: Select between esx or qbcore depending on your server.
- MarkerPos: Coordinates where the marker will appear for players to purchase the job.
- Blip: Configures the appearance and name of the blip on the map.
- JobName: Name of the job that will be assigned to players.
- JobDuration: Duration of the temporary job in days.
- JobPrice: Price that players must pay to acquire the job.

# How It Works

- Players can purchase a temporary job (e.g., Taxi Job) by interacting with a marker on the map.
- The job lasts for a specified period (Configured as 31 days, with an example of 1 minute).
- When the time expires, the player loses the job and is reassigned as unemployed.

# Events and Notifications

- Automatic notifications inform the player when they receive and lose the job.

# Notifications:
- ESX: 
```
TriggerClientEvent('esx:showNotification', ...)
```
- QBCore: 
```
TriggerClientEvent('QBCore:Notify', ...)
```

# Job Purchase Event:

- Players can purchase the job using the event job:purchaseJob.


# Future Modifications
- Add more temporary jobs.
- Improvements in customization.


## Contributions

Contributions are welcome. If you have suggestions or improvements, feel free to fork the project and create a pull request.
License

This project is licensed under the MIT License. You can use, modify, and distribute the code under the terms of this license. For more details, see the LICENSE file.


## MIT License Summary

The MIT License is a free software license that allows users to do almost anything with the software, provided they include the original copyright notice and the license notice in any copies of the software or substantial portions of it.


## MIT License

Copyright (c) 2025 RH Scripts

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
