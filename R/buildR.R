buildR <- function(pkgName, pkgWD) {
        #pkgName  <- "TIR"
        pkgWD <- getwd()
        pkgDir <- file.path(pkgWD,pkgName)
        des  <- read.csv(file.path(pkgDir,"DESCRIPTION"), sep = ":", header = F)

        pkgVer  <-des[des[,1] == "Version",][,2]
        pkgVer  <-gsub("(^ *)|( *$)", "", ver)
        if(!require("roxygen2")) {
                install.packages("roxygen2")
        } else {
                roxygenise(package.dir=pkgDir)
        }
system(command=paste0("R CMD build '", pkgDir,"'"))
# system(command=paste0("R CMD check '", pkgDir,"'"))
system(command=paste0("R CMD INSTALL '", pkgName, "_",pkgVer, ".tar.gz'"))
# R CMD build package1
# R CMD check package1_0.0.1.tar.gz
# R CMD INSTALL package1_0.0.1.tar.gz
}
