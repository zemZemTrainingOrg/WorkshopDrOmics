// Define a Nextflow process called 'runPythonScript'
process runPythonScript {
    input:
    // The process takes a single value input called 'data'
    val data

    output:
    // The process outputs whatever is printed to stdout
    stdout

    script:
    """
    # Run an inline Python script
    python3 << EOF 
    # Print the input value from Nextflow into Python
    print('Input:', $data)
    EOF
    """
}

// Define the workflow
workflow {
    // Create a channel with values 1, 2, and 3
    // Pass each value through the runPythonScript process
    // Then send the results to 'view' for display
    Channel.of(1, 2, 3) | runPythonScript | view
}
