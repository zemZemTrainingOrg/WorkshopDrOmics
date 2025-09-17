// Parameters 
params.outdir  = "./outdir"       // Output directory for results
params.reads   = "./samples.csv"  // Input CSV file containing sample metadata (id, read1, read2)

// Channels
// Create a channel from the CSV file
// Split into rows with headers, then map each row into a tuple: (sample ID, read1, read2)
reads_ch = Channel.fromPath( params.reads )
    .splitCsv(header:true)
    .map{ row -> tuple( row.id, file(row.read1), file(row.read2) )}
    
// Processes 
process checkqc {
    input:
    // Input: tuple containing sample ID and paired FASTQ file paths
    tuple val(id), path(read1), path(read2) 

    output:
        // Output: FastQC result files (html + zip), emitted as 'emittedCh'
        path  "*.{html,zip}" , emit: emittedCh
    
    script:
    """
    # Run FastQC on both paired-end FASTQ files
    fastqc ${read1} ${read2}
    """
} 

// Workflow
workflow {
    // Run the 'checkqc' process using the reads channel
    checkqc(reads_ch)
    // Display the tuples from the reads channel (id, read1, read2)
    reads_ch.view()
}
