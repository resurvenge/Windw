local flux
local path = "libraries" -- Change this to where ever flux is installed in the project
if require(path .. ".flux")  then
      flux = require(path .. ".flux")
else
       flux = {}
end
--[[
      WINDW by kep,
      LOVE2D GUI






      if you're like me and want to do things yourself you can feel free to break this library down and see how it works and try to make your own out of it!
]]

local function rect(x, y, width, height, radius)
    love.graphics.rectangle("fill", x + radius, y + radius, width - (radius * 2), height - radius * 2)
    love.graphics.rectangle("fill", x + radius, y, width - (radius * 2), radius)
    love.graphics.rectangle("fill", x + radius, y + height - radius, width - (radius * 2), radius)
    love.graphics.rectangle("fill", x, y + radius, radius, height - (radius * 2))
    love.graphics.rectangle("fill", x + (width - radius), y + radius, radius, height - (radius * 2))
    love.graphics.arc("fill", x + radius, y + radius, radius, math.rad(-180), math.rad(-90))
    love.graphics.arc("fill", x + width - radius , y + radius, radius, math.rad(-90), math.rad(0))
    love.graphics.arc("fill", x + radius, y + height - radius, radius, math.rad(-180), math.rad(-270))
    love.graphics.arc("fill", x + width - radius , y + height - radius, radius, math.rad(0), math.rad(90))
end
local windw = {}
local Color = {}
local tweenlibrary;
local button_i
local window_i
local title_i


function Color.new(tcolor)
      return love.graphics.setColor(tcolor)
end

function windw.new(window)
              if window and window.x and window.y and window.w and window.h then
                  Color.new(window.color or {0.3, 0.3, 0.3, 0.90})
                        window_i = window
                        window = window_i
                            local frame = rect(window.x, window.y, window.w or 500, window.h or 500, 20);
                      Color.new({1,1,1})
                  return {
                          bnt = function (button)
                              button_i = button
                                B_x = (button.x + window.x)
                                B_y = (button.y + window.y)
                                       if button and button.x and button.y then
                                            Color.new(button.color or button.c or {0.2, 0.2, 0.2, 1})
                                              local button_frame = rect(B_x, B_y, button.w,button.h , button.r or 10)
                                            Color.new({1,1,1})
                              end
                  return {
                              mousepressed = function (callback)
                                    local x,y = love.mouse.getPosition()
                                          if x >= B_x and x <= B_x + button.w then
                                                if y >= B_y and y < B_y + button.h then
                                                      callback()
                                                end
                                           end
                                    end,
                                    title = function (title)
                                          title_i = title
                                    if not title.offset then
                                          title.offset = 0
                                    end
                                      local T_x, T_y = (title.x + button.x + title.offset), (title.y + button.y)
                                          Color.new(title.c or title.color or {1,1,1})
                                          local font;
                                            if not title.usefont then
                                                  font = love.graphics.setFont(love.graphics.newFont(30))
                                            else
                                                 font = title.usefont
                                            end
                                              local title_frame = love.graphics.print(title.text, T_x, T_y)
                                          Color.new({1,1,1})
                                    end,
                                    getX = function ()
                                          return B_x
                                    end,
                                    getY = function ()
                                          return B_y
                                    end
                        }
                              end,
                              mousepressed = function (callback)
                                    local x,y = love.mouse.getPosition()
                                          if x >= window.x and x <= window.x + window.w then
                                                if y >= window.y and y < window.y + window.h then
                                                      callback()
                                                end
                                           end
                                    end,
                              Topbar = function (topbar)
                                     if topbar then
                                            Color.new(topbar.c or topbar.color or {1,1,1})
                                                local topbar_frame = rect(window.x, window.y, window.w or 500, 40, window.r or 20);
                                                local topbarbottom = rect(window.x, window.y + 20, window.w or 500, 20, window.r or 0);
                                            Color.new({1,1,1})
                                     end
                              end,
                              title = function (title)
                                    if not title.offset then
                                          title.offset = 0
                                    end
                                    --  local T_x, T_y = (title.x + window.x + title.offset), (title.y + window.y)
                                          Color.new(title.c or title.color or {1,1,1})
                                          local font;
                                            if not title.usefont then
                                                  font = love.graphics.setFont(love.graphics.newFont(30))
                                            else
                                                 font = title.usefont
                                            end
                                            if not title.offset then
                                                   title.offset = 0
                                            end
                                              local title_frame = love.graphics.print(title.text, window.x + title.x + title.offset, window.y + title.y)
                                          Color.new({1,1,1})
                              end,
                              getWidth = function ()
                                     return window.w
                              end,
                              getX = function ()
                                     return window.x
                              end,
                              getY = function ()
                                    return window.y
                              end,
                              getHeight = function ()
                                    return window.h
                              end

                       }
             end
end


function windw.drag(window, mousepressed)
      local dragging = false
      local isdrag = false
      local dragtimer = 0
      return {
             update = function (dt)
                     if dragtimer > 2 then
                            dragtimer = 2
                     elseif dragtimer < 0 then
                             dragtimer = 0
                     end
                     if isdrag == true then
                          dragtimer = dragtimer + 0.030
                     else
                        dragtimer = dragtimer - 0.010
                     end
                     if dragging == true and dragtimer >= 2 then
                          flux.to(window, 0.2, {x = love.mouse.getX() - 120, y = love.mouse.getY() - 10}, "inSine")
                     end
                    -- flux.update(dt)
             end,
             mousepressed = function ()
                    isdrag = true
                    dragging = true
             end,
             mousereleased = function ()
                   isdrag = false
                   dragging = false
             end
      }
end



function windw.update()
end

return windw
