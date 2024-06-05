library(plyr)
library(dplyr)
library(tidyr)
library(utils)
library(stringr)
library(readr)
library(readxl)
library(ggplot2)
library(corrplot)
library(PerformanceAnalytics)

# I used a loop and use rbind() function to concatenate all district data files from the president_2000 folder into a single dataframe named president_2000_df
filelist_2000 <- list.files("president_2000")
president_2000_df <- data.frame()
for (i in 1:length(filelist_2000)) {
  temp <- read_xlsx(paste0("president_2000/", filelist_2000[i]))
  president_2000_df <- rbind(president_2000_df, temp)
}

# I repeated the process for the president_2024 folder, creating a dataframe 3 named president_2024_df

filelist_2024 <- list.files("president_2024")
president_2024_df <- data.frame()
for (i in 1:length(filelist_2024)) {
  temp <- read_xlsx(paste0("president_2024/", filelist_2024[i]))
  president_2024_df <- rbind(president_2024_df, temp)
}

# I Used group_by() and summarise() to aggregate president_2000_df and president_2024_df at the district level to compute totals for KMT, DPP, other parties, valid votes, and total voters. Store these aggregates in president_district_2000 and president_district_2024, respectively
president_district_2000 <- president_2000_df %>%
  group_by(county, county_e, district, district_e, district_id) %>%
  summarise(kmt_2000 = sum(kmt),
            dpp_2000 = sum(dpp),
            other_2000 = sum(other),
            valid_2000 = sum(valid_vote),
            num_voter_2000 = sum(num_voter))

president_district_2024 <- president_2024_df %>%
  group_by(county, county_e, district, district_e, district_id) %>%
  summarise(kmt_2024 = sum(kmt),
            dpp_2024 = sum(dpp),
            other_2024 = sum(other),
            valid_2024 = sum(valid_vote),
            num_voter_2024 = sum(num_voter))

# Merged president_district_2000 and president_district_2024 into a single dataframe president_2000_2024 for comparative analysis
president_2000_2024 <- president_district_2000 %>%
  full_join(president_district_2024, by = "district_id")

# I Calculated the vote share percentage for KMT, DPP, and other parties for both election
president_2000_2024 <- president_2000_2024 %>%
  mutate(kmt_rate_2000 = kmt_2000 / num_voter_2000,
         kmt_rate_2024 = kmt_2024 / num_voter_2024,
         dpp_rate_2000 = dpp_2000 / num_voter_2000,
         dpp_rate_2024 = dpp_2024 / num_voter_2024,
         other_rate_2000 = other_2000 / num_voter_2000,
         other_rate_2024 = other_2024 / num_voter_2024)

# Calculated Pearson correlation coefficients
cor_kmt <- cor(president_2000_2024$kmt_rate_2000, president_2000_2024$kmt_rate_2024)
cor_dpp <- cor(president_2000_2024$dpp_rate_2000, president_2000_2024$dpp_rate_2024)
cor_other <- cor(president_2000_2024$other_rate_2000, president_2000_2024$other_rate_2024)

# Visualize correlation matrix
corrplot(cor(president_2000_2024[, c("kmt_rate_2000", "kmt_rate_2024", "dpp_rate_2000", "dpp_rate_2024", "other_rate_2000", "other_rate_2024")]), method="circle")

# Scatter plots of vote share correlations
ggplot(president_2000_2024, aes(x = dpp_rate_2000, y = dpp_rate_2024)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("DPP Vote Share Correlation (2000 vs 2024)") +
  xlab("DPP Vote Share 2000") +
  ylab("DPP Vote Share 2024")

ggplot(president_2000_2024, aes(x = kmt_rate_2000, y = kmt_rate_2024)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("KMT Vote Share Correlation (2000 vs 2024)") +
  xlab("KMT Vote Share 2000") +
  ylab("KMT Vote Share 2024")

ggplot(president_2000_2024, aes(x = other_rate_2000, y = other_rate_2024)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Other Candidates Vote Share Correlation (2000 vs 2024)") +
  xlab("Other Candidates Vote Share 2000") +
  ylab("Other Candidates Vote Share 2024")

# Analysis and Interpretation
# The high correlation in DPP vote shares suggests stability in their support base.
# The low correlation for KMT and other candidates indicates more volatility and changes in their support over the years.