## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my (@data, @years);
use constant BESTDATAIN => "./ApgarMedicalBest.txt";
use constant CUSHINGDATAIN => "./ApgarMedicalCushing.txt";
use constant SORTEDDATAOUT => "./ApgarMedicalSORTED.txt";
use constant COLUMNS => 3;

sub main {
	@data = ([0],[0]);
	@years = ([0],[0]);
	readDataIn();
	populateYears();
	findYear();
	#printData();
	dataOut();
	
}

main();

sub populateYears {
	my $size = @data;
	for (my $i = 0; $i < $size; $i++){
		$years[$i][0] = $data[$i][2];
		$years[$i][1] = 0;
	}
}

sub findYear {
	my $size = @years;
	use constant YEAR => 2;
	my @temp;
	my $counter = 0;
	for (my $i = 0; $i < $size; $i++){
		if ($data[$i][YEAR] == $years[$counter][0]){
			$years[$counter][1]++;
		} else {
			$counter++;
			$years[$counter][0] = $data[$i][YEAR];
			$years[$counter][1] = 1;
		}
		
	}
}

sub dataOut {
	my $size = @years;
	my $OUT;
	open ($OUT, ">>", SORTEDDATAOUT);
	for (my $i = 0; $i < $size; $i++) {
		print ($OUT $years[$i]);
	}
	close ($OUT);
}



sub readDataIn {
	my $IN;
	my $counter = 0;
	my @tempData = ();
	@data = ();
	open ($IN, '<', BESTDATAIN);
	while (<$IN>) {
		@tempData = split(/,/);
		for (my $i = 0; $i < COLUMNS; $i++){
			chomp ($data[$counter][$i] = $tempData[$i]);
		}
		$counter++;
	}
	close $IN;
	open ($IN, '<', BESTDATAIN);
	while (<$IN>) {
		@tempData = split(/,/);
		for (my $i = 0; $i < COLUMNS; $i++){
			chomp ($data[$counter][$i] = $tempData[$i]);
		}
	}
}

sub printData {
	my $size = @years;
	for (my $i = 0; $i < $size; $i++){
		print "$years[$i][0] $years[$i][1]\n";
		
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
