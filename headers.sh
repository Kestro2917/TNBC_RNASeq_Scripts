#mkdir /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/recurrence/first_key/second_key
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_cp/* -type f -name "*.maf") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.maf}";
  grep "^#" $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_cp/headers_of_onco_files/$file_without_extension"_header.txt"
	
done;