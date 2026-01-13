# Telecom Customer Churn Analysis Dashboard
![TelecomDashboard](/Images/TelecomChurn_page1.png)
## 📌 Project Overview
This Power BI dashboard provides a strategic deep dive into customer retention for a telecommunications provider. Designed to identify the "Who, Why, and Where" of customer attrition, the report transforms raw usage and demographic data into actionable insights to reduce churn and protect $25K in at-risk revenue.

## 🛠️ Skills Showcased
Behavioral Segmentation: Identified critical "churn triggers" by bucketizing support call volume and tenure, revealing that customers with 5+ calls are at a near-total risk of leaving.

Financial Impact Analysis: Integrated disparate usage charges (Day/Evening/Night) into a unified Revenue Lost metric to quantify the fiscal reality of churn beyond just customer headcounts.

Geospatial Risk Mapping: Implemented a Top-5 churn rate map to identify geographic "hot spots," allowing for regional-specific marketing interventions.

Advanced UI/UX Design:

Custom Dark Theme: Developed a high-contrast UI to reduce eye strain and emphasize critical "Warning" metrics (Orange/Red).

Progressive Disclosure: Built a Report Page Tooltip for the map visual, allowing users to hover over a state to see specific churn drivers without cluttering the main view.

Navigation & State Management: Implemented a "Reset" bookmark button to clear all slicers and restore the dashboard to its baseline state.

## 📊 Dashboard Breakdown
Page 1: Retention Executive Summary
The primary "Control Center." This page monitors core KPIs (Total Customers, Churn Rate, and Revenue Lost) alongside behavioral drivers like International Plan status and Support Call frequency.

![TelecomDashboard](/Images/TelecomChurn_page1.png)

Page 2: Map Tooltip (Hidden Detail)
A specialized mini-report that appears when hovering over the "Top 5 States" map. It provides a localized snapshot of why specific regions are underperforming, specifically focusing on customer service interactions.

![telecom_tooltip](/Images/Telecom_Tooltip.png)

## 💡 Key Business Insights
The Support Call "Cliff": Churn probability jumps from ~15% to over 60% once a customer reaches 3-4 support calls. Customers with 5+ calls and an International Plan have a 100% churn rate (though small sample size), indicating a critical failure in service or billing for that segment.

The Second-Year Slump: Tenure analysis reveals a significant churn spike in the 13-24 month bucket, suggesting that initial promotional periods or contracts ending are primary drivers for switching.

Revenue Disparity: While International Plan users have a higher rate of churn, the No International Plan segment accounts for the largest volume of actual dollars lost ($17.7K), highlighting where the most significant retention "leaks" are occurring.

## 🏁 Conclusion
The Telecom Analysis Dashboard bridges the gap between customer service data and financial performance. By highlighting that customer service calls are the strongest predictor of churn, the dashboard empowers the retention team to implement "proactive saves"—flagging customers for outreach the moment they hit their 3rd support call.

## 🛠️ Technical Documentation: DAX Measures
The following core measures were developed to drive the logic of this dashboard:

### Financial & Churn Measures
Calculates the total revenue lost by summing day, evening, and night charges for churned customers only.
The foundational revenue measure for the entire dashboard.

```dax
Total Revenue Lost = 
CALCULATE(
    SUMX(
        'Telecom_churn', 
        'Telecom_Churn'[Total day charge] + 'Telecom_Churn'[Total eve charge] + 'Telecom_Churn'[Total intl charge] + 'Telecom_Churn'[Total night charge]
    ), 
    'Telecom_Churn'[Churn] = TRUE()
)
```
The foundational percentage used to track the health of the customer base.
```dax
Churn % = Divide([Churned Customers], [Total Customers])
```
Calculates the count of customers who have officially left the service.
```dax
Churned Customers = Calculate(
Countrows(Telecom_Churn), 'Telecom_Churn'[Churn] = True
)
```
