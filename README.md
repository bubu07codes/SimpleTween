𝗦𝗶𝗺𝗽𝗹𝗲𝗧𝘄𝗲𝗲𝗻

READ THE LISENCE SCRIPT FOR LISENCE!

A Roblox module for creating and playing tweens simply!

𝗙𝗨𝗡𝗖𝗧𝗜𝗢𝗡𝗦:

`module.createTween(instance: Instance, goal: Table, duration: number, play: boolean)`

`instance` - the instance to tween
`goal` - a table of properties and their values
`duration` - (optional, Default is 1) the duration of the tween in seconds
`play` - (optional, Default is true) immediately play the tween or not

EXAMPLE:


    local module = require(ServerScriptService.SimpleTween.Main)
    
    module.createTween(workspace.Part, {Color = Color3.new(1,0,0)}, 5, true)
    
