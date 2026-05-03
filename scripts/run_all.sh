#!/bin/bash
# run_all.sh - 一键运行完整分析流程

echo "========================================="
echo "NAFLD 固醇分子预测 - 完整分析流程"
echo "========================================="

# 检查环境
if ! command -v Rscript &> /dev/null; then
    echo "错误: Rscript 未安装"
    exit 1
fi

if ! command -v python &> /dev/null; then
    echo "错误: Python 未安装"
    exit 1
fi

# 创建结果目录
mkdir -p results/figures
mkdir -p data/processed

# 运行脚本
echo ""
echo "[1/5] 运行 scRNA 整合..."
Rscript scripts/02_scRNA_integration.R

echo ""
echo "[2/5] 运行多组学合并..."
Rscript scripts/03_bulk_sc_merge.R

echo ""
echo "[3/5] 运行随机森林训练..."
python scripts/04_random_forest.py

echo ""
echo "[4/5] 运行 SHAP 分析..."
Rscript scripts/05_shap_analysis.R

echo ""
echo "========================================="
echo "✅ 分析流程完成！"
echo "结果保存在 results/ 目录"
echo "========================================="
