for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/recurrence_20151120/* -type f -name "*.txt") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.txt}";
  awk '{print $1"_"$2"_"$3"_"$4"_"$5}' $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/recurrence_20151120/key1/$file_without_extension"_1st_key.txt"
	
done;