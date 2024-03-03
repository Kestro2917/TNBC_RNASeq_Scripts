#joining two files on the basis of common column
#join -j1 <(sort -k1 onco_49_output_duprm.txt) <(sort -k1 49_samples_recurrence_output)

#awk ' { t = $1; $1 = $2; $2 = t; print $0; } ' OFS="\t"  onco_49_output_duprm.txt >> text



awk -F "_" '{print $1,"\t",$2,"\t",$4,"\t",$5,"\t",$6}' "/media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/02_recurrence_with_oncotator/49_samples_recurrence_output"  >> recurrence_process1


###20151123

#key preparation script by using 4 columns 1st_2nd_
awk '{print $1"_"$2"_"$4"_"$5,"\t",$6}' 49_samples_onco_input_recurence_processed >> 49_samples_onco_input_recurence_processed_key




