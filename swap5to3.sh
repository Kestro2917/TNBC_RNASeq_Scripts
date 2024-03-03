##swaping the 5th col to 3rd col

#mkdir /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/procss3/process4
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/procss3/* -type f -name "*.txt") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.txt}";
   awk '{print $1,"\t",$2,"\t",$5,"\t",$3,"\t",$4}' $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/input_files/process_onco/rm_underscr/procss3/process4/$file_without_extension"pro3.txt"
	
done;