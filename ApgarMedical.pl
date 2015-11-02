## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my (@bestData);
use constant BESTDATAIN => "./ApgarMedicalBest.txt";

sub main {
	@bestData = ([0],[0]);
	bestDataIn();
	printBestData();
}

main();

sub bestDataIn {
	my $IN;
	@bestData = ();
	my $counter = 0;
	open ($IN, '<', BESTDATAIN);
	while (<$IN>) {
		chomp ($bestData[$counter] = $_);
		$counter++;
	}
	close $IN;
}

sub printBestData {
	my $size = @bestData;
	for (my $i = 0; $i < $size; $i++) {
		print "\t$bestData[$i]\n";
	}
}

sub sortBest {
	my $size = @bestData;
	my $temp = 0;
	for (my $i; $i < $size; $i++) {
		
	}
}