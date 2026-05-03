#!/usr/bin/env Rscript
# 05_shap_analysis.R - SHAP 模型解释

library(shapviz)
library(xgboost)
library(ggplot2)

cat("=== 05. SHAP 模型解释分析 ===\n")

# 读取数据
data <- read.csv("data/processed/integrated_steroid_matrix.csv", row.names = 1)
metadata <- read.csv("data/clinical_metadata.csv")

# 转换为矩阵
X <- as.matrix(data)
y <- as.numeric(factor(metadata$condition)) - 1

# 训练 XGBoost 用于 SHAP (随机森林的 SHAP 需要额外包，这里用 XGBoost 演示)
xgb_model <- xgboost(data = X, label = y, nrounds = 100, 
                     objective = "multi:softprob", num_class = 3,
                     verbose = 0)

# 计算 SHAP 值
shp <- shapviz(xgb_model, X_pred = X, X = X)

# SHAP 汇总图
sv_importance(shp, kind = "both") + ggtitle("SHAP Feature Importance")

ggsave("results/figures/shap_summary.png", width = 10, height = 8)

cat("=== SHAP 分析完成，图已保存 ===\n")
