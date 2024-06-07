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

#other Cor visualization
library(PerformanceAnalytics)
chart.Correlation(president_2020_2024[, c(16:21)], histogram=TRUE, pch=19)

# Visualize correlation matrix
corrplot(cor(president_2000_2024[, c("kmt_rate_2000", "kmt_rate_2024", "dpp_rate_2000", "dpp_rate_2024", "other_rate_2000", "other_rate_2024")]), method="circle")

# Scatter plots of vote share correlations
plot1 <- ggplot(president_2000_2024, aes(x = dpp_rate_2000, y = dpp_rate_2024)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("DPP Vote Share Correlation (2000 vs 2024)") +
  xlab("DPP Vote Share 2000") +
  ylab("DPP Vote Share 2024")

plot2 <- ggplot(president_2000_2024, aes(x = kmt_rate_2000, y = kmt_rate_2024)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("KMT Vote Share Correlation (2000 vs 2024)") +
  xlab("KMT Vote Share 2000") +
  ylab("KMT Vote Share 2024")

plot3 <- ggplot(president_2000_2024, aes(x = other_rate_2000, y = other_rate_2024)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Other Candidates Vote Share Correlation (2000 vs 2024)") +
  xlab("Other Candidates Vote Share 2000") +
  ylab("Other Candidates Vote Share 2024")

library(gridExtra)
combined_plot <- grid.arrange(plot1, plot2, plot3, ncol = 1)
#Analyzing DPP performance in the 2000 and 2024 presidential elections in Taiwan, 
#we can observe a high correlation in their vote share at the district levels. 
#Districts that predominantly voted for the DPP in 2000 also showed similar support in 2024. 
#This indicates that the traditional blue-green political alignment in Taiwan has remained largely unchanged over the past 24 years.

#However, the correlation between KMT and third-party candidates in these elections is markedly low. 
#In 2000, Soong captured a significant portion of votes from traditional KMT supporters. 
#In 2024, Ko attempted a similar strategy but was less successful, only managing to place third.



# -------------------------------------------------------------------------

#This suggests that while the KMT's voter base has not drastically shifted since 2000, 
#the correlation between Soong's 2000 vote share and the KMT's 2024 vote share is high, 
#indicating some consistency but also potential volatility within the KMT's support base.

cor(president_2020_2024$other_rate_2000, president_2020_2024$kmt_rate_2024)

ggplot(president_2020_2024, aes(x = other_rate_2000, y = kmt_rate_2024, label = paste0(county_e, district_e))) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Figure 4: Soong's 2000 and KMT's 2024 percentage of vote shares") +
  xlab("Soong's percentage of vote shares in 2000") + 
  ylab("KMT's percentage of vote shares in 2024") +
  geom_text(check_overlap = TRUE) +
  geom_label()

#It's also important to note that the correlation between the KMT's 2000 vote share 
#and Ko Wen-je's 2024 vote share is very low. 
#This highlights that in 2024 there was indeed some space for a third force to emerge, 
#disrupting the traditional two-party dynamic, although not to a transformative extent.

cor(president_2020_2024$kmt_rate_2000, president_2020_2024$other_rate_2024)

ggplot(president_2020_2024, aes(x = kmt_rate_2000, y = other_rate_2024, label = paste0(county_e, district_e))) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Figure 5：KMT's 2000 and Ko's 2024 percentage of vote shares") +
  xlab("KMT's percentage of vote shares in 2000") + 
  ylab("Ko's percentage of vote shares in 2024")
