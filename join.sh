##join <(sort "/media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/02_recurrence_with_oncotator/49_samples_recurrence_output_3") <(sort "/media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/02_recurrence_with_oncotator/onco_49_output_duprm.txt") >> merged_tested

##join <(sort -k1 "/media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/02_recurrence_with_oncotator/49_samples_recurrence_output_3") <(sort "/media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/02_recurrence_with_oncotator/onco_49_output_duprm.txt") > merged_tested_k1

##join <(sort -k1 "/media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/02_recurrence_with_oncotator/49_samples_recurrence_output_3_sorted") <(sort -k1 "/media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/02_recurrence_with_oncotator/onco_49_output_duprm_sorted") > merged_tested_sorted_k1

join -1 2 <(sort -k2 /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/02_recurrence_with_oncotator/49_samples_recurrence_output_3_sorted) -2 1 <(sort -k1 /media/LUN2/breast_analysis/20151013_new/tumour/oncotator/06_onco_output_merging_recurrence_overlap/03_individual_patient_oncotator_with_recurrence/onco_recurrence_combined/49_samples_recurrence_output)>> filename.txt