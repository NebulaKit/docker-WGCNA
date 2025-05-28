FROM rocker/rstudio:4.3.1

# Install system dependencies for packages
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev libssl-dev libxml2-dev \
    libsqlite3-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev \
    libpng-dev libtiff5-dev libjpeg-dev libxt-dev libglpk-dev \
    && apt-get clean

# Install R packages
RUN R -e "install.packages(c('BiocManager', 'rmarkdown', 'prettydoc'), repos = 'https://cloud.r-project.org')"

# Copy and run the R package installation script
COPY install_packages.R /home/install_packages.R
RUN Rscript /home/install_packages.R

# Copy R Markdown file and demo data
COPY WGCNA.Rmd /home/WGCNA.Rmd
COPY references.bib /home/references.bib
COPY demo_data/lipidomics_synthetic.csv /home/demo_data/lipidomics_synthetic.csv

# Set working directory
WORKDIR /home

# Default command to start R
CMD ["R"]
