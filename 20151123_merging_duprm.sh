###merging og onco files
#cat *.maf >> onco_49_output_new.txt

###duplicate remove on the basis of 1st column
#awk '!dup[$1]++' onco_49_output_new.txt >> onco_49_output_duprm_new.txt

cat *.maf | awk '!dup[$1]++' onco_49_output_new.txt >> 20151123_onco_49_output_duprm_first_key.txt

cat *.maf | awk '!dup[$2]++' onco_49_output_new.txt >> 20151123_onco_49_output_duprm_second_key.txt