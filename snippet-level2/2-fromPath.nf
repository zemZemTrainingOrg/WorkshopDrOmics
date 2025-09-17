// Define parameters
params.outdir       = "./outdir"     // Output directory for results
params.path_reads   = "./data/*"     // Input FASTQ files (all files in data folder)

// Create channels
// Create a channel from file paths matching the given pattern
reads_ch = Channel.fromPath( params.path_reads )

// Define processes 
process checkqc {  
    input:
    // Input: single FASTQ file path
    path(reads) 

    output:
        // Output: FastQC result files (html + zip), emitted as 'emittedCh'
        path  "*.{html,zip}" , emit: emittedCh
    
    script:
    """
    # Run FastQC on the input read file
    fastqc ${reads}
    """
} 

// Define workflow
workflow {
    // Run the 'checkqc' process on the reads channel
    checkqc(reads_ch)
    // Display the contents of the reads channel (file paths)
    reads_ch.view()
}
