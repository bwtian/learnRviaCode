getwd()
setwd()
library("knitr")
p <- purl("test.Rmd")
read_chunk(p)
chunks <- knitr:::knit_code$get()
invisible(mapply(function(chunk, name) {
        writeLines(c(paste0("## ----",name,"----"), chunk), paste0("chunk-",name,".R"))
}, chunks, names(chunks)))
unlink(p) # delete the original purl script
knitr:::knit_code$restore() # remove chunks from current knitr session
