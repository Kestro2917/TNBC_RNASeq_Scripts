mkdir /media/LUN2/breast_analysis/20151013_new/normal/merge_normal/merge_normal1/merge_normal2
for file in $(find /media/LUN2/breast_analysis/20151013_new/normal/merge_normal/merge_normal1/* -type f -name "*.vcf") ; 
do
	file_name=$(basename $file) ;
  file_without_extension="${file_name%.vcf}";
  awk '{print $1"_"$2"_"$4"_"$5}' $file_name >> /media/LUN2/breast_analysis/20151013_new/normal/merge_normal/merge_normal1/merge_normal2/$file_without_extension"_no_header_merge.vcf"
  	
done;