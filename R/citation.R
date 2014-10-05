#' Write R and R packages citation in Latex
#'
#' @author Bingwei Tian <bwtian@gmail.com>
#' @import knitr

library("knitr")
pkgs  <- c( "raster", "sp", "rgeos", "rgdal", "gdalUtils", "landsat",  "gstat", "maptools", "ggplot2", "ggmap", "plotKML", "rasterVis",  "lattice")
#citation()
write_bib(pkgs)
# write_bib(pkg2, file = "Rpkg2.bib")
cites  <- list()
for (i in pkgs) {
        cites[[i]] <-  paste0(i, " ", "\\", "cite{R-", i , "},")
}
cat(unlist(cites))
# raster \cite{R-raster}, sp \cite{R-sp}, rgeos \cite{R-rgeos}, rgdal \cite{R-rgdal}, gdalUtils \cite{R-gdalUtils}, landsat \cite{R-landsat}, gstat \cite{R-gstat}, maptools \cite{R-maptools}, ggplot2 \cite{R-ggplot2}, ggmap \cite{R-ggmap}, plotKML \cite{R-plotKML}, rasterVis \cite{R-rasterVis}, lattice \cite{R-lattice},
