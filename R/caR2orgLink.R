rFiles <- list.files(path = getwd(), pattern = "[rR]$", full.names = TRUE)
for (i in c(rFiles)) {
        heading <- paste0("** ", i)
        paste0()
        write.table(rbind(heading, header,rfile, ender), orgName, sep = "\n",
                    append = T,quote = F, row.names = F, col.names = F)
}
