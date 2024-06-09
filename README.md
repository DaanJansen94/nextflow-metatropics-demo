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

Add Input PATHS
--> in params.yml file (show yml file) hzre

```
nextflow run nf-metatropics/ -profile docker -params-file params.yaml -resume
```


### 5. After running pipeline
* Viral identification
  Viruses identified stored in xlsx.file
  --> Go to 'Output > final > all.final.xlsx' --> downoad file --> open on laptop
  [tsv file](./Output/all.final_report.tsv)
  
* Viral consensus genomes
  Consensus genome generated and stored as fasta files
  --> Go to 'Output > homopolish > *fasta files' --> download fasta files --> visualize in (nextclade)[https://clades.nextstrain.org/]






## Explain first what what is, readsin input and excel file
## Databases in ... 
## metatropics nextflowpipeline in 'nf-metatropics'
## We can run this pipeline by the following command (show command) + explain using docker to pull software required and in yaml file the actuall path where input is, output will beo stroed etc


