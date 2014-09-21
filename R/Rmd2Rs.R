getwd()
setwd("~/Dropbox/1code/RcodeAll/Rnw/")
Rmd2Rs  <- function(rmdFile) {
        library("knitr")
        p <- purl(rmdFile)
        read_chunk(p)
        chunks <- knitr:::knit_code$get()
        invisible(mapply(function(chunk, name) {
                #writeLines(c(paste0("## ----",name,"----"), chunk), paste0("chunk-",name,".R"))
                writeLines(c(paste0("## ----",name,"----"), chunk), paste0(name,".R"))
        }, chunks, names(chunks)))
        unlink(p) # delete the original purl script
        knitr:::knit_code$restore() # remove chunks from current knitr session
}
Rmd2Rs("3dkriging.Rmd")
sapply(dir(), Rmd2Rs)
