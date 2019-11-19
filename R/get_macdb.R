#' Download MACDB data
#'
#' @param from_url defaults FALSE. If true, from figshare. Otherwise, loads data from storage internal to the package
#' @param storage_path where to put the data. Defaults to working-data/data.
#'
#' @return nothing
#' @export
#'
#' @importFrom here here
download_macdb <- function(from_url = FALSE, storage_path = here::here("working-data")) {

  inst_path = file.path(system.file(package= "mcmac"), "macd")

  if(!dir.exists(file.path(storage_path))) {
    dir.create(file.path(storage_path), recursive = T)
  }

  if(from_url) {

    if(!dir.exists(file.path(storage_path, "macd"))) {
      dir.create(file.path(storage_path, "macd"))
    }

    download.file(url = "https://ndownloader.figshare.com/files/3156878", destfile = file.path(storage_path,"macd", "community_analysis_data.csv"))

    download.file(url = "https://ndownloader.figshare.com/files/3156887", destfile = file.path(storage_path,"macd", "orderedcomparisons.csv"))

    download.file(url = "https://ndownloader.figshare.com/files/3156893", destfile = file.path(storage_path,"macd", "sites_analysis_data.csv"))

    download.file(url = "https://ndownloader.figshare.com/files/3156884", destfile = file.path(storage_path,"macd", "experiments_analysis_data.csv"))

    download.file(url = "https://ndownloader.figshare.com/files/3156890", destfile = file.path(storage_path,"macd", "ref_analysis_data.csv"))

    download.file(url = "https://ndownloader.figshare.com/files/1429961", destfile = file.path(storage_path,"macd", "MACD_metadata.pdf"))


  } else {
    file.copy(inst_path, storage_path, recursive = T)
  }
}

#' Load a dataset
#'
#' @param tablename table name
#' @param storage_path where the data is living
#'
#' @return something
#' @export
#'
load_table <- function(tablename, storage_path = here::here("working-data", "macd")) {

  dataset_path = file.path(storage_path, paste0(tablename, ".csv"))

  table <- read.csv(dataset_path, stringsAsFactors = F)

  return(table)

}
