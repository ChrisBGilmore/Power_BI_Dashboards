# AdventureWorks Sales Performance Dashboard
![sales_dashboardpage1](/Images/SalesDashboard.png)
## 📌 Project Overview
This Power BI suite provides a comprehensive analysis of sales performance, profitability, and product efficiency for AdventureWorks. The dashboard is designed around a "Top-Down" analytical journey, moving from high-level business health to granular product diagnostics.

## 🛠️ Skills Showcased
Executive Summary Design: Built a strategic "Control Center" to monitor global performance across all categories.

Efficiency Benchmarking: Utilized margin analysis to identify that while Bikes drive volume, Accessories are the most efficient category at a 49.88% margin.

Portfolio Health Checks: Implemented Quadrant Analysis (Scatter Plots) to categorize products into "Stars" and "Underperformers".

Advanced Interactive Reporting:

Dynamic Page Titles: DAX-driven titles that update based on selected categories (e.g., "Sales vs Gross Profit: Bikes").

Progressive Disclosure: Used Drill-Through functionality to allow users to navigate from summary data to detailed category pages while maintaining filter context.

Visual Consistency: Developed a custom dark-theme UI with a color-blind friendly palette (Blue for Sales, Orange for Profit) to reduce cognitive load.

## 📊 Dashboard Breakdown
### Page 1: Executive Summary (The "What")
![dashboard_salespage1](/Images/SalesDashboard.png)
Monitors the pulse of the business. Includes core KPI tracking for Total Sales ($109.81M), Total Orders (121K), and Gross Profit ($13M), alongside historical trends from 2017 to 2020.

### Page 2: Category Drill-Through (The "Why")
![dashboard_salespage2](/Images/bikes.png)
Provides a focused environment for Category Managers. This page breaks down sub-category mix (e.g., Road vs. Mountain Bikes) and uses trend lines to identify specific SKUs driving or dragging category revenue.

## 💡 Key Business Insights
Revenue Peak: Analysis identifies 2019 as the "gold standard" year for volume and profit, providing a clear benchmark for recovery.

Margin Warning: Identified that the "Bikes" category, despite dominating revenue ($94.62M), operates at a low 11.11% margin, triggering the need for the product-level deep dive on Page 2.

## 🏁 Conclusion
The AdventureWorks Dashboard bridges the gap between executive monitoring and tactical management. By transforming raw sales data into a decision-support tool, it empowers teams to identify "Question Mark" products—those with high volume but low profit—and optimize the overall product portfolio to protect the bottom line.

## 🛠️ Technical Documentation: DAX Measures
To drive the interactivity and advanced analytics shown in this dashboard, the following core DAX measures were developed:

### Dynamic UI Measures
This measure is used for the report header on the Category Analysis page to provide immediate context based on user filtering.
```dax
Dynamic Category Title = 
VAR SelectedCat = SELECTEDVALUE('Product'[Category], "Category")
RETURN
    "Sales vs Gross Profit: " & SelectedCat
```
### Financial Performance Measures
The foundational revenue measure for the entire dashboard.
```dax
Total Sales = 
SUM(Sales[SalesAmount])
```
Used to calculate the investment in goods sold.
```dax
Total Cost = 
SUM(Sales[TotalProductCost])
```
Calculates the remaining profit after subtracting costs from revenue.
```dax
Gross Profit = 
[Total Sales] - [Total Cost]
```
A key efficiency metric used to compare profitability across categories like Bikes vs. Accessories.
```dax
Profit Margin % = 
DIVIDE(
    [Gross Profit], 
    [Total Sales], 
    0
)
```
### Order & Productivity Metrics
Tracks the total volume of transactions processed.
```dax
Total Orders = 
DISTINCTCOUNT(Sales[OrderNumber])
```
Measures the average spend per transaction.
```dax
Average Order Value = 
DIVIDE(
    [Total Sales], 
    [Total Orders], 
    0
)
```
Used to establish the X-axis for the Product Quadrant Analysis scatter plot.
```dax
AVERAGEX(
    ALLSELECTED('Product'[Product]), 
    [Gross Profit]
)
```
Used to establish the Y-axis for the Product Quadrant Analysis scatter plot.
```dax
Avg Sales per Product = 
AVERAGEX(
    ALLSELECTED('Product'[Product]), 
    [Total Sales]
)
```
