for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_cp/* -type f -name "*.maf") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.maf}";
  egrep -v "^#" $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_cp/header_removed_onco_files/$file_without_extension"_header_removed.maf"
	
done;