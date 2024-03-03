mkdir /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_rnm
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/* -type f -name "*.maf") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.txt}";
  mv $file_name /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_output/onco_output_rnm/$file_without_extension"_onco_output.maf"
	
done;