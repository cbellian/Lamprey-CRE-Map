#!/usr/bin/env python3
import pandas as pd

print("[3] Computing annotations and merging tables...")
for gene in ["tfap2a","soxE","foxd3"]:
    df_fimo = pd.read_csv(f"results/fimo/{gene}/fimo.tsv", sep="\t")
    print(f"-- {gene} FIMO hits: {len(df_fimo)}")
    out = f"data/{gene}_annotations.csv"
    print(f"-- writing annotated CSV to {out}")
    df_fimo.to_csv(out, index=False)
print("[3] Done.")
