#!/usr/bin/env bash
set -euxo pipefail
echo "[1] Extracting ±100 kb for tfap2a, soxE, foxd3..."
for gene in tfap2a soxE foxd3; do
  echo "-- processing $gene"
  bedtools flank \
    -i annotations/${gene}.bed \
    -g genome/Pmar_germline_1.0.chrom.sizes \
    -l 100000 -r 100000 > data/${gene}_flank.bed
  bedtools getfasta \
    -fi genome/Pmar_germline_1.0.fa \
    -bed data/${gene}_flank.bed \
    -fo data/${gene}_flank.fa
  echo "-- $gene extracted to data/${gene}_flank.fa"
done
echo "[1] Done."
