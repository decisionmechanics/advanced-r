FROM rocker/tidyverse:4.4.0
LABEL maintainer="Andrew Tait <Andrew.Tait@decisionmechanics.com>"

RUN apt-get update && apt-get install -y libjpeg-dev libnode-dev libglpk-dev

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

USER rstudio

RUN Rscript -e "install.packages(c('arrow', 'available', 'bench', 'boot', 'data.table', 'DBI', 'devtools', 'dtplyr', 'duckplyr', 'errorist', 'fivethirtyeight', 'here', 'htmlwidgets', 'janitor', 'jsonlite', 'httr2', 'knitr', 'leaflet', 'lintr', 'lobstr', 'logr', 'pkgdown', 'profvis', 'R6', 'renv', 'rlang', 'roxygen2', 'S7', 'shiny', 'skimr', 'sloop', 'styler', 'testthat', 'validate'), dependencies = TRUE)"
RUN quarto install tinytex

USER root

COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN chown rstudio:rstudio /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN echo "copilot-enabled=1" >> /etc/rstudio/rsession.conf