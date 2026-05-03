#!/usr/bin/env Rscript
# 02_scRNA_integration.R - 单细胞数据整合

library(Seurat)
library(dplyr)
library(ggplot2)

cat("=== 02. 单细胞数据整合 ===\n")

# 读取数据（示例路径）
sc_data <- Read10X("data/raw_fastq/scRNA/filtered_feature_bc_matrix/")

# 创建 Seurat 对象
seurat_obj <- CreateSeuratObject(counts = sc_data, 
                                  project = "NAFLD_scRNA",
                                  min.cells = 3, 
                                  min.features = 200)

# 质控
seurat_obj[["percent.mt"]] <- PercentageFeatureSet(seurat_obj, pattern = "^MT-")
seurat_obj <- subset(seurat_obj, subset = nFeature_RNA > 200 & nFeature_RNA < 5000 & percent.mt < 20)

# 标准化
seurat_obj <- NormalizeData(seurat_obj)
seurat_obj <- FindVariableFeatures(seurat_obj, nfeatures = 2000)
seurat_obj <- ScaleData(seurat_obj)

# 降维聚类
seurat_obj <- RunPCA(seurat_obj, npcs = 50)
seurat_obj <- RunUMAP(seurat_obj, dims = 1:30)
seurat_obj <- FindNeighbors(seurat_obj, dims = 1:30)
seurat_obj <- FindClusters(seurat_obj, resolution = 0.5)

# 保存
saveRDS(seurat_obj, "results/scRNA_integrated.rds")

cat("=== 单细胞整合完成 ===\n")
