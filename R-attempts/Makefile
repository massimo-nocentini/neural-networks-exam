validation:
	gawk -F, -f validation.awk abalone.data

abalone: 
	gawk -F, -f abalone-maker.awk abalone.data > abalone.txt

inputs-normalized: 
	Rscript inputs-normalization.R 

inputs-normalized-clean:
	gawk -f inputs-normalizer.awk inputs-normalized.txt > inputs-normalized-cleaned.txt
   	 
inputs: 
	gawk -f inputs-maker.awk abalone.txt > inputs.txt

targets: 
	gawk -f targets-maker.awk abalone.txt > targets.txt

matlab-data: abalone inputs targets
	echo "Data for Matlab ready"
