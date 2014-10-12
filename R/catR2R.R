catR2R  <- function(dir = getwd(), type = "R"){
        # TODO , type =  c("R","Rnw","Rmd","org")
        #files  <- list.files(path = dir, patter = ".[rR]$", recursive = FALSE,)
        files  <- list.files(path = dir, recursive = T)
        now <- format(Sys.time(), "_%y%m%d_%H%M%S")
        prefix  <- "00_Rmerged"
        if (type == "R"){
                fileName  <- paste( prefix, now, ".R", sep = "")
        }

        for (i in files) {
                title  <- paste("#'", basename(i))
                content <- readLines(i)
                if (type == "R"){
                 write.table(c(title,content), fileName, append = TRUE,
                             quote = FALSE,col.names = FALSE,row.names = FALSE)
                }

        }
}
