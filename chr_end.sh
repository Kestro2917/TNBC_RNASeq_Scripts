##calculate the end value using the formula length($3)+$2-1


#mkdir /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/procss3
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/* -type f -name "*.txt") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.txt}";
   awk '{print $1,"\t",$2,"\t",$3,"\t",$4,"\t",$5=length($3)+$2-1}' $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/procss3/$file_without_extension"pro3.txt"
	
done;