// -----------------------------
// Process definition
// -----------------------------
process countFileLines {
    /*
    -----------------------------
    INPUT: The process expects a file path as input
    In this case, Nextflow will send each file matching our input channel
    -----------------------------
    */
    input:
    path inputFile

    /* 
    -----------------------------
    OUTPUT: The result of the process will be written to stdout
    (captured and passed along the workflow)
    -----------------------------
    */
    output:
    stdout

    /* 
    -----------------------------
      SCRIPT: The actual shell command(s) run inside the process
      Here we use `awk` to count the number of lines in the input file.
      `NR` is a built-in AWK variable that holds the current line number,
      and at the end (`END` block), it will be equal to the total number of lines.
    -----------------------------
    */
    script:
    """
    awk 'END {print NR}' ${inputFile}
    """
}

// -----------------------------
// Workflow definition
// -----------------------------
workflow {
    // Step 1: Create a channel from all .txt files in the current directory
    // Channel.fromPath("./*.txt") will emit one file path for each .txt file
    myPathChanel = Channel.fromPath("./snippet-level1/*.txt") 

    // Step 2: Send each file path into the `countFileLines` process
    countFileLines (myPathChanel)

    // Step 3: Print the output of the process to the terminal
    countFileLines.out.view()
}
