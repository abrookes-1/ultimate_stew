function periphSearch(type)
    local names = peripheral.getNames()
    local i, name
    for i, name in pairs(names) do
       if peripheral.getType(name) == type then
          return peripheral.wrap(name)
       end
    end
    return null
 end

 --display text text on monitor, "mon" peripheral
function draw_text(mon, x, y, text, text_color, bg_color)
   mon.monitor.setBackgroundColor(bg_color)
   mon.monitor.setTextColor(text_color)
   mon.monitor.setCursorPos(x,y)
   mon.monitor.write(text)
 end
 
 function draw_text_right(mon, offset, y, text, text_color, bg_color)
   mon.monitor.setBackgroundColor(bg_color)
   mon.monitor.setTextColor(text_color)
   mon.monitor.setCursorPos(mon.X-string.len(tostring(text))-offset,y)
   mon.monitor.write(text)
 end
 
 function draw_text_lr(mon, x, y, offset, text1, text2, text1_color, text2_color, bg_color)
    draw_text(mon, x, y, text1, text1_color, bg_color)
    draw_text_right(mon, offset, y, text2, text2_color, bg_color)
 end


 function scrollText(mon, tStrings, nRate)
   
   if nRate < 0 then
     error("rate must be positive")
   end
   local nSleep = 1 / nRate
   
   width, height = mon.getSize()
   x, y = mon.getCursorPos()
           sText = ""
           for n = 1, #tStrings do
                   sText = sText .. tostring(tStrings[n])
     sText = sText .. " | "
           end
           sString = "| "
           if width / string.len(sText) < 1 then
                   nStringRepeat = 3
           else
                   nStringRepeat = math.ceil(width / string.len(sText) * 3)
           end
   for n = 1, nStringRepeat do
     sString = sString .. sText
   end
   while true do
     for n = 1, string.len(sText) do
      sDisplay = string.sub(sString, n, n + width - 1)
      mon.clearLine()
      mon.setCursorPos(1, y)
      mon.write(sDisplay)
      sleep(nSleep)
     end
   end
   end