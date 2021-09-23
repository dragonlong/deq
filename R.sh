https://divingintogeneticsandgenomics.rbind.io/post/run-rstudio-server-with-singularity-on-hpc/
https://www.rocker-project.org/use/singularity/


https://www.tutorialspoint.com/r/r_quick_guide.htm
https://arc.vt.edu/userguide/r/

# github resources
https://github.com/nickjer/singularity-rstudio

>>>>>>>>>>>>>>>>> new R package installation
https://cran.r-project.org/web/packages/plotrix/index.html
install.packages("plotrix", lib="~/R/lib")
library("plotrix",lib.loc="~/R/lib")
# install
install.packages("scatterplot3d", lib="~/R/lib")
install.packages("E:/XML_3.98-1.3.zip", repos = NULL, type = "source")
R CMD INSTALL scatterplot3d -l ~/R/lib scatterplot3d_0.3-35.tar.gz

install.packages("rgeos", lib="~/R/lib")
install.packages("maptools", lib="~/R/lib")
install.packages("rgdal", repos = "http://R-Forge.R-project.org", lib="~/R/lib")
install.packages("RColorBrewer", lib="~/R/lib")
  
# load
library("scatterplot3d",lib.loc="~/R/lib")

# config
echo 'R_LIBS_USER=~/R/%p-library/%v' >> ${HOME}/.Renviron
echo 'R_LIBS_USER=~/R/lib' >> ${HOME}/.Renviron

cat /etc/rstudio/rsession.conf

# Run
print(getwd())
setwd('/folder/where/the/file/is/')
source('file_name')

if [[ $SYSNAME == *"cascades"* ]]; then
  alias 'loadR=module load intel/17.0 mkl R/3.4.3'
fi

if [[ $serv_name == *"brlogin1"* ]]; then
    true
else
