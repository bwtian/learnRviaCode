#' Cat R files in the folder to Org file links
#' @export
#' @usage  catR2orgLink()
catR2orgLink  <- function(dir = getwd(), full.path = FALSE) {
        ## todo path = absolute or not
rFiles <- list.files(path = dir, pattern = "[rR]$", full.name = T)
for (i in c(rFiles)) {
        header1  <- paste0("** ","file:", tools::file_path_as_absolute(i))
        header  <- gsub("\\/home\\/.+\\/SparkleShare","~\\/SparkleShare", header1)
        write.table(header,
                    append = T,quote = F, row.names = F, col.names = F)
}
}

