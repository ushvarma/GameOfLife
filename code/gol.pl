use warnings;
use strict;

use List::Util qw[min max];

sub createUniverse {
    my ($rows, $cols) = @_;
    my @universe;
    foreach (0..$rows-1){
        my @row;
        push(@row, (rand(1) < 0.5) ? 1 : 0 ) foreach (1..$cols);
        push(@universe, [@row]);
    }
    return @universe;
}

sub createEmptyUniverse {
    my ($rows, $cols) = @_;
    my @universe;
    foreach (0..$rows-1){
        my @row;
        push(@row, 0) foreach (1..$cols);
        push(@universe, [@row]);
    }
    return @universe;
}

sub printUniverse {
    my ($universeRef, $rows, $cols) = @_;
    my @universe = @$universeRef;
    foreach my $row (0 .. $rows-1) {
        foreach my $col (0 .. $cols-1) {
            print($universe[$row][$col] ? "@" : " ");
        }
        print("\n");
    }
    foreach (0..$cols-1) {
        print("=")
    }
    print("\n")
}

sub nextGeneration {
    my ($oldUniverseRef, $rows, $cols) = @_;
    my @oldUniverse = @$oldUniverseRef;
    my @newUniverse = createEmptyUniverse($rows, $cols);
    
    foreach my $row (0 .. $rows-1) {
        foreach my $col (0 .. $cols-1) {
            my $sum = 0;
            for (my $i = max(0, $row-1); $i <= min($row+1, $rows-1); $i++) {
                for (my $j = max(0, $col-1); $j <= min($col+1, $cols-1); $j++) {
                    if ($i != $row || $j != $col) {
                        $sum += $oldUniverse[$i][$j];
                    }
                }
            }

            if ($sum == 3 || $oldUniverse[$row][$col] && $sum == 2) {
                $newUniverse[$row][$col] = 1;
            }
        }
    }
    return @newUniverse;
}

my ($rows, $cols, $generations) = @ARGV;

my @universe = createUniverse($rows, $cols);
printUniverse(\@universe, $rows, $cols);

foreach (0 .. $generations-1) {
    sleep .5;
    @universe = nextGeneration(\@universe, $rows, $cols);
    printUniverse(\@universe, $rows, $cols);
}
