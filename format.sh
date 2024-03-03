#murging all the columns
for file in $(find /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/recurrence_20151120/recurrence_format/* -type f -name "*.txt") ; 
do
file_name=$(basename $file) ;
file_without_extension="${file_name%.txt}";
awk '{print $1"_"$2"_"$3"_"$4"_"$5}' $file_name >> /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/recurrence_20151120/recurrence_format/$file_without_extension".txt"
	
done;



#remove header of each file
sed -i '/chr_/d' *.*
 
#renameing each file by removing partern "_1st_key" 
for f in *.txt; do mv "$f" "`echo $f | sed s/_1st_key//`"; done
 
#printing the file name at in next column
for f in *.*; do sed -i "s/$/\t$f/" $f; done

#removing ".txt" from second column
 sed -i 's/\.txt//g' *.txt

 
 
