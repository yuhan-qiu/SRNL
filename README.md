# 🔬 SRNL · Prediction Model of Hormone Therapy Response in Postmenopausal Women with NAFLD

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.9+](https://img.shields.io/badge/Python-3.9+-blue.svg)](https://www.python.org/)
[![R 4.2+](https://img.shields.io/badge/R-4.2+-lightblue.svg)](https://www.r-project.org/)
[![AI Model](https://img.shields.io/badge/AI-7%20Models-green.svg)](https://scikit-learn.org/)
[![NAFLD](https://img.shields.io/badge/NAFLD-Menopause-orange.svg)](https://www.niddk.nih.gov/health-information/liver-disease/nafld)
[![Hormone Therapy](https://img.shields.io/badge/Hormone%20Therapy-Response%20Prediction-ff69b4.svg)]()

> **Integrating 22,840 clinical samples + 502 transcriptome profiles + 160K single-cell data, we constructed the SRNL model with 7 AI algorithms to predict hormone therapy response in postmenopausal women with NAFLD.**

<div align="center">
  <img src="https://img.shields.io/badge/Status-Active-success" alt="Status">
  <img src="https://img.shields.io/badge/Postmenopause-Female%20Health-purple" alt="Postmenopause">
  <img src="https://img.shields.io/badge/Multi--Omics-Integrated-brightgreen" alt="Multi-Omics">
  <img src="https://img.shields.io/badge/SHAP-Interpretable-ff69b4" alt="SHAP">
  <img src="https://img.shields.io/badge/Drug--Target-CYP2C19-red" alt="CYP2C19">
</div>

---

## 📌 Table of Contents

- [Background](#-Background)
- [Key Findings](#-Key-Findings)
- [Data Overview](#-Data-Overview)
- [Single-Cell Quality Control](#-Single-Cell-Quality-Control)
- [Key Results](#-Key-Results)
- [Metabolic Pathway Enrichment](#-Metabolic-Pathway-Enrichment)
- [Model Construction · SRNL](#-Model-Construction--SRNL)
- [Clinical Translation](#-Clinical-Translation)
- [Repository Structure](#-Repository-Structure)
- [Quick Start](#-Quick-Start)
- [Visualization Gallery](#-Visualization-Gallery)
- [Citation](#-Citation)
- [Contact](#-Contact)

---

## 📖 Background

Non-alcoholic fatty liver disease (NAFLD) and its progressive form non-alcoholic steatohepatitis (NASH) are leading causes of chronic liver disease. Epidemiological studies have revealed significant gender differences in the prevalence, progression rate and pathological severity of NAFLD/NASH.

**Core Problem**: The sharp decline of estrogen after menopause leads to metabolic imbalance and accelerates the progression of NAFLD to NASH and liver fibrosis. Most existing studies focus on male or mixed populations, while the unique molecular mechanism of NAFLD in postmenopausal women remains poorly elucidated.

### 🎯 Research Objectives

| Objective | Description | Status |
|------|------|------|
| 🔬 **Clinical Correlation Analysis** | Association between estrogen level and liver function indicators | ✅ Completed |
| 🧬 **Multi-Omics Integration** | Molecular mechanism analysis via bulk RNA + scRNA | ✅ Completed |
| 🌲 **AI Model Construction** | Build SRNL prediction model with 7 algorithms | ✅ Completed |
| 💊 **Drug Target Identification** | CYP2C19 linking Estradiol Valerate / Raloxifene | ✅ Completed |
| 📊 **Therapeutic Efficacy Prediction** | SHAP-assisted decision-making for hormone therapy | ✅ Completed |

---

## 💡 Key Findings

### 1️⃣ Clinical Findings
> Serum estrogen level is significantly positively correlated with liver albumin (ALB). Low estrogen status may aggravate liver fibrosis risk by impairing hepatic protein synthesis.

### 2️⃣ Molecular Mechanism
> Steroid biosynthesis and metabolic pathways are significantly enriched in NAFLD samples from postmenopausal women, involving estrogen receptor (ESR1) and cytochrome P450 family genes (CYP2C19, CYP7A1). Estrogen decline-induced downregulation of P450 family is the core mechanism underlying high NAFLD susceptibility in postmenopausal females.

### 3️⃣ Intergroup Differences
> At the same fibrosis grade, postmenopausal women exhibit more significant abnormalities than reproductive-age women in:
> - Cholesterol metabolism
> - Lipid metabolism
> - Dysregulated expression of cytochrome P450 family

---

## 📊 Data Overview

| Data Type | Sample Size | Source / Description |
|----------|--------|-----------|
| **Clinical Cohort** | 22,840 | Multi-center retrospective cohort |
| **bulk RNA-seq** | 502 | Postmenopausal vs Reproductive-age females |
| **scRNA-seq** | ~160,000 cells | Liver single-cell atlas |
| **Model Training** | 7 AI Algorithms | Ensemble learning + SHAP interpretation |

---

## 🔬 Single-Cell Quality Control

The figure below shows scRNA-seq quality control metrics, including the number of detected genes per cell (nFeature_RNA), UMI counts (nCount_RNA), mitochondrial gene proportion (percent.mt) and hemoglobin gene proportion (percent.HBG). High-quality cells were retained for downstream analysis after filtering.

<div align="center">
  <img src="results/figures/01.png" alt="Single-cell QC plot" width="80%">
  <br>
  <sub>Figure 1: Single-cell quality control — Distribution of nFeature_RNA, nCount_RNA, percent.mt, percent.HBG</sub>
</div>

---

## 📊 Key Results

### Differential Expression Analysis of CYP450 Family

The plot illustrates expression differences of CYP450 family genes between NAFLD patients of postmenopausal and reproductive-age females. Multiple CYP genes are markedly downregulated in postmenopausal women, indicating that estrogen deficiency mediated CYP450 downregulation is the core molecular mechanism of high NAFLD incidence in postmenopausal females.

<div align="center">
  <img src="results/figures/05.png" alt="CYP450 volcano plot" width="80%">
  <br>
  <sub>Figure 2: Volcano plot of CYP450 family differential expression (Log₂ Fold Change vs -Log₁₀ P-value)</sub>
</div>

**Key Differentially Expressed Genes**:

| Gene | Log₂FC | -Log₁₀ P | Regulation | Function |
|------|:------:|:--------:|:--------:|------|
| CYP4F1 | 2.8 | 11.5 | ↑ Up | Fatty acid metabolism |
| CYP7A1 | 0.6 | 10.5 | ↑ Up | Bile acid synthesis |
| CYP2C9 | 0.4 | 9.5 | ↓ Down | Drug metabolism |
| CYP2C19 | -0.2 | 5.0 | ↓ Down | **Hormone therapy target** |

---

## 🧬 Metabolic Pathway Enrichment

GO functional enrichment analysis shows that DEGs related to NAFLD in postmenopausal women are significantly enriched in the following pathways:

<div align="center">
  <img src="results/figures/06.png" alt="Pathway enrichment plot" width="80%">
  <br>
  <sub>Figure 3: GO metabolic pathway enrichment — Top 20 enriched terms</sub>
</div>

**Top 5 Significantly Enriched Pathways**:

| Rank | GO Term | Description | FDR |
|:----:|--------|----------|:---:|
| 1 | small molecule catabolic process | Small molecule catabolism | < 0.01 |
| 2 | organic acid catabolic process | Organic acid catabolism | < 0.01 |
| 3 | **steroid response to xenobiotic stimulus** | **Steroid response to xenobiotic stimulus** | < 0.01 |
| 4 | lipid catabolic process | Lipid catabolism | < 0.01 |
| 5 | fatty acid metabolic process | Fatty acid metabolism | < 0.01 |

> **Key Conclusion**: The pathway `steroid response to xenobiotic stimulus` is remarkably enriched, directly supporting that steroid metabolic disturbance serves as the core mechanism of NAFLD in postmenopausal women.

---

## 🤖 Model Construction · SRNL

### Performance Comparison of 7 AI Algorithms

| Model | Type | AUC | Features |
|------|------|:----:|------|
| **SRNL (Ensemble)** | Stacking Ensemble | **0.94** | Optimal performance |
| XGBoost | Tree-based | 0.92 | Fast training |
| Random Forest | Bagging | 0.91 | Strong robustness |
| LightGBM | Gradient Boosting | 0.91 | Memory efficiency |
| SVM | Kernel Method | 0.87 | Suitable for small samples |
| Logistic Regression | Linear Model | 0.84 | Baseline model |
| Neural Network | Deep Learning | 0.89 | Complex pattern capture |

### SHAP Core Feature Contribution

| Rank | Gene | Function | SHAP Value |
|:----:|------|------|:------:|
| 1 | **CYP2C19** | Cytochrome P450 family, drug metabolism | **0.156** |
| 2 | CYP7A1 | Rate-limiting enzyme in bile acid synthesis | 0.089 |
| 3 | ESR1 | Estrogen receptor alpha | 0.072 |
| 4 | HSD17B10 | Steroid dehydrogenase | 0.058 |
| 5 | SCARB1 | Cholesterol uptake receptor | 0.045 |

---

## 💊 Clinical Translation

### Gene-Drug Target
- **Core Target Gene**: CYP2C19
- **Associated Drugs**:
  - Estradiol Valerate: Exogenous hormone replacement therapy
  - Raloxifene: Selective estrogen receptor modulator

### Hormone Therapy Efficacy Evaluation

| Index | Pre-treatment | Post-treatment | Change |
|------|:------:|:------:|:----:|
| AST (U/L) | 48.2 ± 12.5 | 35.6 ± 9.8 | ↓ 26% |
| ALT (U/L) | 52.3 ± 15.1 | 41.2 ± 11.3 | ↓ 21% |
| ALB (g/L) | 38.5 ± 4.2 | 42.1 ± 3.6 | ↑ 9% |

> **Conclusion**: Exogenous hormone therapy can significantly improve liver function in NAFLD patients after menopause.

---

## 📁 Repository Structure
```text
SRNL/
├── index.html          # 🌐 GitHub Pages homepage
├── README.md           # 📖 Project documentation
├── LICENSE             # ⚖️ MIT License file
├── .gitignore          # 🚫 Git ignore configuration
│
├── results/figures/    # 📊 Result figure directory
│   ├── 01.png          # Single-cell QC plot
│   ├── 05.png          # CYP450 differential expression volcano plot
│   └── 06.png          # Metabolic pathway enrichment plot
│
├── scripts/            # 🛠️ Analysis scripts
│   ├── 01_clinical_analysis.R
│   ├── 02_bulk_deg_analysis.R
│   ├── 03_scRNA_integration.R
│   ├── 04_model_training.py
│   ├── 05_shap_analysis.py
│   └── 06_drug_target.R
│
├── data/               # 💾 Raw and processed data
├── results/            # 📊 Analysis output results
├── docs/               # 📚 Supplementary documents
└── environment.yml     # 🐍 Conda environment configuration

---

## 🚀 Quick Start
```bash
# Clone repository
git clone https://github.com/yuhan-qiu/SRNL.git
cd SRNL

# Create conda environment
conda env create -f environment.yml
conda activate srnl

# Run full analysis pipeline
bash scripts/run_all.sh
```

---

## 📈 Visualization Gallery

All result figures are stored in: results/figures/

---

##  Citation
```bibtex
@article{Qiu_SRNL_2025,
  title = {Steroid Response NAFLD model: integrating multi-omics and AI to predict hormone therapy response in postmenopausal women with NAFLD},
  author = {Yuhan Qiu and The Second Affiliated Hospital of Chongqing Medical University},
  journal = {PGDIS 2026},
  year = {2025},
  url = {https://github.com/yuhan-qiu/SRNL}
}
```


---

##  📞 Contact
- Author: Yuhan Qiu
- Affiliation: The Second Affiliated Hospital of Chongqing Medical University
- GitHub: https://github.com/yuhan-qiu/SRNL
