mkdir /media/LUN2/breast_analysis/20151013_new/normal/merge_normal/merge_normal1
for file in $(find /media/LUN2/breast_analysis/20151013_new/normal/merge_normal/* -type f -name "*.vcf") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.vcf}";
  egrep -v "^#" $file_name >> /media/LUN2/breast_analysis/20151013_new/normal/merge_normal/merge_normal1/$file_without_extension"_no_header.vcf"
  	
done;