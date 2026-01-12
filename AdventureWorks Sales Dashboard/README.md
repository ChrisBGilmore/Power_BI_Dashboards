# AdventureWorks Sales Performance Dashboard

![Sales_dashboard](/AdventureWorks%20Sales%20Dashboard/Images/SalesDashboard.png)

## Project Overview
This Power BI project provides a comprehensive analysis of sales performance, profitability, and product efficiency for AdventureWorks. The dashboard is structured into a two-page analytical journey: an Executive Summary for high-level business health and a Category Drill-Through for deep-dive product diagnostics.

## Key Accomplishments
Executive Summary (The "What")
The landing page serves as a strategic "Control Center" for leadership to monitor global performance across all categories.

Core KPI Tracking: Monitors Total Sales ($109.81M), Total Orders (121K), and Gross Profit ($13M).

Efficiency Benchmarking: Uses a Profit Margin % by Category bar chart to reveal that while Bikes drive the most volume, Accessories are the most efficient at a 49.88% margin.

Historical Context: Implements dual-axis combo charts to correlate Order Volume with Sales and Profit trends from 2017 to 2020.

Category Drill-Through (The "Why")
This page provides a focused environment for Category Managers to investigate specific performance drivers.

![Dashboard_page2](/AdventureWorks%20Sales%20Dashboard/Images/SalesDashboard2.png)

Dynamic User Experience: Features a dynamic page title ("Sales vs Gross Profit: Bikes") that automatically updates based on the selected category.

Product Portfolio Analysis: Utilizes a Scatter Plot with a mathematical Trend Line and Quadrant Analysis to categorize products into "Stars," "Underperformers," and "Niche" items.

Segment Breakdown: Includes a Sub-Category Pie Chart to visualize the internal mix of a category, such as the $22.29M split for Road Bikes vs. $8.72M for Mountain Bikes.

Performance Outliers: Employs a Top 10 Products bar chart to identify specific SKUs driving the majority of category revenue.

Technical Features Demonstrated
Advanced DAX: Implemented dynamic titles and time-intelligence measures for YoY growth and historical comparisons.

Drill-Through Functionality: Seamless navigation from summary data to detailed category pages while maintaining filter context.

Quadrant & Trend Analysis: Integrated constant lines and trend lines in scatter visuals to perform portfolio health checks.

Visual Consistency: Developed a custom dark-theme UI with a consistent color palette (Blue for Sales, Orange for Profit) to reduce cognitive load.

Data Insights
Revenue Peak: The business saw its highest sales and profit performance in 2019, followed by a margin-compressed 2020.

Margin Warning: The "Bikes" category represents the highest revenue but operates at a relatively low margin of 11.11%, signaling a need for the detailed product-level analysis provided on the second page.

## Conclusion
The AdventureWorks Sales Performance Dashboard successfully bridges the gap between high-level executive monitoring and tactical product management.

By implementing a progressive disclosure design—starting with the "Executive Summary" and drilling into "Category Analysis"—the dashboard ensures that users are never overwhelmed by data, yet always one click away from a deep-dive solution.

The primary business outcomes of this project include:

Improved Margin Awareness: Highlighting that while Bikes dominate revenue ($94.62M), their low margin (11.11%) requires more oversight than the highly efficient Accessories category (49.88%).

Actionable Outlier Identification: The use of quadrant analysis and trend lines in the scatter plot allows managers to instantly identify "Question Mark" products that have high sales volume but are currently underperforming in profitability.

Historical Benchmarking: Providing a 4-year trend analysis that identifies 2019 as the "gold standard" for volume and profit, giving the team a clear target for future performance recovery.

Ultimately, this dashboard transforms raw sales data into a decision-support tool that empowers the AdventureWorks team to optimize their product portfolio and protect their bottom line.