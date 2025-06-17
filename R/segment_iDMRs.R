#The segment_iDMRs() function divides each iDMR into central and peripheral genomic subregions.
#For each region in the input data frame (with columns chrom, start, end, origin, and ICR), the function computes three segments of equal width ratio 1:2:1. The region is partitioned into left peripheral, central, and right peripheral segments. Start and end coordinates for each subregion are calculated using the total length divided into quarters, and the resulting segments are labeled as either "central" or "peripheral". The function returns a long-format data frame with one row per subregion, including segment coordinates and type annotations.

library(dplyr)
library(tidyr)

segment_iDMRs <- function(ICRs) {
  ICRs.div <- as.data.frame(ICRs) %>%
    rowwise() %>%
    mutate(
      length = end - start + 1,
      segment = length / 4,
      start1 = round(start),
      end1   = round(start + segment - 1),
      start2 = round(start + segment),
      end2   = round(start + 3 * segment - 1),
      start3 = round(start + 3 * segment),
      end3   = round(end)
    ) %>%
    select(-length, -segment) %>%
    ungroup() %>%
    pivot_longer(
      cols = starts_with("start"),
      names_to = "segment",
      values_to = "start"
    ) %>%
    mutate(
      end = case_when(
        segment == "start1" ~ end1,
        segment == "start2" ~ end2,
        segment == "start3" ~ end3
      ),
      type = ifelse(segment == "start2", "central", "peripheral")
    ) %>%
    select(chrom, start, end, origin, ICR, type) %>%
    na.omit() %>%
    as.data.frame()

  return(ICRs.div)
}


