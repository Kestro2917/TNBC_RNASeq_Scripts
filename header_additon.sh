#mkdir /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/procss3/process4/process5
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/procss3/process4/* -type f -name "*.txt") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.txt}";
   awk 'BEGIN{print "chr""\t""start""\t""end""\t""ref_allele""\t""alt_allele"}1' $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/procss3/process4/process5/$file_without_extension"pro5.txt"
	
done;