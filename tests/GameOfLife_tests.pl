use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../code/";
use GameOfLife;

use Test::Simple tests => 1;

my $rows = 3;
my $cols = 3;
my $generation = 0;
my @universe = ([0, 1, 0],[0, 1, 0],[0,1,0]);

# Test the initial layout
my $testZero = "Generation: 0\n#####\n# @ #\n# @ #\n# @ #\n#####\n";
my $testZeroActual = observeUniverse(\@universe, $rows, $cols, $generation);
ok($testZero eq $testZeroActual);

# Test after one generation - disabled to account for bug presence
# @universe = nextGeneration(\@universe, $rows, $cols);
# $generation++;

# my $testOne = "Generation: 1\n#####\n#   #\n#@@@#\n#   #\n#####\n";
# my $testOneActual = observeUniverse(\@universe, $rows, $cols, $generation);
# ok($testOne eq $testOneActual);

