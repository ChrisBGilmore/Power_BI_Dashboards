# My Power BI Dashboard Portfolio

Welcome! This repository serves as a showcase of my data visualization and business intelligence projects. Each dashboard is designed to solve specific business problems by transforming raw data into interactive, actionable insights.

Below you will find my featured projects, including detailed Project Documentation (READMEs) covering the technical logic, DAX modeling, and analytical conclusions for each.

## 📊 Featured Dashboards
 
### 1\. 2024 Data Jobs Market Analysis
![job_dashboard_page1](/Images/Dashboard.png)
Strategic Focus: Centralizing fragmented job market data into an interactive intelligence tool for career planning and salary negotiation.

Market Intelligence: Real-time tracking of median salaries and job volumes across global regions.

Candidate Optimization: Correlation analysis between technical skills (SQL, Python, Power BI) and compensation levels to prioritize skill development.

### Key Power BI Skills Utilized
⚡ ETL & Data Prep: Cleaned and normalized raw 2024 job data using Power Query.

📊 Dynamic Visuals: Used Trend Lines, Bar, & Area charts to track market volume.

🎯 KPI Monitoring: Developed Card visuals for median salaries and job counts.

🖱️ UX Design: Implemented Bookmarks, Buttons, and Slicers for an app-like feel.

🔍 Advanced Drill-Through: Built deep-dive layers to explore specific roles and locations.

### 💡 Credits & Acknowledgements

This project was built as part of the **"Power BI for Data Analytics"** course by **Luke Barousse**. 

* **Course Link:** [Power BI for Data Analytics - Full Course for Beginners](https://www.youtube.com/watch?v=FwjaHCVNBWA)
* **Data Source:** The dataset was provided as part of the course materials, featuring real-world 2024 job postings.

While following the course framework, I implemented the ETL logic, DAX measures, and dashboard design to reinforce my end-to-end Power BI development skills.

[🔗 **View Full Project 1 & Documentation**](/Jobs%20Dashboard/README.md)

### 2\. AdventureWorks: Sales & Profitability Suite
![sales_datapage1](/Images/SalesDashboard.png)
Strategic Focus: Transforming raw sales data into a "Top-Down" decision-support tool for executive and tactical management.

Executive Insights: High-level monitoring of $109.81M in sales and 121K orders with efficiency benchmarking.

Product Diagnostics: Advanced scatter plot quadrant analysis used to identify "Underperformer" vs. "Star" products.

### Key Power BI Skills Utilized
💰 Financial Logic: Created DAX measures for Total Sales, Gross Profit, and Margins.

📈 Efficiency Benchmarking: Identified high-margin categories using Bar & Combo charts.

📍 Quadrant Analysis: Used Scatter Plots to categorize product performance.

🔄 Interactive Flow: Configured Drill-Throughs to navigate from summary to diagnostic views.

🏷️ Dynamic UI: Developed DAX-driven titles that update based on user filters.

[🔗 **View Full Project 2 & Documentation**](/AdventureWorks%20Sales%20Dashboard/README.md)

### 3\. Telecom Analysis: Customer Retention & Revenue Protection

![Telecom_page1](/Images/TelecomChurn_page1.png)

Strategic Focus: Transforming usage patterns and service interactions into a "Proactive Retention" tool to mitigate customer attrition and protect at-risk revenue.

Executive Insights
High-Level Monitoring: Tracking the health of a 2.67K customer base with a specialized focus on the 14.55% churn rate.

Revenue at Risk: Quantified the financial impact of churn by aggregating disparate usage charges into a $25K Total Revenue Lost metric.

Geographic Hot-Spotting: Identified the "Top 5" underperforming states by churn rate to allow for regional-specific retention strategies.

### Key Power BI Skills Utilized
💰 Financial Impact Logic: Developed complex SUMX DAX measures to calculate revenue loss for churned customers. 

📞 Behavioral Segmentation: Utilized bucketization to identify a "Service Cliff," proving that churn risk hits ~60% after the 3rd support call.

🔄 Interactive Flow & State Management: Implemented Bookmark-driven Reset buttons and a centralized control center for Area Code and State slicers.

🏷️ Dynamic UI & Tooltips: Developed a Report Page Tooltip for the map visual, providing a "Deep Dive" into regional churn drivers without cluttering the main view.

📈 Life-Cycle Analysis: Used Line Charts to pinpoint a critical churn spike during the 13-24 month tenure window, identifying the "Second-Year Slump."

[🔗 **View Full Project 3 & Documentation**](/Telecom%20Churn%20Dashboard/README.md)

###  4\. Rotten Tomatoes Cinema Analytics: Critic vs. Audience Sentiment
![media_page1](/Images/Media_page1.png)

Strategic Focus: Analyzing the divergent perspectives of professional critics and general audiences to identify "Cult Classics," "Oscar Bait," and century-long quality trends in film and television.

Executive Insights

Dual-Lens Sentiment Tracking: Developed a unified engine to monitor 3.4K titles, allowing stakeholders to pivot the entire report between Critic and Audience perspectives.

The "Polarization" Index: Quantified "Critical Discord" by building an absolute error measure to identify titles where public and professional opinions differ by over 50%.

Historical Quality Narratives: Transitioned from noisy yearly data to Decadal Smoothing to visualize the evolution of genres from the Silent Era (1920s) to the Modern Streaming Era.

### Key Power BI Skills Utilized
🎭 Metric Switching (Field Parameters): Engineered dynamic DAX logic that swaps all visuals and calculations on the fly based on the user's selection of "Critic" or "Audience" scores.

⚖️ Sentiment Gap Analysis: Authored custom DAX to filter for "Ghost Gaps"—ensuring movies missing one side of the data don't skew the "Most Controversial" rankings.

🖥️ Advanced UX/UI "App" Design: Developed a high-contrast dark theme using rounded containers and neon-blue borders to simulate a modern streaming interface.

🎛️ Dynamic Threshold Navigation: Built a Numeric Range Parameter dropdown that acts as an "Elite Filter," allowing users to instantly isolate movies with 90%+ ratings across any genre.

🔍 Advanced Drill-Through: Built a genre deep-dive layer to find top reviewed movie/shows for any genre as well as exploring historical trends. 

[🔗 **View Full Project 4 & Documentation**](/Rotten%20Tomatoes%20Dashboard/README.md)