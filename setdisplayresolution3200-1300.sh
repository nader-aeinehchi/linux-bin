#Copy this script to /etc/profile.d/

#xrandr gives Virtual1 as the display

#cvt 3200 1300 60

#Gives
# 3200x1300 59.97 Hz (CVT) hsync: 80.83 kHz; pclk: 350.50 MHz
#Modeline "3200x1300_60.00"  350.50  3200 3424 3768 4336  1300 1303 1313 1348 -hsync +vsync

xrandr --newmode "3200x1300_60.00"  361.25  3200 3424 3768 4336  1300 1343 1353 1389 -hsync +vsync
xrandr --addmode Virtual1 "3200x1300_60.00"
#xrandr --output Virtual1 --mode 3200x1300_60.00

