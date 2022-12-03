from rocker/r-ubuntu

run apt-get update

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

run mkdir raw_data
copy raw_data/archive/data.csv raw_data

run mkdir code
copy code/*.r code 

run mkdir output
run mkdir final_report

CMD make && mv final_project.html final_report
