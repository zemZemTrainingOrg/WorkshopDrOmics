#!/usr/bin/env nextflow

nextflow.enable.dsl=2

/*
 * DrOmics Event Simulation Pipeline
 * Simulates an event with multiple processes in Nextflow style
 */

workflow {

    // Event metadata
    when() 
    where() 
    trainerName() 
    registration() 
    preTest() 
    materials() 
    // Main Trainer Sessions
    trainerSessions(total: 100) 
    // Post-event steps
    postTest() 
    feedback() 
}




// ---------------- Processes ----------------

process when {

    tag "From 26th Sept to 29th September 2025"

    output:
    stdout

    script:
    """
    echo '[01/abc123] When         > 2025-09-10 | 14:00–17:00 ✔ 1 of 1'
    """
}

process where {

    tag "Online"

    output:
    stdout

    script:
    """
    echo '[02/def456] Where        > Online (Zoom) ✔ 1 of 1'
    """
}

process trainerName {

    tag "Firas Zemzem"

    output:
    stdout

    script:
    """
    echo '[03/ghi789] Trainer Name > Dr. Alice Example ✔ 1 of 1'
    """
}

process registration {

    tag "CLOSED"

    output:
    stdout

    script:
    """
    echo '[04/mno345] Registration > 120 participants ✔ 1 of 1'
    """
}

process preTest {

    tag "ALREADY DONE"

    output:
    stdout

    script:
    """
    echo '[05/pqr678] Pre-Test     > Completed ✔ 1 of 1'
    """
}

process materials {

    tag "VIA GITHUB"

    output:
    stdout

    script:
    """
    echo '[06/stu901] Materials    > Shared ✔ 1 of 1'
    """
}

process trainerSessions {

    tag "INCLUDE ALL"

    input:
    val total

    output:
    stdout

    script:
    """
    for i in \$(seq 1 $total); do
        echo "[07/jkl012] TrainerSession ($total) | \$i of $total ✔"
    done
    """
}

process postTest {

    tag "GOOD LUCK"

    output:
    stdout

    script:
    """
    echo '[08/vwx234] Post-Test    > Completed ✔ 1 of 1'
    """
}

process feedback {

    tag "THANK YOU FOR YOUR ATTENDANCE"

    output:
    stdout

    script:
    """
    echo '[09/yz0123] Feedback     > Collected ✔ 1 of 1'
    """
}
