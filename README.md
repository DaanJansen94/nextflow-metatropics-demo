# NF_pipeline

nextflow run nf-metatropics/ -profile docker --input /workspace/NF_pipeline/Input/mpox.csv --outdir /workspace/NF_pipeline/Output --fasta /workspace/NF_pipeline/DB/Human/Human_genome.fa --minLength 200 --dbmeta /workspace/NF_pipeline/Databases/Viral_Refseq --pair true --front 18 --tail 18 -resume
 
