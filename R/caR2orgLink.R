setwd("~/SparkleShare/geothermaR/R/")
rFiles <- list.files(path = getwd(), pattern = "[rR]$", full.name = T)
for (i in c(rFiles)) {
        header1  <- paste0("** ","file:", tools::file_path_as_absolute(i))
        header  <- gsub("\\/home\\/.+\\/S","~\\/S", header1)
        write.table(header,
                    append = T,quote = F, row.names = F, col.names = F)
}
