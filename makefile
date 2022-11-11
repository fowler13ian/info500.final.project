INFO550_FinalProject_IanFowler.html: final_project.rmd code/render_report.r prepare.data descript.analysis
	rscript code/render_report.r

output/project_data2.rds: code/00_clean-data.r raw_data/archive/data.csv
	rscript code/00_clean-data.r

output/project_data3.rds: code/01_regions.r output/project_data2.rds
	rscript code/01_regions.r

output/project_data4.rds: code/02_region-data.r output/project_data3.rds
	rscript code/02_region-data.r
	
output/world_map.rds: code/00_clean-data.r
	rscript code/00_clean-data.r
	
output/world_map2.RData: code/01_regions.r output/world_map.rds
	rscript code/01_regions.r

output/table1.rds: code/03_table1.r output/project_data4.rds
	rscript code/03_table1.r

output/fig1.png: code/04_fig1.r output/project_data4.rds
	rscript code/04_fig1.r
	
output/map1.png: code/05_map1.r output/project_data4.rds output/world_map2.RData
	rscript code/05_map1.r
  
.PHONY: prepare.data
prepare.data: output/project_data2.rds output/project_data3.rds output/project_data4.rds output/world_map.rds output/world_map2.RData
  
.PHONY: descript.analysis
descript.analysis: output/table1.rds output/fig1.png 
#output/map1.png

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f output/*.RData && rm -f *.html