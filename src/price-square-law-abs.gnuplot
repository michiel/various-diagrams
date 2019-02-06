set terminal pngcairo size 1000,800 enhanced font 'Verdana,14'

set output 'out/price-square-law-abs.png'

set border linewidth 1.5

set title "Number of people that contribute to the total"

set ylabel '%'
set xlabel 'Domain size'

# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
set logscale xy

# Grid
set style line 12 lc rgb'#808080' lt 0 lw 1
set grid back ls 12

set style fill noborder
set style function filledcurves y1=0
set clip two

PoolSize50(x) = sqrt(x)
PoolSize25(x) = sqrt(x - PoolSize50(x))
PoolSize12(x) = sqrt(x - PoolSize25(x))

CompetencePCT50(x) = PoolSize50(x)
CompetencePCT25(x) = PoolSize25(x) + CompetencePCT50(x)
CompetencePCT12(x) = PoolSize12(x) + CompetencePCT25(x)

set yrange [1:10000]
set xrange [4:10000]

unset colorbox

set lmargin 10
plot CompetencePCT12(x) fs transparent solid 0.30 lc rgb "green" title 'Number contributing 12.5%', \
     CompetencePCT25(x) fs transparent solid 0.60 lc rgb "blue" title 'Number contributing 25%', \
     CompetencePCT50(x) fs transparent solid 0.90 lc rgb "red" title 'Number contributing 50%'



