# 🔬 SRNL · 绝经女性NAFLD激素治疗响应预测模型

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.9+](https://img.shields.io/badge/Python-3.9+-blue.svg)](https://www.python.org/)
[![R 4.2+](https://img.shields.io/badge/R-4.2+-lightblue.svg)](https://www.r-project.org/)
[![AI Model](https://img.shields.io/badge/AI-7%20Models-green.svg)](https://scikit-learn.org/)
[![NAFLD](https://img.shields.io/badge/NAFLD-Menopause-orange.svg)](https://www.niddk.nih.gov/health-information/liver-disease/nafld)
[![Hormone Therapy](https://img.shields.io/badge/Hormone%20Therapy-Response%20Prediction-ff69b4.svg)]()

> **整合22840例临床样本 + 502例转录组 + 16万单细胞数据，通过7种AI算法构建绝经女性NAFLD激素治疗响应预测模型（SRNL）**

<div align="center">
  <img src="https://img.shields.io/badge/Status-Active-success" alt="Status">
  <img src="https://img.shields.io/badge/Postmenopause-Female%20Health-purple" alt="Postmenopause">
  <img src="https://img.shields.io/badge/Multi--Omics-Integrated-brightgreen" alt="Multi-Omics">
  <img src="https://img.shields.io/badge/SHAP-Interpretable-ff69b4" alt="SHAP">
  <img src="https://img.shields.io/badge/Drug--Target-CYP2C19-red" alt="CYP2C19">
</div>

---

## 📌 目录

- [研究背景](#-研究背景)
- [核心发现](#-核心发现)
- [数据概览](#-数据概览)
- [分析流程](#-分析流程)
- [模型构建](#-模型构建-srnl)
- [临床转化](#-临床转化)
- [仓库结构](#-仓库结构)
- [快速开始](#-快速开始)
- [关键结果](#-关键结果)
- [模型性能](#-模型性能)
- [可视化图集](#-可视化图集-20张)
- [引用](#-引用)
- [联系方式](#-联系方式)

---

## 📖 研究背景

非酒精性脂肪性肝病（NAFLD）及其进展形式非酒精性脂肪性肝炎（NASH）是慢性肝病的主要原因之一。**流行病学研究表明**，NAFLD/NASH的患病率、进展速度及病理严重程度存在显著**性别差异**。

**核心问题**：绝经后女性雌激素水平急剧下降，导致代谢失衡，加速NAFLD向NASH和肝纤维化转化。然而，现有研究多聚焦于男性或混合人群，**绝经后女性特有的NAFLD分子机制尚未被充分解析**。

### 🎯 研究目标

| 目标 | 描述 | 状态 |
|------|------|------|
| 🔬 **临床关联分析** | 雌激素水平与肝功能指标关系 | ✅ 完成 |
| 🧬 **多组学整合** | bulk RNA + scRNA 解析分子机制 | ✅ 完成 |
| 🌲 **AI模型构建** | 7种算法构建SRNL预测模型 | ✅ 完成 |
| 💊 **药物靶点发现** | CYP2C19 → 戊酸雌二醇/雷洛昔芬 | ✅ 完成 |
| 📊 **疗效预测** | SHAP辅助激素治疗决策 | ✅ 完成 |

---

## 💡 核心发现

### 1️⃣ 临床发现
> **雌激素水平与肝脏白蛋白（ALB）呈显著正相关**，激素低值状态可能通过削弱肝脏蛋白合成功能加重肝纤维化风险。

### 2️⃣ 分子机制
> **类固醇合成代谢通路**在绝经女性NAFLD样本中显著富集，涉及**雌激素受体（ESR1）与细胞色素P450家族（CYP2C19, CYP7A1）**。雌激素骤降介导的P450家族表达下调是绝经女性NAFLD高发的**核心机制**。

### 3️⃣ 关键差异
> 相同纤维化评级下，**绝经女性比育龄女性表现出更显著的**：
> - 胆固醇代谢异常
> - 脂质代谢紊乱
> - 细胞色素P450家族异常表达

### 4️⃣ AI预测模型
> 构建**SRNL（Steroid Response NAFLD model）**模型，基于SHAP分析发现**CYP2C19**是核心贡献基因，该基因为激素治疗药物**戊酸雌二醇**与**雷洛昔芬**的作用靶点。

### 5️⃣ 临床转化
> 外源性激素治疗可**显著改善绝经女性NAFLD患者肝功能**（降低AST、升高ALB），SRNL模型可**量化CYP2C19贡献值**，辅助治疗决策。

---

## 📊 数据概览

| 数据类型 | 样本量 | 来源/说明 |
|----------|--------|-----------|
| **临床样本** | 22,840例 | 多中心回顾性队列 |
| **bulk RNA-seq** | 502例 | 绝经女性 vs 育龄女性 |
| **scRNA-seq** | ~160,000个细胞 | 肝脏组织单细胞图谱 |
| **模型训练** | 7种AI算法 | 集成学习 + SHAP解释 |

---

## 🔄 分析流程

```mermaid
flowchart TD
    A[多中心临床队列<br/>22,840例] --> B{激素与肝功能关联分析}
    B --> C[雌激素 ↓ → ALB ↓]
    
    D[bulk RNA-seq<br/>502例] --> E[差异表达分析]
    E --> F[类固醇代谢通路富集<br/>P450家族下调]
    
    G[scRNA-seq<br/>16万细胞] --> H[单细胞图谱构建]
    H --> I[细胞亚群特异性表达]
    
    F --> J[SRNL模型构建]
    I --> J
    C --> J
    
    J --> K[7种AI算法对比]
    K --> L[SHAP可解释性分析]
    L --> M[核心基因: CYP2C19]
    
    M --> N[基因-药物靶点分析]
    N --> O[戊酸雌二醇 / 雷洛昔芬]
    
    O --> P[临床队列验证<br/>激素治疗改善肝功能]
    P --> Q[SRNL辅助疗效预测决策]
