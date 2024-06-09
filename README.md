# Nextflow-metatropics-demo
A small tutorial on the [metatropics](https://github.com/DaanJansen94/nf-metatropics/) nextflow pipeline to perform viral identification and creation of consensus genomes from nanopore (metagenomic) sequencing data.

### Open metatropics pipeline in Gitpod
https://gitpod.io/#https://github.com/DaanJansen94/nextflow-metatropics-demo

### Summary of the metatropics pipeline
![Figure](./nf-metatropics/Metatropics.jpg)

### Required Input [Input](/workspace/nextflow-metatropics-demo/Input/)
* Raw signal or squiggle (fast5 files)
* Raw reads (fastq) [metatropics](https://github.com/DaanJansen94/nf-metatropics/) 


* Open in gitpod: https://github.com/DaanJansen94/nextflow-metatropics-demo

## Explain first what what is, readsin input and excel file
## Databases in ... 
## metatropics nextflowpipeline in 'nf-metatropics'
## We can run this pipeline by the following command (show command) + explain using docker to pull software required and in yaml file the actuall path where input is, output will beo stroed etc

## 1) Running pipeline
```
nextflow run nf-metatropics/ -profile docker -params-file params.yaml -resume
```

### add more information about all paramaters...



## 2) After running pipeline

* Viral identification
  Viruses identified stored in xlsx.file
  --> Go to 'Output > final > all.final.xlsx' --> downoad file --> open on laptop
  
* Viral consensus genomes
  Consensus genome generated and stored as fasta files
  --> Go to 'Output > homopolish > *fasta files' --> download fasta files --> visualize in (nextclade)[https://clades.nextstrain.org/]

  ? Make link here? 

