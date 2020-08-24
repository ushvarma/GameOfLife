# GameOfLife
Each generation, a cell C is alive 1 or dead 0.\
In the next generation each cell C is alive or dead \
depending on a count of its neighbours N\

Now Neighbors           Next\
--- ---------           --------------\
1   0,1             ->  0  # Lonely\
1   4,5,6,7,8       ->  0  # Overcrowded\
1   2,3             ->  1  # Lives\
0   3               ->  1  # It takes three to give birth!\
0   0,1,2,4,5,6,7,8 ->  0  # Barren\
