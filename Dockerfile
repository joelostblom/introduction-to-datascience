# Copyright (c) UBC-DSCI Development Team.
FROM rocker/verse:4.3.1

RUN apt-get update --fix-missing
RUN Rscript -e "update.packages(ask = FALSE)"
RUN install2.r --error magick cowplot kableExtra plotly tidymodels kknn ggpubr ggforce themis egg fontawesome xfun tinytex
RUN Rscript -e "devtools::install_github('ttimbers/canlang@0.0.1')"

# increase the ImageMagick resource limits
# this relies on the fact that there is only one place where each of these sizes are used in policy.xml
# (256MiB is for memory, 512MiB is for map, 1GiB is for disk)
RUN sed -i 's/256MiB/6GiB/' /etc/ImageMagick-6/policy.xml
RUN sed -i 's/512MiB/6GiB/' /etc/ImageMagick-6/policy.xml
RUN sed -i 's/1GiB/6GiB/' /etc/ImageMagick-6/policy.xml

## install system dependencies
#RUN apt-get update --fix-missing \
#	&& apt-get install -y \
#		ca-certificates \
#    	libglib2.0-0 \
#	 	libxext6 \
#	   	libsm6  \
#	   	libxrender1 \
#		libxml2-dev
#
## install libGLPK, gdal-config, libunits
#RUN apt-get install -y libglpk-dev gdal-bin libgdal-dev libudunits2-0 libudunits2-dev
#
## install R packages
#RUN apt-get update -qq && install2.r --error \
#    --deps TRUE \
#    tidyverse \
#    e1071 \
#    caret \
#    plotly \
#    gridExtra \
#    GGally \
#    cowplot \
#    svglite \
#    tidymodels \
#    reticulate \ 
#    kknn \
#    fontawesome \
#    rsvg \
#    reticulate \
#    kableExtra \
#    egg \
#    ggpubr \
#    xfun \
#    tinytex
#
#RUN Rscript -e "reticulate::install_miniconda()"
#RUN Rscript -e "reticulate::conda_install('r-reticulate', 'python-kaleido')"
#RUN Rscript -e "reticulate::conda_install('r-reticulate', 'plotly', channel = 'plotly')"
#
#RUN Rscript -e "devtools::install_github('mountainMath/cancensus@5a5d61759d477986d40dd87fa9a6532ff6037efe')"
#RUN Rscript -e "devtools::install_github('ttimbers/canlang@0.0.1')"
#
## install LaTeX packages
#RUN tlmgr install amsmath \
#    latex-amsmath-dev \
#    fontspec \
#    tipa \
#    unicode-math \
#    xunicode \
#    kvoptions \
#    ltxcmds \
#    kvsetkeys \
#    etoolbox \
#    xcolor \
#    auxhook \
#    bigintcalc \
#    bitset \
#    etexcmds \
#    gettitlestring \
#    hycolor \
#    hyperref \
#    intcalc \
#    kvdefinekeys \
#    letltxmacro \
#    pdfescape \
#    refcount \
#    rerunfilecheck \
#    stringenc \
#    uniquecounter \
#    zapfding \
#    pdftexcmds \
#    infwarerr \
#    fancyvrb \
#    framed \
#    booktabs \
#    mdwtools \
#    grffile \
#    caption \
#    sourcecodepro \
#    amscls \
#    natbib \
#    float \
#    multirow \
#    wrapfig \
#    colortbl \
#    pdflscape \
#    varwidth \
#    threeparttable \
#    threeparttablex \
#    environ \
#    trimspaces \
#    ulem \
#    makecell \
#    tabu
#
## increase the ImageMagick resource limits
## this relies on the fact that there is only one place where each of these sizes are used in policy.xml
## (256MiB is for memory, 512MiB is for map, 1GiB is for disk)
#RUN sed -i 's/256MiB/6GiB/' /etc/ImageMagick-6/policy.xml
#RUN sed -i 's/512MiB/6GiB/' /etc/ImageMagick-6/policy.xml
#RUN sed -i 's/1GiB/6GiB/' /etc/ImageMagick-6/policy.xml
