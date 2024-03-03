
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_input_pre_processing/key_split/chr_end/swap5to3/header_additon/* -type f -name "*.txt") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.txt}";
  mv $file_name /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/onco_input_pre_processing/key_split/chr_end/swap5to3/header_additon/$file_without_extension"_final_input.txt"
	
done;