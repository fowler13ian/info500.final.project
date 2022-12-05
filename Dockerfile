from rocker/r-ubuntu

run apt-get update && apt-get install -y libcurl4-openssl-dev libxml2-dev libssl-dev libgdal-dev libfontconfig1-dev libudunits2-dev pandoc

run mkdir /final_project
workdir /final_project

copy README.md .
copy makefile .
copy final_project.rmd .

run mkdir renv

copy renv.lock .
copy .Rprofile .
copy renv/settings.dcf renv
copy renv/activate.R renv

run Rscript -e "renv::restore(prompt = FALSE)"

run mkdir raw_data
run mkdir raw_data/archive
copy raw_data/archive/data.csv raw_data/archive

run mkdir code
copy code/*.r code 

run mkdir output
run mkdir final_report

CMD make && mv final_project.html final_report
