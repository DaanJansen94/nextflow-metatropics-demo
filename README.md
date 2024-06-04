# NF_pipeline

nextflow run nf-metatropics/ -profile docker --input /workspace/nextflow-metatropics-demo/Input/mpox.csv --outdir /workspace/nextflow-metatropics-demo/Output --fasta /workspace/nextflow-metatropics-demo/DB/Human/Human_genome.fa --minLength 200 --dbmeta /workspace/nextflow-metatropics-demo/Databases/Viral_Refseq --pair true --front 18 --tail 18 -resume
 
