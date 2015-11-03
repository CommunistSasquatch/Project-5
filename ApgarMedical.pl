## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my (@data);
use constant BESTDATAIN => "./ApgarMedicalBest.txt";
use constant CUSHINGDATAIN => "./ApgarMedicalCushing.txt";
use constant COLUMNS => 3;

sub main {
	@data = ([0],[0]);
	dataIn();
	printData();
}

main();

sub dataIn {
	my $IN;
	@data = ();
	my $counter = 0;
	open ($IN, '<', BESTDATAIN);
	while (<$IN>) {
		chomp ($data[$counter] = $_);
		$counter++;
	}
	close $IN;
	open ($IN,'<', CUSHINGDATAIN);
	while (<$IN>) {
		chomp ($data[$counter] = $_);
		$counter++;
	}
}

sub printData {
	my $size = @data;
	for (my $i = 0; $i < $size; $i++) {
		print "\t$data[$i]\n";
	}
}

sub sortData {
	use constant YEAR => 2;
	my $size = @data;
	my @temp;
	for (my $i = 0; $i < $size; $i++) {
		my $j = $i;
		while ($j > 0 && $data[$j][YEAR] < $data[$j - 1][YEAR]) {
			for (my $k = 0; $k < COLUMNS; $k++) {
				$temp[$k] = $data[$j][$k];
				$data[$j][$k] = $data[$j - 1][$k];
				$data[$j - 1][$k] = $temp[$k];
			}
			$j--;
		}
	}
}