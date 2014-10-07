setwd("~/SparkleShare/geothermaR/R/")
rFiles <- list.files(path = getwd(), pattern = "[rR]$", full.names = TRUE)
for (i in c(rFiles)) {
        heading <- paste0("** ", i)
        header  <- paste0("file:", i)
        write.table(header,
                    append = T,quote = F, row.names = F, col.names = F)
}
