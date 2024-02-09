# Windw

**Windw** is a love2d gui library that allows you to create a multitude of various things using love2d, this library REQUIRES flux rxi


## Instillation

To install **windw** you need to download the code then take the windw file and put it in your love2d project

## Usage

First you need to set a table of the values that you want for example:

```lua
local windowvalues = {
       x = 100,
       y = 100,
       w = 200,
       h = 250,
       color = {0.3, 0.3, 0.3}
}

```

* To create a window you will need to put the function ```lua windw.new(windowvalues)`` in your love2d draw function

```lua

local windowvalues = {
       x = 100,
       y = 100,
       w = 200,
       h = 250,
       color = {0.3, 0.3, 0.3}
}

function love.draw() 
       local window = windw.new(windowvalues)
end

```
