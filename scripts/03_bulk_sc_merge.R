#!/usr/bin/env Rscript
# 03_bulk_sc_merge.R - 多组学合并与固醇基因筛选

library(tidyverse)

cat("=== 03. 多组学数据合并与固醇基因筛选 ===\n")

# 固醇代谢相关基因集 (GO:0006694)
steroid_genes <- c("CYP7A1", "HSD17B10", "SCARB1", "SOAT1", 
                   "CYP19A1", "LIPE", "CYP2E1", "NR1H4", 
                   "LDLR", "DHCR24", "CYP11A1", "STAR")

# 读取表达矩阵（示例）
bulk_expr <- read.csv("data/processed/bulk_expression.csv", row.names = 1)
sc_expr <- readRDS("results/scRNA_integrated.rds")

# 提取固醇基因
bulk_steroid <- bulk_expr[rownames(bulk_expr) %in% steroid_genes, ]

# 合并元数据
metadata <- read.csv("data/clinical_metadata.csv")
metadata$condition <- factor(metadata$condition, 
                             levels = c("Normal", "Steatosis", "Steatohepatitis"))

# 保存整合数据
write.csv(t(bulk_steroid), "data/processed/integrated_steroid_matrix.csv")

cat("=== 数据合并完成 ===\n")
