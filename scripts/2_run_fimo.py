#!/usr/bin/env python3
import subprocess

print("[2] Running FIMO motif scans...")
pwm_folder = "motifs"
out_folder = "results/fimo"
subprocess.run(["mkdir", "-p", out_folder], check=True)

for gene in ["tfap2a","soxE","foxd3"]:
    fasta = f"data/{gene}_flank.fa"
    out = f"{out_folder}/{gene}_fimo.tsv"
    cmd = [
        "fimo", "--oc", f"{out_folder}/{gene}", "--thresh", "1e-4",
        "--text", pwm_folder
    ]
    print(f"-- scanning {fasta} → {out}")
    with open(out, "w") as fout:
        subprocess.run(cmd + [fasta], stdout=fout, check=True)
print("[2] Done.")
