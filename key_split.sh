#split the key having underscore

mkdir /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/recurrence/process_onco/rm_underscr
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/recurrence/process_onco/* -type f -name "*.txt") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.txt}";
   awk -F "_" '{print $1"\t"$2"\t"$3"\t"$4}' $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/recurrence/process_onco/rm_underscr/$file_without_extension"pro2.txt"
	
done;