for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_cp/header_removed_onco_files/first_key/second_key/* -type f -name "*.maf") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.maf}";
  awk '{print NF}' $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_cp/header_removed_onco_files/first_key/second_key/col_no_all_files/$file_without_extension"_column_no.txt"
	
done;