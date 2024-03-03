#nohup bash 1222324_variant_hg19_20150415.sh >>1222324_variantcall.log 2>&1 &
#nohup bash 1222324_variant_hg19_20150415.sh >>1222324_pcr_duplicates.log 2>&1 &

#echo "Copy bam file 1222324 started at $(date)">>1222324_variantcall_echo.txt
#echo "Copy bam file 1222324 started at $(date)">>1222324_variantcall.log
#cp /media/LUN2/breast_analysis/52/1222324/output/accepted_hits.bam /media/LUN2/breast_analysis/52/1222324/variantcall/
#echo "Copy bam file 1222324 ended at $(date)">>1222324_variantcall.log
#echo "Copy bam file 1222324 ended at $(date)">>1222324_variantcall_echo.txt

#echo "insert read group in bam file for sample 1222324 started at $(date)">>1222324_variantcall_echo.txt
#echo "insert read group in bam file for sample 1222324 started at $(date)">>1222324_variantcall.log
#java -Xmx50G -jar /opt/ngs_softwares/picard-tools-1.98/AddOrReplaceReadGroups.jar I=/media/LUN2/breast_analysis/52/1222324/variantcall/accepted_hits.bam O=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_rg.bam RGID=1222324 RGLB=first RGPL=illumina RGPU='run barcode' RGSM='BREAST1222324' TMP_DIR= /media/LUN2/breast_analysis/52/1222324/variantcall/tmp
#echo "insert read group in sam file for sample 1222324 ended at $(date)">>1222324_variantcall.log
#echo "insert read group in sam file for sample 1222324 ended at $(date)">>1222324_variantcall_echo.txt

#echo "reorder Bam started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "reorder Bam started for sample 1222324 at $(date)">>1222324_variantcall.log
#java -Xmx50G -jar /opt/ngs_softwares/picard-tools-1.98/ReorderSam.jar I=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_rg.bam O=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_rgreordered.bam VALIDATION_STRINGENCY=LENIENT R=/opt/databases/2.3_resources/hg19/hg19.fasta TMP_DIR=/media/LUN2/breast_analysis/52/1222324/variantcall/tmp
#echo "reorder Bam ended for sample 1222324 at $(date)">>1222324_variantcall.log
#echo "reorder Bam ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

#echo "Sorting bam started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Sorting bam started for sample 1222324 at $(date)">>1222324_variantcall.log
#java -Xmx50G -jar /opt/ngs_softwares/picard-tools-1.98/SortSam.jar I=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_rgreordered.bam O=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgreordered.bam SORT_ORDER=coordinate VALIDATION_STRINGENCY=SILENT TMP_DIR= /media/LUN2/breast_analysis/52/1222324/variantcall/tmp
#echo "Sorting bam ended for sample 1222324 at $(date)">>1222324_variantcall.log
#echo "Sorting bam ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

#echo "Bam Fixmate pairs started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Bam Fixmate pairs started for sample 1222324 at $(date)">>1222324_variantcall.log
#java -Xmx50G -jar /opt/ngs_softwares/picard-tools-1.98/FixMateInformation.jar I=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgreordered.bam OUTPUT=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered.bam VALIDATION_STRINGENCY=SILENT TMP_DIR= /media/LUN2/breast_analysis/52/1222324/variantcall/tmp
#echo "Bam Fixmate pairs ended for sample 1222324 at $(date)">>1222324_variantcall.log
#echo "Bam Fixmate pairs ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

#echo "Build Bam index started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Build Bam index started for sample 1222324 at $(date)">>1222324_variantcall.log
#java -Xmx50G -jar /opt/ngs_softwares/picard-tools-1.98/BuildBamIndex.jar I=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered.bam VALIDATION_STRINGENCY=LENIENT TMP_DIR= /media/LUN2/breast_analysis/52/1222324/variantcall/tmp
#echo "Build Bam index ended for sample 1222324 at $(date)">>1222324_variantcall.log
#echo "Build Bam index ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

#echo "Realigner Target Creator started for hg19 at $(date)">>1222324_variantcall_echo.txt
#echo "Realigner Target Creator stardbsnp_137.hg19.vcfted for hg19 at $(date)">>1222324_variantcall.log
#java -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T RealignerTargetCreator -nt 20 -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered.bam -o /media/LUN2/breast_analysis/52/1222324/variantcall/Realigner.targets.hg19.intervals --known /opt/databases/2.3_resources/hg19/Mills_and_1000G_gold_standard.indels.hg19.vcf
#echo "Realigner Target Creator ended for hg19 at $(date)">>1222324_variantcall.log
#echo "Realigner Target Creator ended for hg19 at $(date)">>1222324_variantcall_echo.txt

#echo "Indel realignment started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Indel realignment started for sample 1222324 at $(date)">>1222324_variantcall.log
#java -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T IndelRealigner -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered.bam -targetIntervals /media/LUN2/breast_analysis/52/1222324/variantcall/Realigner.targets.hg19.intervals -maxReads 200000 -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn.bam -log /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_fixed_sorted_realn.bam.log 
#echo "Indel realignment ended for sample 1222324 at $(date)">>1222324_variantcall.log
#echo "Indel realignment ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

#echo "Cleaning Bam file for bad mates started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Cleaning Bam file for bad mates started for sample 1222324 at $(date)">>1222324_variantcall.log
#/opt/ngs_softwares/samtools-0.1.18/samtools view -h /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn.bam| grep -v /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn.bam | /opt/ngs_softwares/samtools-0.1.18/samtools view -bS - > /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_cleaned.bam
#echo "Cleaning Bam file for bad mates ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Cleaning Bam file for bad mates ended for sample 1222324 at $(date)">>1222324_variantcall.log

#echo "Remove PCR duplicates started for sample 1222324 at $(date)">>1222324_variantcall.log
#echo "Remove PCR duplicates started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Remove PCR duplicates started for sample 1222324 at $(date)">>1222324_pcr_duplicates_echo.txt
#echo "Remove PCR duplicates started for sample 1222324 at $(date)">>1222324_pcr_duplicates.log
#/opt/ngs_softwares/samtools-0.1.18/samtools rmdup /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_cleaned.bam /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned.bam
#echo "Remove PCR duplicates ended for sample 1222324 at $(date)">>1222324_pcr_duplicates.log
#echo "Remove PCR duplicates ended for sample 1222324 at $(date)">>1222324_pcr_duplicates_echo.txt
#echo "Remove PCR duplicates ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Remove PCR duplicates ended for sample 1222324 at $(date)">>1222324_variantcall.log


echo "Build Bam index of duplicate removed started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Build Bam index of duplicate removed started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Xmx50G -jar /opt/ngs_softwares/picard-tools-1.98/BuildBamIndex.jar I=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned.bam VALIDATION_STRINGENCY=SILENT TMP_DIR=/media/LUN2/breast_analysis/52/1222324/variantcall/tmp
echo "Build Bam index of duplicate removed ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Build Bam index of duplicate removed ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "Mark Duplicates started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Mark Duplicates started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Xmx50G -jar /opt/ngs_softwares/picard-tools-1.98/MarkDuplicates.jar I=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_cleaned.bam O=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked.bam METRICS_FILE=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_info.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=LENIENT TMP_DIR= /media/LUN2/breast_analysis/52/1222324/variantcall/tmp
echo "Mark Duplicates ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Mark Duplicates ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "Build Bam index of duplicate marked bam started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Build Bam index of duplicate marked bam started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Xmx50G -jar /opt/ngs_softwares/picard-tools-1.98/BuildBamIndex.jar I=/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked.bam VALIDATION_STRINGENCY=SILENT TMP_DIR=/media/LUN2/breast_analysis/52/1222324/variantcall/tmp
echo "Build Bam index of duplicate marked bam ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Build Bam index of duplicate marked bam ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "Base Recalibration started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Base Recalibration started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T BaseRecalibrator -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked.bam -R /opt/databases/2.3_resources/hg19/hg19.fasta -knownSites:dbsnp,VCF /opt/databases/2.3_resources/hg19/dbsnp_137.hg19.vcf --out /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked.grp --plot_pdf_file /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked.pdf
echo "Base Recalibration ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Base Recalibration ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
   
echo "Print Reads started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Print Reads started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T PrintReads -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked.bam -BQSR /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked.grp -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam
echo "Print Reads ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Print Reads ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "SNP Call started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "SNP Call started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T UnifiedGenotyper -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP.vcf --genotype_likelihoods_model SNP --annotateNDA -l INFO -log /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_sorted_rgfixed_reordered_realn_DupRm_cleaned_baserecal_SNP.log
echo "SNP Call ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "SNP Call ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "Indel Call started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Indel Call started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T UnifiedGenotyper -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL.vcf --genotype_likelihoods_model INDEL --annotateNDA -l INFO -log /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL.log
echo "Indel Call ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Indel Call ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "Variant Recalibrator of SNPS started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Variant Recalibrator of SNPS started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T VariantRecalibrator -R /opt/databases/2.3_resources/hg19/hg19.fasta --input /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP.vcf -resource:hapmap,known=false,training=true,truth=true,prior=15.0 /opt/databases/2.3_resources/hg19/hapmap_3.3.hg19.vcf -resource:omni,known=false,training=true,truth=false,prior=12.0 /opt/databases/2.3_resources/hg19/1000G_omni2.5.hg19.vcf -resource:dbsnp,known=true,training=false,truth=false,prior=6.0 /opt/databases/2.3_resources/hg19/dbsnp_137.hg19.vcf -mG 5 -an QD -an HaplotypeScore -an MQRankSum -an ReadPosRankSum -an FS -an MQ -mode SNP -titv 3.2 -recalFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP_variantrecal.recal -tranchesFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP_variantrecal.tranches -rscriptFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP_variantrecal.plots.R
echo "Variant Recalibrator of SNPS ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Variant Recalibrator of SNPS ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "Apply Recalibration of SNPS started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Apply Recalibration of SNPS started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T ApplyRecalibration -R /opt/databases/2.3_resources/hg19/hg19.fasta --input /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP.vcf --ts_filter_level 99.0 -tranchesFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP_variantrecal.tranches -recalFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP_variantrecal.recal -mode SNP -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_applyrecal_SNP.vcf 
echo "Apply Recalibration ended for sample 1222324 at $(date)" >> 1222324_variantcall.log  
echo "Apply Recalibration ended for sample 1222324 at $(date)" >> 1222324_variantcall_echo.txt   

echo "Variant Recalibrator of INDELS started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Variant Recalibrator of INDELS started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T VariantRecalibrator -R /opt/databases/2.3_resources/hg19/hg19.fasta --input /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL.vcf -resource:hapmap,known=false,training=true,truth=true,prior=15.0 /opt/databases/2.3_resources/hg19/hapmap_3.3.hg19.vcf -resource:omni,known=false,training=true,truth=false,prior=12.0 /opt/databases/2.3_resources/hg19/1000G_omni2.5.hg19.vcf -resource:dbINDEL,known=true,training=false,truth=false,prior=6.0 /opt/databases/2.3_resources/hg19/dbsnp_137.hg19.vcf -mG 5 -an QD -an HaplotypeScore -an MQRankSum -an ReadPosRankSum -an FS -an MQ -mode INDEL -titv 3.2 -recalFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL_variantrecal.recal -tranchesFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL_variantrecal.tranches -rscriptFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL_variantrecal.plots.R
echo "Variant Recalibrator of INDELS ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Variant Recalibrator of INDELS ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "Apply Recalibration of INDELS started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Apply Recalibration of INDELS started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T ApplyRecalibration -R /opt/databases/2.3_resources/hg19/hg19.fasta --input /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL.vcf --ts_filter_level 99.0 -tranchesFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL_variantrecal.tranches -recalFile /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_INDEL_variantrecal.recal -mode INDEL -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_applyrecal_INDEL.vcf 
echo "Apply Recalibration ended for sample 1222324 at $(date)">>1222324_variantcall.log  
echo "Apply Recalibration ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt  

echo "Variant Annotator started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt 
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T VariantAnnotator -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam --alwaysAppendDbsnpId -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_variantannotator_SNP.vcf --variant /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_SNP.vcf -A Coverage --dbsnp /opt/databases/2.3_resources/hg19/dbsnp_137.hg19.vcf
echo "Variant Annotator ended for sample 1222324 at $(date)">>1222324_variantcall.log 
echo "Variant Annotator ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt 
   
echo "Count Reads started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Count Reads started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T CountReads -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam >>/media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_counts.txt
echo "Count Reads ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Count Reads ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

echo "Count Loci started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
echo "Count Loci started for sample 1222324 at $(date)">>1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T CountLoci -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_countloci.txt
echo "Count Loci ended for sample 1222324 at $(date)">>1222324_variantcall.log
echo "Count Loci ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

#echo "Structural variation started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Structural variation started for sample 1222324 at $(date)">>1222324_variantcall.log
#java -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T CountLoci -R /opt/databases/2.3_resources/hg19/hg19.fasta -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_countloci.txt
#echo "Structural Variation ended for sample 1222324 at $(date)">>1222324_variantcall.log
#echo "Structural Variation ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

#echo "Somatic Indel detector started for sample 1222324 at $(date)">>1222324_variantcall_echo.txt
#echo "Somatic Indel detector started for sample 1222324 at $(date)">>1222324_variantcall.log
#java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/GenomeAnalysisTK-2.5-2-gf57256b/GenomeAnalysisTK.jar -T SomaticIndelDetector -R /opt/databases/2.3_resources/hg19/hg19.fasta -verbose /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.txt -I /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam -o /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal_somatic_indels.vcf
#echo "Somatic Indel detector ended for sample 1222324 at $(date)">>1222324_variantcall.log
#echo "Somatic Indel detector ended for sample 1222324 at $(date)">>1222324_variantcall_echo.txt

#Mutect v 1.1.7
echo "Mutect Call started for sample 1222324 at $(date)" >> 1222324_variantcall_echo.txt
echo "Mutect Call started for sample 1222324 at $(date)">> 1222324_variantcall.log
java -Djava.io.tmpdir=/media/LUN4/rohan/tmp/1222324/ -Xmx50G -jar /opt/ngs_softwares/mutect-1.1.7.jar -T MuTect -U ALLOW_N_CIGAR_READS -R /opt/databases/2.3_resources/hg19/hg19.fasta -cosmic /opt/databases/2.3_resources/hg19/cosmicV65_coding_hg19.vcf -dbsnp /opt/databases/2.3_resources/hg19/dbsnp_137.hg19.vcf -I:tumor /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.bam --out /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.mutect.txt --coverage_file /media/LUN2/breast_analysis/52/1222324/variantcall/1222324_accepted_hits_sorted_rgfixed_reordered_realn_DupRm_cleaned_marked_baserecal.mutect.wig.txt
echo "Mutect Call Ended for sample 1222324 at $(date)" >> 1222324_variantcall_echo.txt
echo "Mutect Call Ended for sample 1222324 at $(date)">> 1222324_variantcall.log