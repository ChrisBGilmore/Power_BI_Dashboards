# Rotten Tomatoes Analytics Dashboard
![Media_page1](/Images/Media_page1.png)
## 📌 Project Overview
This Power BI dashboard provides an interactive deep dive into the divergent perspectives of professional critics and general audiences across a century of film and television history. By analyzing over 3,000 titles, the report identifies "Cult Classics" (high audience/low critic) and "Oscar Bait" (high critic/low audience), providing a data-driven look at genre trends and the evolving definition of "quality" in media.

## 🛠️ Skills Showcased
Dynamic Metric Switching (Field Parameters): Implemented a dual-engine toggle allowing users to swap the entire dashboard's logic between Critic Score and Audience Score with a single click as well as genre slicer to break it down to one/multiple genres.

Advanced Filtering Logic: Developed a Numeric Range Parameter to allow users to define their own "Elite" threshold (e.g., only viewing movies with a 95%+ rating).

Statistical Sentiment Analysis: Created a custom Score Gap algorithm to mathematically identify "polarizing" media where professional and public opinions differ by more than 50%.

Premium UI/UX Design:

Custom Dark Mode App Interface: Built a high-fidelity UI using rounded containers and neon-blue accents to provide a modern, "Streaming Service" aesthetic.

Hierarchical Navigation: Leveraged Genre Drill-throughs and Bookmark-based Resets to manage complex user paths without overwhelming the landing page.

## 📊 Dashboard Breakdown
### Page 1: Cinema Executive Summary
![Media_page1](/Images/Media_page1.png)

The "Macro View" of the dataset. This page tracks core KPIs like Media Count and Median Scores across all genres. It tracks a century of movies/shows genres/media released. It features a Treemap for volume analysis and a distribution histogram to show how scores cluster across the 0-100% scale.

### Page 2: Genre Deep-Dive (Drill-Through)
![Media_page2](/Images/Media_page2.png)

A specialized page focused on the "Who and When" of a specific genre. Tracks core KPIs like median critic/audience score across the genre. Top Ranked Titles for either audience or critics with A bar chart responding to the user-defined Score Threshold.  A dual-line chart showing the evolution of the genre by Decade (1920s–2020s) to track historical trends. A list of the most controversial titles based on the calculated Score Gap.

## 💡 Key Business Insights
The Decoupling of Sentiment: Analysis reveals that in genres like Horror, Audience and Critic scores began to significantly diverge in the early 2000s, suggesting a shift in genre tropes that satisfy fans but alienate critics.

Genre Volatility: Using the Decade-view line chart, it is evident that Mystery & Thriller maintains the most consistent quality over time, whereas Comedy shows the highest score volatility decade-to-decade.

The "Cult Classic" Profile: By filtering for the largest Score Gaps, we can identify titles that successfully bypassed critical approval to achieve 90%+ Audience satisfaction—critical data for studios looking to understand "un-reviewable" hits.

## 🏁 Conclusion
The Rotten Tomatoes Analytics Dashboard bridges the gap between raw ratings and cultural sentiment. By allowing users to toggle between Critic and Audience viewpoints, it highlights the subjectivity of art and provides a tool for content distributors to identify which genres are most likely to produce "crowd-pleasers" regardless of critical reception.

## 🛠️ Technical Documentation: DAX Measures
The following core measures were developed to drive the logic of this dashboard:

The Score Gap (Polarization Metric)
Identifies the absolute difference between the two primary metrics, safely ignoring titles that lack data in either category to prevent false 100% results.
```dax
Score Gap = 
IF(
    ISBLANK([Median Critic Score]) || ISBLANK([Median Audience Score]), 
    BLANK(), 
    ABS([Median Critic Score] - [Median Audience Score])
)
```
Two measures to build the two parameters (field and numeric) used on top favorites bar chart to allow the favorites switch between audience/critic as well as score threshold scroll bar drop down. 

```dax
Selected Score Value = 
IF(
    SELECTEDVALUE('C or A'[C or A Order]) = 0, 
    [Median Critic Score], 
    [Median Audience Score]
)
```

```dax
Dynamic Threshold Filter = 
VAR SelectedScore = [Selected Score Value]
VAR UserCutoff = SELECTEDVALUE('Score Threshold'[Score Threshold], 0.80)
RETURN
    IF(SelectedScore >= UserCutoff, 1, 0)
```
Due to there not being a unique key for each show/movie on the list and some such as "scream" being both a movie and a tv show causing incorrect counts I created a new column called "Media Key" with the title of the media combined with the type (movie or tv).
```dax
Media Count = distinctcount(Media[Media key])
``` 

