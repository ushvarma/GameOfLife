[![Build Status](https://travis-ci.com/ushvarma/GameOfLife.svg?token=FyXyady7mYxUKsbL9qay&branch=master)](https://travis-ci.com/ushvarma/GameOfLife)

# GameOfLife
The Game of Life is a cellular automaton devised by the British mathematician John Horton Conway in 1970. It is a zero-player game, meaning that its evolution is determined by its initial state, requiring no further input. One interacts with the Game of Life by creating an initial configuration and observing how it evolves.

Each generation, a cell C is alive 1 or dead 0.\
In the next generation each cell C is alive or dead \
depending on a count of its neighbours N

Now Neighbors           Next\
--- ---------           --------------\
1   0,1             ->  0  # Lonely\
1   4,5,6,7,8       ->  0  # Overcrowded\
1   2,3             ->  1  # Lives\
0   3               ->  1  # It takes three to give birth!\
0   0,1,2,4,5,6,7,8 ->  0  # Barren

Example of one Instance of Game of Life:

![](ZRY1IlT.gif)


## Steps for executing the code:

1. Visit the link https://www.onlinegdb.com/

2. Select the programming language on the top right corner(Ruby,Pearl,Go).

3. Copy the respective progamming languge code for the game of life present in the code folder.

4. Click on run at the top and check the output screen as the game of life is displayed.
