use warnings;
use strict;

use List::Util qw[min max];
use Time::HiRes qw(usleep);

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
    my ($universeRef, $rows, $cols, $generation) = @_;
    my @universe = @$universeRef;
    system("clear"); # works on *nix systems
    print("Generation: ", $generation, "\n");
    foreach my $row (0 .. $rows-1) {
        foreach my $col (0 .. $cols-1) {
            print($universe[$row][$col] ? "@" : " ");
        }
        print("\n");
    }
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
printUniverse(\@universe, $rows, $cols, 0);

foreach my $generation (1 .. $generations-1) {
    usleep(500*1000);   # 500ms
    @universe = nextGeneration(\@universe, $rows, $cols);
    printUniverse(\@universe, $rows, $cols, $generation);
}
