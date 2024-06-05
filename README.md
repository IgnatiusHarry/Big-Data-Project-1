<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Big-Data-Social-Analysis-1</title>
</head>
<body>
    <h1>Big-Data-Social-Analysis-1</h1>
    <h2>Analysis of Taiwan Presidential Elections (2000 vs. 2024)</h2>
    
    <h3>Introduction</h3>
    <p>
        The 2024 Taiwan presidential election marks the first truly competitive three-way race since the year 2000. In the 2000 election, James Soong left the Kuomintang (KMT) and ran as an independent, significantly challenging the Democratic Progressive Party (DPP) candidate Chen Shui-bian and the KMT’s Lien Chan. Ultimately, Chen Shui-bian won, with only a 2.46% lead over Soong. Over the past 24 years, although other elections included third candidates, they were minor figures. However, in 2024, Ko Wen-je announced his candidacy, supported by a solid base of public opinion, leading to another significant three-way contest reminiscent of a “three kingdoms” drama. From 2000 to 2024, Taiwan and the world have witnessed considerable changes, including three presidencies, the attempted assassination of Chen Shui-bian, and shifting attitudes towards China amid geopolitical changes. These developments invite a deeper exploration of how Taiwan’s political alignment has transformed.
    </p>
    
    <h3>Project Description</h3>
    <p>
        This project aims to analyze changes in Taiwan's political alignment by comparing the partisan characteristics of electoral regions in the 2000 and 2024 presidential elections. This analysis will include aggregating vote counts at the district level, calculating vote share percentages, and examining the correlation between vote shares across the two elections.
    </p>
    <p>
        Moreover, to analyze changes in political alignment between the two elections, I conducted an initial study comparing the partisan characteristics of electoral regions in both elections. One method of comparison that I used is to calculate the Pearson correlation coefficient. The Pearson correlation coefficient measures the linear correlation between two sets of data, ranging from -1 to 1. A coefficient close to 1 indicates a strong positive correlation, meaning regions that voted for a particular party in 2000 also tended to do so in 2024.
    </p>
    
    <h3>Data</h3>
    <p>
        The data consists of village-level voting results from Taiwan's 2000 and 2024 presidential elections with 15,429 total observations. The data includes variables such as the number of votes received by the DPP, KMT, and other candidates, the number of valid votes, and the number of voters.
    </p>
    <h4>Variable Definition:</h4>
    <ul>
        <li><strong>county:</strong> The Chinese names of cities or counties</li>
        <li><strong>county_e:</strong> The English names of cities or counties</li>
        <li><strong>district:</strong> The Chinese names of districts or towns</li>
        <li><strong>district_e:</strong> The English names of districts or towns</li>
        <li><strong>district_id:</strong> The ID number of districts</li>
        <li><strong>li_id:</strong> The ID number of villages</li>
        <li><strong>dpp:</strong> Votes earned by DPP candidates in the 2000 or 2024 election</li>
        <li><strong>kmt:</strong> Votes earned by KMT candidates in the 2000 or 2024 election</li>
        <li><strong>other:</strong> Votes earned by third candidates of James Soong in 2000 or Ko Wen-je in 2024</li>
        <li><strong>valid_vote:</strong> The number of valid votes in the 2000 or 2024 election</li>
        <li><strong>num_voter:</strong> The number of electorates in the 2000 or 2024 election</li>
    </ul>
    
    <h3>File Structure</h3>
    <p>
        Please download the files named <strong>president_2000.zip</strong> and <strong>president_2024.zip</strong>, then unzip them into your working directory. These files contain village-level data (li; 村里) for the districts in Taiwan. The R code for data processing is already provided. It is best to clone the file structure to your local system to run the code without error.
    </p>
    
    <h3>Methodology</h3>
    <h4>Data Cleaning and Preparation:</h4>
    <ul>
        <li>Combine village-level data files into single dataframes for 2000 and 2024.</li>
        <li>Aggregate data at the district level for both elections.</li>
    </ul>
    
    <h4>Data Analysis:</h4>
    <ul>
        <li>Merge the aggregated data from 2000 and 2024.</li>
        <li>Calculate vote share percentages for KMT, DPP, and other candidates.</li>
        <li>Compute Pearson correlation coefficients between vote shares in 2000 and 2024.</li>
    </ul>
    
    <h3>Data Visualization</h3>
    <p>
        Created scatter plots to visualize correlations between vote shares.
    </p>
    
    <h3>Results</h3>
    <p>
        The results include aggregated vote counts, vote share percentages, Pearson correlation coefficients, and scatter plots. The analysis reveals insights into the stability and changes in political alignment in Taiwan over 24 years.
    </p>
</body>
</html>
