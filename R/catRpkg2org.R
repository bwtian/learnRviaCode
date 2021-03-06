#' Wrap R source Codes to Emacs Org-mode Babel file
#' @export
#' @title Wrap R source Codes to Emacs Org-mode Babel file
#' @name catR2org
#' @param pkgRepo The folder normally with package name
#' @param pkgWD   The folder hole the packages
#' @details key function to Wrap R source Codes in a package to Emacs Org-mode Babel file
#' @return A .org file - the product of a and b
#' @author Bingwei Tian <bwtian@gmail.com>
#' @example catR2org("landsat")
#'
catRpkg2org  <- function(pkgName, pkgDir){
                pkgDir    <- getwd()
                pkgPath    <- file.path(pkgDir,pkgName)
                des1      <- readLines(file.path(pkgPath,"DESCRIPTION"))
                des2      <- gsub(pattern  = "(^[^:]+):(.+$)",
                                  replacement  = "\\1%\\2", x = des1)
                desInfo      <- paste0("+ ", des1)
                des       <- as.data.frame(do.call(rbind,strsplit(des2, split = "%")))
                pkgVer    <- des[des[,1] == "Version",][,2]
                pkgVer    <- gsub("(^ *)|( *$)", "", pkgVer)
                pkgName   <- des[des[,1] == "Package",][,2]
                pkgName   <- gsub("(^ *)|( *$)", "", pkgName)
                pkgDate   <- des[des[,1] == "Date",][,2]
                pkgDate   <- gsub("(^ *)|( *$)", "", pkgDate)
                pkgDate  <-  as.Date(pkgDate)
                pkgMaintainer <- des[des[,1] == "Maintainer",][,2]
                pkgMaintainer <- gsub("(^ *)|( *$)", "", pkgMaintainer)
                pkgMaintainer <- gsub("\\s", "-", pkgMaintainer)
                #orgName   <- paste0(pkgName, "_", pkgVer, "_(", pkgDate,
                #"_by_",pkgMaintainer,").org")
                orgName   <- paste0(pkgName, "_", pkgVer, "_", pkgDate, ".org")
                write.table(desInfo, orgName, sep = ":", quote = F,
                            row.names = F, col.names = F)
                rPath  <- file.path(pkgDir, "/R")
                rFiles <- dir(path = rPath, pattern = "*")
                for (i in c(rFiles)){
                        heading <- paste0("** ", i)
                        header  <- "#+BEGIN_SRC R "
                        rfile   <- read.table(file = file.path(rPath,i),
                                              sep = "\n", quote = "\"",
                                              comment.char = "")
                        ender   <- "#+END_SRC"
                        write.table(rbind(heading, header,rfile, ender),
                                    orgName, sep = "\n", append = T,quote = F,
                                    row.names = F, col.names = F)
                }
}
