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