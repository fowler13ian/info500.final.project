INFO550_FinalProject_IanFowler.html: final_project.rmd code/render_report.r prepare.data descript.analysis
	rscript code/render_report.r

output/project_data1.rds: code/00_clean-data.r raw_data/archive/data.csv
	rscript code/00_clean-data.r
#make: output/project_data1.rds: Permission denied
#make: *** [prepare.data] Error 1
#bash: output/project_data1.rds:: No such file or directory

output/project_data2.rds: code/00_clean-data.r raw_data/archive/data.csv
	rscript code/00_clean-data.r

output/project_data3.rds: code/01_regions.r output/project_data2.rds
	rscript code/01_regions.r

output/project_data4.rds: code/02_region-data.r output/project_data3.rds
	rscript code/02_region-data.r

output/table1.rds: code/03_table1.r output/project_data4.rds
	rscript code/03_table1.r

output/fig1.png: code/04_fig1.r output/project_data4.rds
	rscript code/04_fig1.r

.PHONY: install
install: 
	rscript -e 'renv::restore(prompt = FALSE)'

.PHONY: prepare.data
prepare.data: output/project_data1.rds output/project_data2.rds output/project_data3.rds output/project_data4.rds
  
.PHONY: descript.analysis
descript.analysis: output/table1.rds output/fig1.png 

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f output/*.RData && rm -f *.html
	
project_files = final_project.rmd code/render_report.r code/00_clean-data.r code/01_regions.r code/02_region-data.r code/03_table1.r code/04_fig1.r makefile 
renv_files = renv.lock renv/settings.dcf renv/activate.R 
	
project_image: Dockerfile $(project_files) $(renv_files)
	docker build -t final_project .
	touch $@ project_image
	
final_report/final_report.html: 
	docker build -v "$$(pwd)/final_report":/final_project/final_report fowler13ian/final_project
