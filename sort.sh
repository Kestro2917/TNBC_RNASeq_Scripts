mkdir /media/LUN2/breast_analysis/20151013_new/tumour/working_files/process1
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/working_files/* -type f -name "*.txt") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.txt}";
  sort -k1 $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/working_files/process1/$file_without_extension".txt"
	
done;