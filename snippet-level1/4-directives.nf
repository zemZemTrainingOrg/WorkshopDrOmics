/* 
Directives in Nextflow define how a process should behave. 
They configure execution settings like CPU, memory, container usage, and error handling.
*/

// Enable Nextflow DSL2 (modern syntax for workflows)
nextflow.enable.dsl=2

// Define a process named 'exampleProcess'
process exampleProcess {
    // Save generated files to the 'results' directory by copying them
    publishDir 'results', mode: 'copy'
    
    output:
        // Declare 'result.txt' as an output file and name the channel 'resultFile'
        path 'result.txt', emit: resultFile

    script:
    """
    # Create an empty file named 'result.txt'
    touch result.txt
    # Append a message to the file
    echo "Hey there!! Thank you for joining us Today" >> result.txt
    """
}

// Define the workflow
workflow {
    // Run the exampleProcess
    exampleProcess()
}
