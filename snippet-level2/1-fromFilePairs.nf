// Define parameters
params.outdir       = "./outdir"          // Output directory for results
params.path_reads   = "./data/*_{1,2}.fastq.gz"   // Input FASTQ files (paired-end)

// Create channels
// Create a channel of paired FASTQ files using fromFilePairs
reads_ch = Channel.fromFilePairs( params.path_reads )

// Define processes 
process checkqc {  
    input:
    // Input: tuple containing sample ID and paired FASTQ file paths
    tuple val(sampleid), path(reads) 

    output:
        // Output: all FastQC results (html + zip), emitted as a channel named 'emittedCh'
        path  "*.{html,zip}" , emit: emittedCh
    
    script:
    """
    # Run FastQC on the input reads
    fastqc ${reads}
    """
} 

// Define workflow
workflow {
    // Run the 'checkqc' process on the reads channel
    checkqc(reads_ch)
    // View the contents of the reads channel (sample IDs and file paths)
    reads_ch.view()
}
