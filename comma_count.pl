use warnings;
use strict;
opendir DIR1,"/media/LUN2/breast_analysis/20151124/20151222_rec_onco_pross/";
mkdir "/media/LUN2/breast_analysis/20151124/20151222_rec_onco_pross/corrected_input";
my @files=grep{s/\.txt$//}readdir(DIR1);



map{
my $name=$_;
open FH1,"/media/LUN2/breast_analysis/20151124/20151222_rec_onco_pross/$name.txt";
open FH2,">/media/LUN2/breast_analysis/20151124/20151222_rec_onco_pross/corrected_input/$name.txt";
my @array=<FH1>; 
foreach my $line(@array){
	chomp($line);
	
	
		my @arr=split("\t",$line);
		if($arr[1]=~/,/g){
			my @alt=split(",",$arr[1]);
			 print FH2 $arr[0]."\t".$arr[1]."\t".(($#alt)+1),"\n";
		}else{
			print FH2 $arr[0]."\t".$arr[1]."\t".1,"\n";
		}
	}
	
}@files;