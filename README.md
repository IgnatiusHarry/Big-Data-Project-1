****Big-Data-Social-Analysis-1****

Analysis of Taiwan Presidential Elections (2000 vs. 2024)

****Introduction****

The 2024 Taiwan presidential election marks the first truly competitive three-way race since the year 2000. In the 2000 election, James Soong left the Kuomintang (KMT) and ran as an independent, significantly challenging the Democratic Progressive Party (DPP) candidate Chen Shui-bian and the KMT’s Lien Chan. Ultimately, Chen Shui-bian won, with only a 2.46% lead over Soong. Over the past 24 years, although other elections included third candidates, they were minor figures. However, in 2024, Ko Wen-je announced his candidacy, supported by a solid base of public opinion, leading to another significant three-way contest reminiscent of a “three kingdoms” drama. From 2000 to 2024, Taiwan and the world have witnessed considerable changes, including three presidencies, the attempted assassination of Chen Shui-bian, and shifting attitudes towards China amid geopolitical changes. These developments invite a deeper exploration of how Taiwan’s political alignment has transformed.

****Project Description****

This project aims to analyze changes in Taiwan's political alignment by comparing the partisan characteristics of electoral regions in the 2000 and 2024 presidential elections. This analysis will include aggregating vote counts at the district level, calculating vote share percentages, and examining the correlation between vote shares across the two elections.

Moreover, to analyze changes in political alignment between the two elections, an initial study comparing the partisan characteristics of electoral regions in both elections was conducted. One method of comparison used is the Pearson correlation coefficient. The Pearson correlation coefficient measures the linear correlation between two sets of data, ranging from -1 to 1. A coefficient close to 1 indicates a strong positive correlation, meaning regions that voted for a particular party in 2000 also tended to do so in 2024.

**Data**
The data consists of village-level voting results from Taiwan's 2000 and 2024 presidential elections, comprising 15,429 total observations. The data includes variables such as the number of votes received by the DPP, KMT, and other candidates, the number of valid votes, and the number of voters.

****Variable Definition:**
**
> county: The Chinese names of cities or counties

> county_e: The English names of cities or counties

> district: The Chinese names of districts or towns

> district_e: The English names of districts or towns

> district_id: The ID number of districts

> li_id: The ID number of villages

> dpp: Votes earned by DPP candidates in the 2000 or 2024 election

> kmt: Votes earned by KMT candidates in the 2000 or 2024 election

> other: Votes earned by third candidates, specifically James Soong in 2000 or Ko Wen-je in 2024

> valid_vote: The number of valid votes in the 2000 or 2024 election

> num_voter: The number of electorates in the 2000 or 2024 election

****File Structure****

Please download the files named president_2000.zip and president_2024.zip, then unzip them into your working directory. These files contain village-level data (li; 村里) for the districts in Taiwan. The R code for data processing is already provided. It is best to clone the file structure to your local system to run the code without error.

****Methodology****


_Data Aggregation:_

> Combined village-level data into district-level datasets for both elections using rbind(), group_by(), and summarise() functions in R.

_Data Merging:_
> Merged the aggregated district-level datasets from 2000 and 2024 into a single dataframe for comparative analysis.

_Vote Share Calculation:_

> Calculated the vote share percentages for KMT, DPP, and other parties for both elections.
_
__Correlation Analysis:_

> Analyzed the Pearson correlation coefficient between the vote shares of corresponding parties across the two elections.

_Data Visualization:_

> Created scatter plots to visualize the correlations between vote shares for KMT, DPP, and other parties in 2000 and 2024.

**Results**

The results include aggregated vote counts, vote share percentages, Pearson correlation coefficients, and scatter plots. The analysis reveals insights into the stability and changes in political alignment in Taiwan over 24 years. 

_Correlation Analysis:_

The correlation between DPP vote shares in 2000 and 2024 was high, indicating consistent support in certain regions.

The correlation for KMT was lower, suggesting shifts in voter preferences or the impact of third-party candidates.

The correlation for third-party candidates (Soong in 2000 and Ko in 2024) was low, reflecting different dynamics in each election.

_Visualization:_

Scatter plots showed the relationship between vote shares in 2000 and 2024, highlighting regions with stable political preferences and those with significant changes.

_Insights:_

The high correlation for DPP suggests a strong and stable support base.

The lower correlations for KMT and third-party candidates point to more volatility and changing dynamics in these voter bases.

