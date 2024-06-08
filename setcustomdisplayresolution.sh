#Copy this script to /etc/profile.d/

#xrandr gives Virtual1 as the display

#cvt 3200 1300 60
#Gives
# 3200x1300 59.97 Hz (CVT) hsync: 80.83 kHz; pclk: 350.50 MHz
#Modeline "3200x1300_60.00"  350.50  3200 3424 3768 4336  1300 1303 1313 1348 -hsync +vsync

#cvt 5000 1340 60
#Gives
# 5000x1340 59.97 Hz (CVT) hsync: 83.30 kHz; pclk: 565.75 MHz
#Modeline "5000x1340_60.00"  565.75  5000 5360 5896 6792  1340 1343 1353 1389 -hsync +vsync

#cvt 5040 1340 60
#Gives
# 5040x1340 59.99 Hz (CVT) hsync: 83.32 kHz; pclk: 569.25 MHz
#Modeline "5040x1340_60.00"  569.25  5040 5392 5936 6832  1340 1343 1353 1389 -hsync +vsync

#cvt 5000 1300 60
# 5000x1300 59.97 Hz (CVT) hsync: 80.84 kHz; pclk: 547.75 MHz
#Modeline "5000x1300_60.00"  547.75  5000 5352 5888 6776  1300 1303 1313 1348 -hsync +vsync

#cvt 5040 1300 60
#Gives
# 5040x1300 59.97 Hz (CVT) hsync: 80.83 kHz; pclk: 552.25 MHz
#Modeline "5040x1300_60.00"  552.25  5040 5392 5936 6832  1300 1303 1313 1348 -hsync +vsync



xrandr --newmode "3200x1300_60.00"  361.25  3200 3424 3768 4336  1300 1343 1353 1389 -hsync +vsync
xrandr --addmode Virtual1 "3200x1300_60.00"


xrandr --newmode "5000x1340_60.00" 565.75  5000 5360 5896 6792  1340 1343 1353 1389 -hsync +vsync
xrandr --addmode Virtual1 "5000x1340_60.00"

xrandr --newmode "5040x1340_60.00" 569.25  5040 5392 5936 6832  1340 1343 1353 1389 -hsync +vsync
xrandr --addmode Virtual1 "5040x1340_60.00"

xrandr --newmode "5000x1300_60.00" 547.75  5000 5352 5888 6776  1300 1303 1313 1348 -hsync +vsync
xrandr --addmode Virtual1 "5000x1300_60.00"

xrandr --newmode "5040x1300_60.00" 552.25  5040 5392 5936 6832  1300 1303 1313 1348 -hsync +vsync
xrandr --addmode Virtual1 "5040x1300_60.00"


#xrandr --output Virtual1 --mode 3200x1300_60.00

