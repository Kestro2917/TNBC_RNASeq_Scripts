##counts the no. of characters in a line. Mention the file seperator that needs to be counted here in this case, a comma after -F\
awk -F\, '{print NF-1}' "/media/LUN2/breast_analysis/20151013_new/tumour/oncotator/03_onco_input_recurrence_20151120_oncotator_anotated/49_samples_onco_input_recurence_processed_key" > count_commas.txt


##iterates a column by one
awk '$2=$1+1 {$2} {print}' /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/03_onco_input_recurrence_20151120_oncotator_anotated/count_commas.txt>>count_commas_1.txt
