for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_cp/header_removed_onco_files/* -type f -name "*.maf") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.maf}";
  awk '{print $5"_"$6"_"$12"_"$13,"\t",$0}' $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_cp/header_removed_onco_files/first_key/$file_without_extension"_first_key.maf"
	
done;