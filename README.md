## INFO 550: Data Science Toolkit
### Ian Fowler

## Final Project Repository

In 2009 a variant of the seasonal flu spread globally beginning a pandemic. H1N1, also known as "Swine Flu" due to the source of transmission, spread to every region and caused approximately __94481__ cases and __429__ deaths from April 2009 to July 2010 alone.

This repository contains the analysis in which we will investigate the relationships between __geographic region__, __total number of cases__, and __total number of deaths__ associated with the H1N1 pandemic. While the entire pandemic lasted from January 2009 to August of 2010, the data set sourced from [Kaggle](https://www.kaggle.com/datasets/imdevskp/h1n1-swine-flu-2009-pandemic-dataset?resource=download) as provided by the WHO only contains data from April 2009 to July 2010 as after July, countries were no longer required to submit individual level data and the date for after July is not complete.

### The repository contains 4 sections:

__The Main Project Folder__
* the *final_project.rmd*
* the *makefile*
* *.gitignore* file
* *renv* directory
* *renv.lock* file
* the destination for the rendered *final_project.html*

__The raw_data Folder__
* the archive folder containing *data.csv*

__The code Folder__
* *00_clean-data.r*
* *01_regions.r*
* *02_region-data.r*        
* *03_table1.r*         
* *04_fig1.r*
* *05_map1.r*
* *render_report.r*

__The output Folder__
* the destination for clean and segmented *code.rds*, *table1.rds*, *fig1.png*, & *map1.png*

__The final_report Folder__
* the destination for the result of the containerized *INFO550_FinalProject_IanFowler.html* report render

*The report can be built in two ways, automatically through containerized system or locally with installed R systems. To generate the report follow on of the sets of instructions below:*

## Generating the Report Automatically

### Operating the Container

*for Mac OS using Intel Chip*

The repository includes a *Dockerfile* and instructions to fetch an image from *DockerHub* that will allow for the automatic generation of the report through a containerized Ubuntu system.

Entering the __"make final_report/INFO550_FinalProject_IanFowler.html"__ command into the terminal will automatically generate the *INFO550_FinalProject_IanFowler.html* report in the __final_report__ folder

Additionally, the __"make project_image"__ command will build a replica of the image from *DockerHub* on your local computer
**NOTE: this step is not necessary to automatically build the report**

## Generating the Report Locally

### Activating RENV: accessing necessary packages

To download/update the packages necessary to render the report, input the __"make install"__ command into the terminal

### Rendering the Report

The code for producing *table1.rds*, *fig1.png*, and *map1.png* are located within the __code__ folder and are labeled *03_table1.r*, *04_fig1.r*, *05_map1.r* respectively

The *final_project.html* will render if the __"make"__ command is entered into the terminal

The __"make clean"__ command will remove all contents of the __output__ folder and the rendered report
