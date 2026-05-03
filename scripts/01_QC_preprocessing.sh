#!/bin/bash
# 01_QC_preprocessing.sh - FASTQ质控与比对

echo "=== 01. 原始数据质控与预处理 ==="

# 设置参数
RAW_DATA_DIR="data/raw_fastq/"
OUTPUT_DIR="data/processed/"

# 创建输出目录
mkdir -p $OUTPUT_DIR

# FastQC 质量控制
for file in ${RAW_DATA_DIR}*.fastq.gz; do
    fastqc $file -o ${OUTPUT_DIR}fastqc_reports/
done

# 使用 fastp 进行修剪
fastp -i ${RAW_DATA_DIR}sample_R1.fastq.gz \
      -I ${RAW_DATA_DIR}sample_R2.fastq.gz \
      -o ${OUTPUT_DIR}trimmed_R1.fastq.gz \
      -O ${OUTPUT_DIR}trimmed_R2.fastq.gz \
      --detect_adapter_for_pe

echo "=== QC 预处理完成 ==="
