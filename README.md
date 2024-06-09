# Nextflow-metatropics-demo
A small tutorial on the [metatropics](https://github.com/DaanJansen94/nf-metatropics/) nextflow pipeline to perform viral identification and creation of consensus genomes from nanopore (metagenomic) sequencing data.

## Pipeline summary
![Figure](./nf-metatropics/Metatropics.jpg)




## Input




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

