// TODO nf-core: If in doubt look at other nf-core/modules to see how we are doing things! :)
//               https://github.com/nf-core/modules/tree/master/modules/nf-core/
//               You can also ask for help via your pull request or on the #modules channel on the nf-core Slack workspace:
//               https://nf-co.re/join
// TODO nf-core: A module file SHOULD only define input and output files as command-line parameters.
//               All other parameters MUST be provided using the "task.ext" directive, see here:
//               https://www.nextflow.io/docs/latest/process.html#ext
//               where "task.ext" is a string.
//               Any parameters that need to be evaluated in the context of a particular sample
//               e.g. single-end/paired-end data MUST also be defined and evaluated appropriately.
// TODO nf-core: Software that can be piped together SHOULD be added to separate module files
//               unless there is a run-time, storage advantage in implementing in this way
//               e.g. it's ok to have a single module for bwa to output BAM instead of SAM:
//                 bwa mem | samtools view -B -T ref.fasta
// TODO nf-core: Optional inputs are not currently supported by Nextflow. However, using an empty
//               list (`[]`) instead of a file can be used to work around this issue.

process GUPPYDEMULTI_DEMULTIPLEXING {
    //tag '$bam'
    label 'process_single'

    // TODO nf-core: List required Conda package(s).
    //               Software MUST be pinned to channel (i.e. "bioconda"), version (i.e. "1.10").
    //               For Conda, the build (i.e. "h9402c20_2") must be EXCLUDED to support installation on different operating systems.
    // TODO nf-core: See section in main README for further information regarding finding and adding container addresses to the section below.
    //conda "YOUR-TOOL-HERE"
    //container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
    //    'https://depot.galaxyproject.org/singularity/YOUR-TOOL-HERE':
    //    'quay.io/biocontainers/YOUR-TOOL-HERE' }"
    container "$projectDir/images/guppy.sif"
    containerOptions "${ workflow.containerEngine == "singularity" ? '--nv':
                ( workflow.containerEngine == "docker" ? '--gpus all': null ) }"

    input:
    // TODO nf-core: Where applicable all sample-specific information e.g. "id", "single_end", "read_group"
    //               MUST be provided as an input via a Groovy Map called "meta".
    //               This information may not be required in some instances e.g. indexing reference genome files:
    //               https://github.com/nf-core/modules/blob/master/modules/nf-core/bwa/index/main.nf
    // TODO nf-core: Where applicable please provide/convert compressed files as input/output
    //               e.g. "*.fastq.gz" and NOT "*.fastq", "*.bam" and NOT "*.sam" etc.
    path reads

    output:
    // TODO nf-core: Named file extensions MUST be emitted for ALL output channels
    //path "*.bam", emit: bam
    path("barcoding_summary.txt"), emit: summary
    path("basename.txt"), emit: barcodeList
    path("barcode*"), emit: barcodeReads

    // TODO nf-core: List additional required output channels/values here
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''

    // TODO nf-core: Where possible, a command MUST be provided to obtain the version number of the software e.g. 1.10
    //               If the software is unable to output a version number on the command-line then it can be manually specified
    //               e.g. https://github.com/nf-core/modules/blob/master/modules/nf-core/homer/annotatepeaks/main.nf
    //               Each software used MUST provide the software name and version number in the YAML version file (versions.yml)
    // TODO nf-core: It MUST be possible to pass additional parameters to the tool as a command-line string via the "task.ext.args" directive
    // TODO nf-core: If the tool supports multi-threading then you MUST provide the appropriate parameter
    //               using the Nextflow "task" variable e.g. "--threads $task.cpus"
    // TODO nf-core: Please replace the example samtools command below with your module's command
    // TODO nf-core: Please indent the command appropriately (4 spaces!!) to help with readability ;)
    // guppydemulti: \$(echo \$(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*\$//' ))
    """
    if [[ $params.pair == "true" ]]; then
        guppy_barcoder -i $reads -s $params.outdir --require_barcodes_both_ends --num_barcoding_buffers 4 --records_per_fastq 0 -x "auto"

    elif [[ $params.pair == "false" ]]; then
        guppy_barcoder -i $reads -s $params.outdir --num_barcoding_buffers 4 --records_per_fastq 0 -x "auto"
    fi

    cat $params.outdir/barcoding_summary.txt > barcoding_summary.txt
    ls -d $params.outdir/barcode* > list.txt
    for i in `cat list.txt`; do basename \$i ;done > basename.txt
    mv $params.outdir/barcode* .
    rm list.txt

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        guppy_barcoder: \$(echo \$(guppy_barcoder --version) | head -n 1| perl -p -e 's/.+Version //g')
    END_VERSIONS
    """
}