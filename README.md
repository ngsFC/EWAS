# EWAS iDMRtools

**iDMRtools** is an R utility package providing lightweight functions to support genomic analysis of **imprinted differentially methylated regions (iDMRs)**. This repository currently includes tools for:

- Segmenting iDMRs into **central** and **peripheral** regions.
- Identifying the **closest peak** (e.g., from ChIP-seq) to a target CpG or genomic position.

These functions are designed for integration into epigenomic workflows involving imprinted regions and methylation variability.

---

## 📦 Functions

### `segment_iDMRs()`

Divides each iDMR into three segments of genomic coordinates with a 1:2:1 length ratio, classifying them into central and peripheral subregions.

#### **Input**
A data frame containing the following columns:
- `chrom`: Chromosome (e.g., `"chr11"`)
- `start`: Start coordinate of the iDMR
- `end`: End coordinate of the iDMR
- `origin`: Parent-of-origin information (optional)
- `ICR`: Identifier of the iDMR

#### **Output**
A long-format data frame with:
- `chrom`, `start`, `end`: Coordinates of the subregion
- `origin`, `ICR`: Region metadata
- `type`: `"central"` or `"peripheral"`

#### **Example**
```r
segmented <- segment_iDMRs(ICR_data)
head(segmented)
```

#### **Citation**
Please cite : https://www.biorxiv.org/content/10.1101/2025.03.27.645693v1.full
