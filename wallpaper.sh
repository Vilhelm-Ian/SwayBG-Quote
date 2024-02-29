#!/usr/bin/env fish
set quote (cat ./quotes.txt | shuf -n 1)
set image ~/Pictures/wallpapers/(ls ~/Pictures/wallpapers | shuf -n 1)
set len 0
set result ''
echo $quote
set width (identify -format '%w' $image)
echo $width
for i in (string split ' ' $quote)
       set len (math $len + (string length $i))
       echo $result
       if test $len -gt 40
         set len 0
         set result "$result
$i"
       else
         set result "$result $i"
       end
end
convert $image -fill white -stroke black -strokewidth 1 -font Helvetica -pointsize (math $width / 50) -gravity south -annotate +0+80 $result background.jpg
swaybg -i ./background.jpg -m fit
