# Windw
STATUS: DISCONTINUED (FOR NOW)

BUGS TO FIX: BUTTONS NOT WORKING IF YOU CAN FIX PLEASE SEND A PULL REQUEST, thank you.

REQS: IF YOU WANT TO MAKE WINDOWS DRAG, PLEASE DOWNLOAD FLUX 

FLUX LINK: https://github.com/rxi/flux

-------------------------
# DEVLOGS

* will be working on a fix for the buttons if you have a fix please dm me on discord (discord: "kepwastaken" or if that doesnt work try "2.ik.2").

* will add more things to README for further information and usage.

-----------------------------------------
**Windw** is a love2d gui library that allows you to create a multitude of various things using love2d


## Instillation

To install **windw** you need to follow these steps:

1. Download the zip file
2. Unzip the file
3. Go to the windw folder and put the windw file to your love2d projec

## Creating Windows

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

* To create a window you will need to put the function ```windw.new``` in your love2d draw function

```lua

local windowvalues = {
       x = 100,
       y = 100,
       w = 200,
       h = 250,
       color = {0.3, 0.3, 0.3}
}

function love.draw() 
       window = windw.new(windowvalues)
end

```
## Creating window topbars

* To create a topbar you will need to do the ``window.topbar`` function in your love2d draw function

```lua

local windowvalues = {
       x = 100,
       y = 100,
       w = 200,
       h = 250,
       color = {0.3, 0.3, 0.3}
}

function love.draw()
      window = windw.new(windowvalues)
      window.Topbar({ color = {0.2, 0.2, 0.2} })
end

```
## Creating Titles

* To create a title you will need to do the ``window.title`` function in your love2d draw function

```lua

local windowvalues = {
       x = 100,
       y = 100,
       w = 200,
       h = 250,
       color = {0.3, 0.3, 0.3}
}

function love.draw()
      window = windw.new(windowvalues)
      window.Topbar({ color = {0.2, 0.2, 0.2} })
      window.title({ x = 0, y = 0, text = "Menu" , offset = 50, usefont = love.graphics.setFont(love.graphics.newFont(10))})
end

```
the x value is the position but being added by a certain number, the y value is the position but being added by a certain number, and the offset value is amount that the text is away from the text's original position



