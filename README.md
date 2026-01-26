# Nextflow Workshop 

This repository contains materials and exercises for a **Nextflow workshop**, that covers core concepts and practical applications of Nextflow workflows.

## 🚀 Quick Start with Gitpod

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/new#https://github.com/Zemzemfiras1/WorkshopDrOmics)


---

## 📂 Repository Structure

```
Workshop/                      # Root directory for the Nextflow tutorials
├── README.md                         # Instructions / documentation for the repo
├── runMe.sh                          # Script install tools for local users
├── samples.csv                       # Example CSV input file 
├── snippet-level1/                   # Level 1: Introduction to basic Nextflow syntax
│   ├── 1-hello.nf                    # Minimal "Hello World" workflow
│   ├── 2-countlines.nf               # Count lines in a file
│   ├── 3-python.nf                   # Run a Python script in a Nextflow process
│   ├── 4-directives.nf               # Example of using process directives
│   ├── 5-tainingHello.nf             # Custom hello example
│   └── file.txt                      # Input file for countlines examples
├── snippet-level2/                   # Level 2: Channels and data input
│   ├── 1-fromFilePairs.nf            # Example using `fromFilePairs` channel
│   ├── 2-fromPath.nf                 # Example using `fromPath` channel
│   ├── 3-fromPathcsv.nf              # Example using `fromPath` with CSV
│   ├── nextflow.config               # Config file for this level
│   ├── samples.csv                   # Sample metadata (paired-end)
│   └── workshopEnv.yml               # Conda environment definition
├── snippet-level3/                   # Level 3: Channel operators
│   ├── 1-sort-Operator.nf            # Demonstrates `sort` operator
│   ├── 2-map-Operator.nf             # Demonstrates `map` operator
│   ├── 3-filter-Operator.nf          # Demonstrates `filter` operator
│   ├── 4-flatmap-Operator.nf         # Demonstrates `flatMap` operator
│   ├── 5-groupTuple-Operator.nf      # Demonstrates `groupTuple` operator
│   ├── 6-collect-Operator.nf         # Demonstrates `collect` operator
│   ├── 7-combine-Operator.nf         # Demonstrates `combine` operator
│   ├── 8-join-Operator.nf            # Demonstrates `join` operator
│   ├── 9-Meta-Operator.nf            # Demonstrates metadata handling
│   ├── 10-toSortedList-Operator.nf   # Demonstrates `toSortedList`
│   ├── nextflow.config               # Config file for this level
│   ├── txtfiles.csv                  # Input CSV of text files
│   └── unsortedFiles/                # Example input data
│       ├── 22ID_File.txt
│       ├── 55ID_File.txt
│       └── 66ID_File.txt
├── snippet-level4/                   # Level 4: Process directives & configuration
│   ├── 1-failprocess-directives-.nf  # Demonstrates handling failures
│   ├── 2-retry-directives.nf         # Retry failed tasks
│   ├── 3-time-directives.nf          # Time limits on processes
│   ├── 4-time-Config-directives.nf   # Time control via config
│   ├── 5-when-directives.nf          # Conditional execution (`when`)
│   ├── 6-StoreDir-directives.nf      # Store directory outputs
│   ├── 7-directives.nf               # Other directives examples
│   ├── conf/
│   │   └── base.config               # Base configuration
│   ├── nextflow.config               # Config for this level
│   └── outputDir/
│       └── qc_report.html            # Example output (e.g. of dummy report)
├── snippet-level5/                   # Level 5: Multiple processes and containers
│   ├── 5-multiplesProcesses.nf       # Workflow with multiple processes
│   ├── 6-containers.nf               # Using Docker/Singularity containers
│   ├── 7-containers.nf               # Another containers example
│   └── nextflow.config               # Config file
├── snippet-level6/                   # Level 6: Main workflow definitions
│   ├── main0.nf                      # Example full workflow
│   └── main1.nf                      # Another variant
├── snippet-level7/                   # Level 7: Modular workflows
│   ├── main.nf                       # Workflow using modules/subworkflows
│   ├── main-sbw.nf                   # Another main workflow variant
│   ├── modules/                      # Reusable module processes
│   │   ├── fastqc                    # FastQC process module
│   │   └── multiqc                   # MultiQC process module
│   └── subworkflows/
│       └── main.nf                   # Subworkflow example
├── tuto.yml                          # Global tutorial environment (Conda/YAML)
└── url-data                          # Directory for external data sources
```

---

## ⚡ Gitpod Features

### Automated Environment Setup

When the workspace starts, Gitpod automatically configures:

* ✅ Nextflow installation
* ✅ Java runtime environment (OpenJDK 11+)
* ✅ Git (pre-configured)
* ✅ Conda/Mamba 
* ✅ Docker (for Nextflow processes)
* ✅ Singularity

---
## What is Nextflow

Nextflow is a domain-specific workflow management system that enables scalable and reproducible scientific workflows. It is designed to run data-driven computational pipelines efficiently across multiple platforms, including local machines, HPC clusters, and cloud environments. Nextflow simplifies complex workflows through a powerful scripting language and facilitates seamless integration with container technologies and software package managers.

## Why Nextflow?

Nextflow was designed to address several challenges in computational biology, data science, and bioinformatics:

1. **Portability:** Nextflow ensures that workflows are portable across different computing environments, including local servers, HPC clusters, and cloud platforms.


2. **Reproducibility:** Workflows are reproducible, ensuring that the same results can be obtained regardless of the environment.


3. **Scalability:** Nextflow supports parallel and distributed execution, enabling pipelines to scale efficiently.


4. **Flexibility:** Supports a wide range of programming languages, such as Bash, Python, R, and more.



## Key Features

- **Dataflow programming:** Nextflow introduces a new programming model based on the dataflow paradigm, which simplifies the design of complex workflows.

- **Containers support:** Integrates with Docker, Singularity, and other container technologies to ensure portability and reproducibility.

- **Parallelism:** Facilitates parallel execution of tasks and automatic resource management.

- **Cloud integration:** Provides built-in support for AWS, Google Cloud, and Azure.

- **Version control:** Nextflow pipelines can be easily versioned with Git, improving traceability and reproducibility.


## How Nextflow Works

Nextflow simplifies pipeline development by breaking down workflows into smaller processes. Each process can define:

1. Input channels: Where data comes from.


2. Script: Commands or code to run for the process.


3. Output channels: Where results are sent.
   
~~~
process exampleProcess {
    input:
    path inputFile

    output:
    path outputFile

    script:
    """
    # Your script here
    cp $inputFile $outputFile
    """
}
~~~

## Key Concepts of Nextflow Chain:

1. **Processes:** Each task in a Nextflow pipeline is defined as a process. It can be a single command or a complex set of operations.


2. **Channels:** Data in Nextflow flows through channels, which act as conduits to pass data between processes. Channels are fundamental to building a chain, as they control how output from one process can be passed as input to another.


3. **DSL2 (Domain Specific Language 2):** The second version of Nextflow’s scripting language that allows modularity and reuse of pipeline components.

## Channels and Processes
Channels in Nextflow serve as the data streams that facilitate communication between different parts of a workflow. They enable dynamic data handling, parallelization, and efficient execution of processes. Processes define the core computational tasks within a pipeline, allowing for modular, reproducible, and flexible workflow execution.

### How Nextflow Chain Works with Outputs:

**1.** Data Passing Between Processes:

The output of one process is sent to the next process using channels.

Channels can hold various data types such as files, strings, or lists, making them flexible for different types of outputs.


Example:
~~~
process A {
    output:
    path 'result_A.txt' ,emit: channelA
 
    script:
    """
    echo "This is the result of process A" > result_A.txt
    """
}
~~~
~~~
process B {
    input:
    path myinputfile
    output:
    file 'result_B.txt' ,emit:  channelB

    script:
    """
    cat ${myinputfile} > result_B.txt
    echo "This is the result of process B" >> result_B.txt
    """
}
~~~

**2.** Collecting and Aggregating Outputs:

Nextflow allows processes to output data into multiple channels and aggregate results from multiple upstream processes.

Multiple channels can be combined or "reduced" to form a single result, useful for summarizing or merging data.



**3.** Parallel Execution:

Nextflow runs processes in parallel whenever possible, taking advantage of available computational resources.

Even though data flows from one process to another, the system automatically manages parallelism, distributing tasks across CPU cores or cloud resources.



**4.** Error Handling:

Nextflow chains support fault tolerance and can retry failed processes or restart from a specific step, without needing to rerun the entire pipeline

## Directives and Operators
Directives in Nextflow control the execution environment and behavior of processes. They define resource allocation, execution conditions, and dependencies. Operators, on the other hand, allow transformations and manipulations of data flowing through channels. They provide a functional programming approach to workflow design, making it easier to manage complex data transformations and dependencies.

## Containerization (Conda, Mamba, Docker, Singularity, Wave)
Containerization in Nextflow ensures reproducibility and portability by encapsulating software dependencies within isolated environments. 
- **Conda & Mamba**: Package managers that facilitate dependency management and environment creation.
- **Docker**: A widely used containerization platform that packages applications with their dependencies.
- **Singularity**: A containerization solution optimized for high-performance computing environments.
- **Wave**: A cloud-native containerization approach that dynamically resolves dependencies and optimizes execution across different platforms.

## Workflow Reporting and Config Files
Nextflow provides built-in support for workflow reporting, allowing users to generate execution reports, trace logs, and runtime statistics. Configuration files define execution parameters, such as resource allocation, environment settings, and custom profiles for different computing infrastructures. They enable flexible customization and reproducibility across diverse execution environments.

## Modules and Subworkflows
Modules in Nextflow promote workflow modularity by encapsulating reusable components that can be easily shared and maintained. Subworkflows extend this concept by enabling hierarchical workflow design, where complex pipelines are constructed from interconnected modules. This approach enhances reusability, maintainability, and scalability in large-scale computational workflows.

---

## Editor 

**Firas Zemzem** – [zemzemfiras@gmail.com](mailto:zemzemfiras@gmail.com)

## Call for Collaboration

We welcome contributions from the community! If you are interested in improving tutorials, adding new workflow examples, or enhancing existing materials, please feel free to submit issues or pull requests. Your expertise and feedback will help make this workshop even more valuable for everyone.

Collaborators can join by:

* Forking the repository and submitting pull requests
* Suggesting improvements via issues
* Sharing new Nextflow modules or workflows

---
> License

This repository is licensed under the MIT License. You are free to use, modify, and distribute the materials in this repository, provided that you include the original copyright notice.

> Let’s build a strong, open, and reproducible Nextflow learning community together!

