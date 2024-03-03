use warnings;
use strict;
opendir DIR1,"/home/adlab/Oncotator_breast_transcriptom/";
mkdir "/home/adlab/Oncotator_breast_transcriptom/corrected_input";
my @files=grep{s/\.txt$//}readdir(DIR1);



map{
my $name=$_;
open FH1,"/home/adlab/Oncotator_breast_transcriptom/$name.txt";
open FH2,">/home/adlab/Oncotator_breast_transcriptom/corrected_input/$name.txt";
my @array=<FH1>; 
foreach my $line(@array){
	chomp($line);
	if($line=~/\#/g){
		print FH2 $line,"\n";
	}
	else
	{
		my @arr=split("\t",$line);
		if($arr[4]=~/,/g){
			my @alt=split(",",$arr[4]);
			for(my $i=0;$i<$#alt+1;$i++){
				print FH2 $arr[0]."\t".$arr[1]."\t".$arr[2]."\t".$arr[3]."\t".$alt[$i],"\n";
			}
		}else{
			print FH2 $line,"\n";
		}
	}
	}
	
}@files;