here::i_am(
  "code/render_report.r"
)

rmarkdown::render(
  here::here("final_project.rmd"),
  output_file = 'INFO550_FinalProject_IanFowler.html'
)