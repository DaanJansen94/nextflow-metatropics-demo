# Nextflow-metatropics-demo
A small tutorial on the [metatropics](https://github.com/DaanJansen94/nf-metatropics/) nextflow pipeline to perform viral identification and creation of consensus genomes from nanopore (metagenomic) sequencing data.









 is a bioinformatics best-practice analysis pipeline for analyzing Nanopore metagenomic data (fast5/fastq) to identify virus pathogen..

The pipeline is built using Nextflow, a workflow tool to run tasks across multiple compute infrastructures in a very portable manner. It uses Docker/Singularity containers making installation trivial and results highly reproducible. The Nextflow DSL2 implementation of this pipeline uses one container per process which makes it much easier to maintain and update software dependencies. Where possible, these processes have been submitted to and installed from nf-core/modules in order to make them available to all nf-core pipelines, and to everyone within the Nextflow community!
## Input



## Explain first what what is, readsin input and excel file
## Databases in ... 
## metatropics nextflowpipeline in 'nf-metatropics'
## We can run this pipeline by the following command (show command) + explain using docker to pull software required and in yaml file the actuall path where input is, output will beo stroed etc


```
nextflow run nf-metatropics/ -profile docker -params-file params.yaml -resume
```

### add more information about all paramaters...

## 1)Visualize output consensus genomes here --> Parthogen idrntificaton
table of output file

## 2) Cnosneuss genomes generation
## Nextclade link to click on and enter consensus genome
