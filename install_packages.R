# Ensure BiocManager is installed
if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager", repos = "https://cloud.r-project.org")

# Define package lists
bioc_packages <- c("AnnotationDbi", "GO.db", "preprocessCore", "impute")
cran_packages <- c(
  "RSQLite", "cachem", "flashClust", "WGCNA", "pillar", "dplyr", "ggplot2", "igraph",
  "ggraph", "tidygraph", "reshape2", "ggtext", "ggdendro", "prettydoc", "pheatmap", "doParallel", "parallel", "rmarkdown"
)

# Install Bioconductor packages
BiocManager::install(setdiff(bioc_packages, rownames(installed.packages())), ask = FALSE, update = TRUE)

# Install CRAN packages
install.packages(setdiff(cran_packages, rownames(installed.packages())), repos = "https://cloud.r-project.org")
