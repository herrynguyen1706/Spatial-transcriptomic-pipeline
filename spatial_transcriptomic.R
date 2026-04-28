























setwd("C:/Users/dnguyen14/Box/Tulane_working/spatial_transcriptomic")
# Load the pre-built Seurat object (already processed)
seurat.obj <- readRDS("SeuratObj_withTranscripts.RDS")
library(Seurat)
# Check metadata
head(seurat.obj@meta.data)

# UMAP plot (if available)
DimPlot(seurat.obj, group.by = "predicted.annotation.l1")

subset_cells <- subset(seurat.obj, subset = ISH.concentration == "1nM")

FeaturePlot(seurat.obj, features = "Area")
VlnPlot(seurat.obj, features = "Mean.Histone", group.by = "Run_name")
cor.test(seurat.obj$Mean.Histone, seurat.obj$nCount_RNA)
###
DefaultAssay(seurat.obj) <- "RNA"
FeaturePlot(seurat.obj, features = "IL1B")




vln.plot <- VlnPlot(seurat.obj, features = "nCount_RNA_normalized", pt.size = 0) + theme(axis.text = element_text(size = 4)) + NoLegend()
count.plot <- SpatialFeaturePlot(seurat.obj, features = "nCount_RNA_normalized") + theme(legend.position = "right")



#########################
setwd("C:/Users/dnguyen14/Box/Tulane_working/spatial_transcriptomic")
# Load necessary libraries
library(Seurat)
library(ggplot2)
library(dplyr)
library(Matrix)

# Check which files are available
files <- list.files()
print(files)

# 1. Load the metadata
metadata <- read.csv(gzfile("S3_metadata_file.csv.gz"), header = TRUE, row.names = "cell")

# 2. Load the expression matrix (assuming it's in sparse format)
expr_matrix <- read.csv(gzfile("S3_exprMat_file.csv.gz"), header = TRUE, row.names = 'cell')
# Convert to sparse matrix if needed
expr_matrix <- as(as.matrix(expr_matrix), "dgCMatrix")

# 3. Load the spatial coordinates
fov_positions <- read.csv(gzfile("S3_fov_positions_file.csv.gz"), header = TRUE)

# 4. Load the transcript file (if needed)
tx_file <- read.csv(gzfile("S3_tx_file.csv.gz"), header = TRUE)

# 5. Load the polygons file (for spot boundaries)
polygons <- read.csv(gzfile("S3-polygons.csv.gz"), header = TRUE)

# 6. Alternatively, you can load the pre-processed Seurat object
seurat_obj <- readRDS("SeuratObj_withTranscripts.RDS")

# If you want to create a Seurat object from scratch:
# Create Seurat object
seurat_obj <- CreateSeuratObject(counts = expr_matrix, meta.data = metadata)

# Add spatial information
seurat_obj[["spatial"]] <- CreateDimReducObject(embeddings = as.matrix(fov_positions[, c("x", "y")]), 
                                               key = "spatial_", 
                                               assay = "Spatial")

# For visualization
SpatialFeaturePlot(seurat_obj, features = "nCount_Spatial")
