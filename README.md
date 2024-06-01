# NF_pipeline

nextflow run nf-metatropics/ -profile singularity --input /Input/mpox.csv --outdir /Output --fasta /DB/Human_Genome/Human_genome.fa --minLength 200 --dbmeta /DB/Metamaps_DB_NF --pair true --front 18 --tail 18 -resume
 
