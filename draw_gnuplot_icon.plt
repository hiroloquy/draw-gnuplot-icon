reset

set term qt size 400, 400 font "Times, 20"

dx = 70.3
dy = 82.0

xmin = -56.0
xmax = 232.0
ymin = -67.0
ymax = 221.0

set xr[xmin:xmax]
set yr[ymin:ymax]
set size ratio -1
unset key
unset tics

lineWidth = 8

# Axis
set arrow 1 nohead from 0, ymin+1 to 0, ymax-1 lw lineWidth lt -1 front
set arrow 2 nohead from xmin+1, 0 to xmax-1, 0 lw lineWidth lt -1 front
set border lw lineWidth

# Grid
do for [i=1:3:1]{ # x-axis
    set arrow i+2 nohead from dx*i, ymin+1 to dx*i, ymax-1 lw lineWidth lc rgb 'gray' back
}
do for [i=1:2:1]{ # y-axis
    set arrow i+5 nohead from xmin+1, dy*i to xmax-1, dy*i lw lineWidth lc rgb 'gray' back
}

# Graphs
plot 'pos.txt' using 1:2 w l lw lineWidth lc rgb 'green', \
     'pos.txt' using 3:4 w l lw lineWidth lc rgb 'red', \
     'pos.txt' using 5:6 w l lw lineWidth lc rgb 'blue'

# Output PNG image
set term pngcairo size 400, 400 font "Times, 20"
set output 'icon_pngcairo.png'
replot
set out
