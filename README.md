# NF_pipeline

nextflow run nf-metatropics/ -profile singularity --input /data/Daan/Projects/Gitpod/NF_pipeline/Input/mpox.csv --outdir /data/Daan/Projects/Gitpod/NF_pipeline/Output --fasta /data/Daan/Projects/Gitpod/NF_pipeline/DB/Human_Genome/Human_genome.fa --minLength 200 --dbmeta /data/Daan/Projects/Gitpod/NF_pipeline/DB/Metamaps_DB_NF --pair true --front 18 --tail 18 -resume
 
