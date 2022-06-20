reset
set terminal epslatex standalone color size 5.0,3.5 font ',17.28'
set output 'result.tex'

set xlabel '$x$'
set ylabel '$y$'

set xrange [0.0:2.*pi]
set yrange [-1.1:1.1]

set xtics ('$0$' 0., '$\pi$' pi, '$2 \pi$' 2.*pi)
set ytics 0.5

set style line 1 lc rgb '#FF0000' lw 5 dt 1
set style line 2 lc rgb '#0000FF' lw 5 dt 2

set key top right spacing 1.2

plot \
  sin(x) t '$\sin \left( x \right)$' ls 1 w l, \
  cos(x) t '$\cos \left( x \right)$' ls 2 w l

