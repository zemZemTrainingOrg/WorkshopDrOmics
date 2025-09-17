#!/usr/bin/env nextflow

nextflow.enable.dsl=2  // Enable DSL2

/*
 * Beginner-level Nextflow DSL2 example
 * One process that prints greetings for a list of names
 */



// Step 1: Define the process
process sayHello {

    // Input: a single name from the input channel
    input:
    val name

    // Output: print greeting to console
    output:
    stdout

    // Script: commands to run
    script:
    """
    echo "Hello, $name!"
    """
}

// Define the workflow
workflow {

    // Define the input channel using 'Channel.of'
    // DSL2 encourages you to define channels inside the workflow
    Channel.of("Deepshikha", "Sakshi", "Pretty") 
    | sayHello 
}
    //| view









/* 
// Step 2: Previous workflow (commented out and moved to the end)
workflow {

    // Define the input channel using 'Channel.of'
    // DSL2 encourages you to define channels inside the workflow
    names_ch = Channel.of('Alice', 'Bob', 'Charlie')

    // Run the process with each item in the channel
    greet(names_ch)
}
*/





// Use Workflow handlers //  https://www.nextflow.io/docs/latest/config.html#workflow-handlers 

/*
workflow.onComplete {
log.info """ 
Workflow execution completed
Pipeline finished at ${workflow.complete}
Total duration: ${workflow.duration}
Work directory: ${workflow.workDir}
Script file: ${workflow.scriptFile}
"""
}
*/