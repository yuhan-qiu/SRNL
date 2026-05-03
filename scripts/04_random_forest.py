#!/usr/bin/env python3
# 04_random_forest.py - 随机森林训练与特征重要性

import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.metrics import classification_report, confusion_matrix, roc_auc_score
import joblib

print("=== 04. 随机森林模型训练 ===")

# 读取数据
data = pd.read_csv("data/processed/integrated_steroid_matrix.csv", index_col=0)
metadata = pd.read_csv("data/clinical_metadata.csv")

# 准备特征和标签
X = data.values
y = metadata['condition'].map({'Normal': 0, 'Steatosis': 1, 'Steatohepatitis': 2}).values

# 划分训练集和测试集
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)

# 训练随机森林
rf = RandomForestClassifier(
    n_estimators=500,
    max_depth=10,
    min_samples_split=5,
    random_state=42,
    n_jobs=-1
)
rf.fit(X_train, y_train)

# 评估
y_pred = rf.predict(X_test)
print("\n分类报告:")
print(classification_report(y_test, y_pred, target_names=['Normal', 'Steatosis', 'Steatohepatitis']))

# 特征重要性
feature_importance = pd.DataFrame({
    'gene': data.columns,
    'importance': rf.feature_importances_
}).sort_values('importance', ascending=False)

print("\nTop 10 重要特征:")
print(feature_importance.head(10))

# 保存模型
joblib.dump(rf, "results/rf_model.pkl")
feature_importance.to_csv("results/feature_importance.csv", index=False)

print("\n=== 模型训练完成 ===")
