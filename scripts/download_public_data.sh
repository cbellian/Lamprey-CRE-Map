#!/bin/bash

# Create directories
mkdir -p data/raw
cd data/raw || exit 1

echo "🔽 Downloading public ATAC-seq and ChIP-seq data for Petromyzon marinus..."

# Example datasets – replace with updated SRA/ENA accessions as needed
ATAC_SEQ_SRA="SRR8615295"
CHIP_SEQ_SRA="SRR8615296"

# Download using fasterq-dump (requires sra-tools)
echo "📥 Downloading ATAC-seq data: $ATAC_SEQ_SRA"
fasterq-dump $ATAC_SEQ_SRA --split-files --threads 4

echo "📥 Downloading ChIP-seq data: $CHIP_SEQ_SRA"
fasterq-dump $CHIP_SEQ_SRA --split-files --threads 4

echo "✅ Done downloading raw data."

cd ../../
