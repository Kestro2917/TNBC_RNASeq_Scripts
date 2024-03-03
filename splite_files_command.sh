sed -n -e '1,500000p' recurrence_out_ks_head.maf >> recurrence_1-500000.maf

sed -n -e '500001,1000000p' recurrence_out_ks_head.maf >> recurrence_500001-1000000.maf

sed -n -e '1000001,1491360p' recurrence_out_ks_head.maf >> recurrence_1000001-1491360.maf

sed -n -e '1,500000p' recurrence_output >> recurrence_1-500000.txt

sed -n -e '500001,1000000p' recurrence_output >> recurrence_500001-1000000.txt

sed -n -e '1000001,1491360p' recurrence_output>> recurrence_1000001-1491360.txt

paste -d '\t' "/media/LUN2/breast_analysis/20151124/20151230_onco_input_output/recurrence_input_output/corrected_input/recurrence_500001-1000000.txt" "/media/LUN2/breast_analysis/20151124/20151230_onco_input_output/recurrence_input_output/corrected_input/recurrence_500001-1000000.maf" >> mrg_recurrence_500001-1000000

paste -d '\t' "/media/LUN2/breast_analysis/20151124/20151230_onco_input_output/recurrence_input_output/corrected_input/recurrence_1000001-1491360.txt" "/media/LUN2/breast_analysis/20151124/20151230_onco_input_output/recurrence_input_output/corrected_input/recurrence_1000001-1491360.maf" >> mrg_recurrence_1000001-1491360

paste -d '\t' "/media/LUN2/breast_analysis/20151124/20151230_onco_input_output/recurrence_input_output/corrected_input/recurrence_1-500000.txt" "/media/LUN2/breast_analysis/20151124/20151230_onco_input_output/recurrence_input_output/corrected_input/recurrence_1-500000.maf" >> mrg_recurrence_1-500000
