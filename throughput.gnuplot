set terminal pdfcairo enhanced color transparent rounded

set key outside center top horizontal reverse Left samplen 2
unset border
set xtics scale 0
set ytics scale 0
set grid ytics linewidth 1 linetype -1

set style line 1 lt 1 lc rgbcolor "#3465a4" lw 2.5 pt 7 ps 1
set style line 2 lt 1 lc rgbcolor "#edd400" lw 2.5 pt 7 ps 1
set style line 3 lt 1 lc rgbcolor "#888a85" lw 2.5 pt 5 ps 1
set style line 4 lt 1 lc rgbcolor "#f57900" lw 2.5 pt 5 ps 1
set style line 5 lt 1 lc rgbcolor "#ad7fa8" lw 2.5 pt 9 ps 1
set style line 6 lt 1 lc rgbcolor "#4e9a06" lw 2.5 pt 9 ps 1
set style line 7 lt 1 lc rgbcolor "#ef2929" lw 2.5 pt 1 ps 1
set style line 8 lt 1 lc rgbcolor "#5c3566" lw 2.5 pt 1 ps 1
set style line 9 lt 1 lc rgbcolor "#c17d11" lw 2.5 pt 3 ps 1
set style line 10 lt 1 lc rgbcolor "#dce775" lw 2.5 pt 3 ps 1

set term pdf
set xlabel "N connections"
set ylabel "requests/sec"
set yrange [0:15000]

set label 1 \
          "N CPUs = 8" \
          at 32,9000 right
set output "throughput-no-keep-alive.pdf"
plot "throughput.data" using 1:2:xtic(1) \
       title "1 worker" \
       linestyle 5 \
       with lines, \
     "throughput.data" using 1:3:xtic(1) \
       title "4 workers" \
       linestyle 2 \
       with lines, \
     "throughput.data" using 1:4:xtic(1) \
       title "8 workers" \
       linestyle 1 \
       with lines

set label 1 \
          "N workers = 8 (= N CPUs)" \
          at 32,3000 right
set output "throughput-with-keep-alive.pdf"
plot "throughput.data" using 1:4:xtic(1) \
       title "No keep-alive" \
       linestyle 1 \
       with lines, \
     "throughput.data" using 1:5:xtic(1) \
       title "With keep-alive" \
       linestyle 4 \
       with lines
