# Big-Data-Social-Analysis-1

Analysis of Taiwan Presidential Elections (2000 vs. 2024)

****Introduction****
The 2024 Taiwan presidential election marks the first truly competitive three-way race since the year 2000. In the 2000 election, James Soong left the Kuomintang (KMT) and ran as an independent, significantly challenging the Democratic Progressive Party (DPP) candidate Chen Shui-bian and the KMT’s Lien Chan. Ultimately, Chen Shui-bian won, with only a 2.46% lead over Soong. Over the past 24 years, although other elections included third candidates, they were minor figures. However, in 2024, Ko Wen-je announced his candidacy, supported by a solid base of public opinion, leading to another significant three-way contest reminiscent of a “three kingdoms” drama. From 2000 to 2024, Taiwan and the world have witnessed considerable changes, including three presidencies, the attempted assassination of Chen Shui-bian, and shifting attitudes towards China amid geopolitical changes. These developments invite a deeper 2
exploration of how Taiwan’s political alignment has transformed.

****Project Description****

This project aims to analyze changes in Taiwan's political alignment by comparing the partisan characteristics of electoral regions in the 2000 and 2024 presidential elections. This analysis will include aggregating vote counts at the district level, calculating vote share percentages, and examining the correlation between vote shares across the two elections.

Moreover, To analyze changes in political alignment between the two elections. I conducted an initial study comparing the partisan characteristics of electoral regions in both elections. One method of comparison that I used is to calculate the Pearson correlation coefficient. The Pearson correlation coefficient measures the linear correlation between two sets of data, ranging from -1 to 1. A coefficient close to 1 indicates a strong positive correlation, meaning regions that voted for a particular party in 2000 also tended to do so in 2024.

****Data****

The data consists of village-level voting results from Taiwan's 2000 and 2024 presidential elections with 15429 of total observations. The data includes variables such as the number of votes received by the DPP, KMT, and other candidates, the number of valid votes, and the number of voters.

Variable Definition:

county: The Chinese names of cities or counties

county_e: The English names of cities or counties 

district: The Chinese names of districts or towns

district_e: The English names of districts or towns

district_id: The ID number of districts

li_id: The ID number of villages

dpp: Votes earned by DPP candidates in the 2000 or 2024 election

kmt: Votes earned by KMT candidates in the 2000 or 2024 election

other:  Votes earned by third candidates of James Soong in the 2000 or Ko Wen-je in 2024

valid_vote: The number of valid votes in the 2000 or 2024 election

num_voter: The number of electorates in the 2000 or 2024 election

****File Structure****

Please download the files named president_2000.zip and president_2024.zip, then unzip them into your working directory. These files contain village-level data (li; 村里 ) for the districts in Taiwan. Then, the R code is already provided which is called data processing. It is best to clone the file structure to your local system to run the code without error.

****Methodology****

_Data Cleaning and Preparation:_

> Combine village-level data files into single dataframes for 2000 and 2024.

> Aggregate data at the district level for both elections.


_Data Analysis:_

> Merge the aggregated data from 2000 and 2024.

> Calculate vote share percentages for KMT, DPP, and other candidates.

> Compute Pearson correlation coefficients between vote shares in 2000 and 2024.


****Data Visualization:****

Created scatter plots to visualize correlations between vote shares.

****Results****

The results include aggregated vote counts, vote share percentages, Pearson correlation coefficients, and scatter plots. The analysis reveals insights into the stability and changes in political alignment in Taiwan over 24 years.




