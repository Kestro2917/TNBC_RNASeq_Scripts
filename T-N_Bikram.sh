awk 'FNR==NR{a[$1];next};!($1 in a)' "/media/LUN2/breast_analysis/20151013_new/normal/header_remove/column_extract/merge_normal/merge_normal_wth_DONT/final/dup_remove_allmerge_normal.vcf" "/media/LUN2/breast_analysis/20151013_new/tumour/33.txt" >> /media/LUN2/breast_analysis/20151013_new/practice/output.txt

fgrep -vf "/media/LUN2/breast_analysis/20151013_new/normal/header_remove/column_extract/merge_normal/merge_normal_wth_DONT/final/dup_remove_allmerge_normal.vcf" "/media/LUN2/breast_analysis/20151013_new/tumour/33.txt" >> /media/LUN2/breast_analysis/20151013_new/practice/output1.txt

export LC_ALL=C
join -v2 <(sort "/media/LUN2/breast_analysis/20151013_new/normal/header_remove/column_extract/merge_normal/merge_normal_wth_DONT/final/dup_remove_allmerge_normal.vcf") <(sort "/media/LUN2/breast_analysis/20151013_new/tumour/33.txt") >> /media/LUN2/breast_analysis/20151013_new/practice/output2.txt

export LC_ALL=C
comm -13 <(sort "/media/LUN2/breast_analysis/20151013_new/normal/header_remove/column_extract/merge_normal/merge_normal_wth_DONT/final/dup_remove_allmerge_normal.vcf") <(sort  "/media/LUN2/breast_analysis/20151013_new/tumour/33.txt") >> /media/LUN2/breast_analysis/20151013_new/practice/output3.txt
