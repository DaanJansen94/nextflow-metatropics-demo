# Nextflow-metatropics-demo
A small tutorial on the [metatropics](https://github.com/DaanJansen94/nf-metatropics/) nextflow pipeline to perform viral identification and creation of consensus genomes from nanopore (metagenomic) sequencing data.

### 1. Open metatropics pipeline in Gitpod
https://gitpod.io/#https://github.com/DaanJansen94/nextflow-metatropics-demo

### 2. Summary of the metatropics pipeline
![Figure](./nf-metatropics/Metatropics.jpg)
### 3. Required Input
* Raw signal or squiggle (fast5 files)
* Raw reads (fastq files)
* [CSV file](./Input/mpox.csv)

### 4. Running pipeline
Define Paths (Input,output, viral database): [params.yml file](./params.yaml)

```
nextflow run nf-metatropics/ -profile docker -params-file params.yaml -resume
```

### 5. After running pipeline
* 5.1 Viral identification:
  Viruses identified stored in [tsv file](./Output/final/all.final_report.tsv), which is located in the folder (/Output/final)
  
* 5.2 Download viral consensus genomes
  Consensus genome generated and stored as fasta files in [mpox Clade I](./Output/homopolish/Casus1_T1.NC_003310_1.polish.fasta) and [mpox Clade II](./Output/homopolish/Casus2_T1.NC_063383_1.polish.fasta), which is located in the folder (/Output/homopolish/)

* 5.3 Visualize consensus genomes
  This can be visualized in [nextclade](https://clades.nextstrain.org/) for a fast overview 
