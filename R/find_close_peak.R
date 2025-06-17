#The find_closest_peak() function identifies the closest genomic feature from a reference set.
#Given a data frame df1 containing genomic coordinates (specifically a Start column), and a target position start_pos, the function computes the absolute distance between each feature's start coordinate and the target. It returns the row(s) corresponding to the closest feature(s). Ties (i.e., multiple features at the same minimal distance) are returned as multiple rows.

find_closest_peak <- function(df1, start_pos) {
  df1 <- df1 %>%
    mutate(Distance = abs(Start - start_pos))
  
  closest_row <- df1 %>%
    filter(Distance == min(Distance))
  return(closest_row)

}

