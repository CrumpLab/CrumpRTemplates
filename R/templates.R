#' Set papaja yml
#'
#' @param papaja_file string, path and file name to a papaja.Rmd
#'
#' @return file, insert template yml to target document
#' @export
#'
crump_papaja <- function(papaja_file){
  dir.create("temp")
  usethis::use_template("papaja.yml",
                        save_as = file.path("temp", "papaja.yml"),
                        package="CrumpRTemplates")
  a <- ymlthis::as_yml(yaml::yaml.load_file("temp/papaja.yml"))
  ymlthis::use_rmarkdown(path = papaja_file,.yml = a)
  unlink("temp", TRUE)
}

