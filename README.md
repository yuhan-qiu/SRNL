# 🔬 围绝经期NAFLD · 固醇相关分子预测

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.9+](https://img.shields.io/badge/Python-3.9+-blue.svg)](https://www.python.org/)
[![R 4.2+](https://img.shields.io/badge/R-4.2+-lightblue.svg)](https://www.r-project.org/)
[![Random Forest](https://img.shields.io/badge/Random%20Forest-Sklearn-green.svg)](https://scikit-learn.org/)
[![RNA-seq](https://img.shields.io/badge/RNA--seq-bulk%20%7C%20single--cell-red.svg)](https://www.10xgenomics.com/)
[![NAFLD](https://img.shields.io/badge/NAFLD-Steatosis--NASH-orange.svg)](https://www.niddk.nih.gov/health-information/liver-disease/nafld)

> **整合 bulk RNA-seq 与单细胞转录组数据，通过随机森林模型识别围绝经期妇女非酒精性脂肪肝（NAFLD）进展中的内固醇相关关键分子**

<div align="center">
  <img src="https://img.shields.io/badge/Status-Active-success" alt="Status">
  <img src="https://img.shields.io/badge/Menopause-Female%20Health-purple" alt="Menopause">
  <img src="https://img.shields.io/badge/Multi--Omics-Integrated-brightgreen" alt="Multi-Omics">
  <img src="https://img.shields.io/badge/Interpretability-SHAP-ff69b4" alt="SHAP">
</div>

---

## 📌 目录

- [项目背景](#-项目背景)
- [研究目标](#-研究目标)
- [分析流程](#-分析流程)
- [仓库结构](#-仓库结构)
- [快速开始](#-快速开始)
- [关键结果](#-关键结果)
- [模型性能](#-模型性能)
- [在线展示](#-在线展示)
- [环境依赖](#-环境依赖)
- [引用](#-引用)
- [贡献指南](#-贡献指南)
- [许可证](#-许可证)

---

## 📖 项目背景

围绝经期女性因雌激素水平波动，非酒精性脂肪肝（NAFLD）及非酒精性脂肪性肝炎（NASH）的发病率显著升高。**固醇代谢紊乱**（胆固醇、性激素、胆汁酸）在疾病进展中扮演关键角色，但其分子机制尚不完全清楚。

本项目利用**多组学数据**（bulk RNA-seq + scRNA-seq）结合**随机森林算法**，系统筛选与内固醇相关的预测性分子，为：
- 🔍 早期诊断标志物发现
- 💊 治疗靶点筛选
- 🧬 固醇代谢机制研究

提供数据驱动的解决方案。

---

## 🎯 研究目标

| 目标 | 描述 | 状态 |
|------|------|------|
| 🔬 **数据整合** | 融合 bulk RNA-seq 和 scRNA-seq 数据，去除批次效应 | ✅ 完成 |
| 🏷️ **表型标注** | 将样本分为 Normal / Steatosis / Steatohepatitis | ✅ 完成 |
| 🌲 **模型构建** | 基于固醇通路相关基因构建随机森林分类器 | ✅ 完成 |
| 💊 **分子筛选** | 识别影响类固醇代谢的核心分子（基因、TF） | ✅ 完成 |
| 📊 **可解释性** | SHAP 值分析 + 特征重要性排序 | ✅ 完成 |
| 📝 **在线文档** | GitHub Pages 可视化展示流程 | ✅ 完成 |

---

## 🔄 分析流程

```mermaid
flowchart TD
    A[原始下机数据<br/>bulk RNA-seq / scRNA-seq] --> B(质控与过滤<br/>FastQC / multiQC)
    B --> C{数据整合清洗}
    C --> D[批量校正与去批次<br/>ComBat / Harmony]
    C --> E[scRNA数据整合<br/>降维聚类 & 细胞注释]
    D --> F[表达矩阵标准化<br/>TPM / CPM / log2转化]
    E --> F
    F --> G[特征筛选<br/>固醇代谢通路相关基因<br/>GO:0006694, KEGG]
    G --> H[标注样本表型<br/>① Normal ② 脂肪肝 ③ 肝炎]
    H --> I[随机森林模型训练<br/>5折交叉验证 + 网格调优]
    I --> J[特征重要性排序<br/>SHAP / 基尼重要性]
    J --> K[预测内固醇相关分子<br/>关键候选基因]
    K --> L[模型评估: AUC, F1, 准确率]
    L --> M[输出分子列表 & 可视化]

---

##  📁 仓库结构

SRNL/
├── index.html                 # 🌐 GitHub Pages 主页面
├── README.md                  # 📖 项目说明文档
├── LICENSE                    # ⚖️ MIT 许可证
├── .gitignore                 # 🚫 Git 忽略文件
│
├── scripts/                   # 🛠️ 预处理与分析脚本
│   ├── 01_QC_preprocessing.sh
│   ├── 02_scRNA_integration.R
│   ├── 03_bulk_sc_merge.R
│   ├── 04_random_forest.py
│   ├── 05_shap_analysis.R
│   └── run_all.sh
│
├── data/                      # 💾 数据目录
│   └── clinical_metadata.csv
│
├── results/                   # 📊 输出结果
│   └── figures/
│
└── environment.yml            # 🐍 Conda/R 环境依赖
