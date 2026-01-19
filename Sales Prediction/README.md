# Sales Forecasting & Scenario Analytics Dashboard
![forecasting_page1](/Images/Predictions_1.png)

## 📌 Project Overview
This Power BI dashboard transforms historical sales data into an interactive predictive tool. Designed for sales directors and operations managers, the report moves beyond simple reporting to provide forward-looking "What-If" analysis. By integrating baseline forecasts with user-adjustable growth parameters, it allows stakeholders to visualize the gap between current trajectories and ambitious revenue goals.

## 🛠️ Skills Showcased
Dynamic Scenario Modeling (What-If Parameters): Engineered a real-time adjustment engine using numeric parameters, allowing users to toggle growth rates and immediately see the impact on year-end projections.

Advanced Predictive Visualizations:

Baseline vs. Adjusted Analysis: Implemented a clustered column chart that overlays standard predictions against "What-If" scenarios to visualize revenue potential.

Intelligent Hierarchy Exploration: Leveraged the Decomposition Tree visual to allow users to drill from high-level Regional performance down to specific Category drivers.

AI-Driven Insights: Utilized Power BI's built-in forecasting models to project 2019 sales trends based on historical seasonality and cyclicality.

Premium UI/UX Design:

Contextual KPI Status: Created a "Gap Status" logic that provides instant binary feedback (Goal Achieved vs. At Risk) based on real-time slicer interactions.

## 📊 Dashboard Breakdown
![forecasting_page1](/Images/Predictions_1.png)

Sales Executive Forecast
The "Control Center" for sales planning. This page features high-level KPIs including Total Orders, Customers, and Revenue Goals.



The Trend Engine: A dual-line chart showing historical actuals transitioning into a 2019 forecast.

Scenario Planner: A clustered bar chart reacting to the Growth Rate Slicer, showing the "Gap" between current predictions and adjusted targets.

Regional Breakdown: A decomposition tree that identifies exactly which segments (e.g., Technology in the West Region) are contributing most to the forecasted totals.

State Rankings: A categorical bar chart ranking states by predicted volume to help with resource allocation.

## 💡 Key Business Insights
The Growth Gap: By utilizing the scenario slicer, stakeholders can identify that a mere 5% increase in growth rate closes the $570k gap to the 2.83M Revenue Goal, making the target feel attainable through specific interventions.

Regional Dominance: The Decomposition Tree reveals that the West Region is projected to lead 2019 sales, driven primarily by the Technology category, suggesting that marketing spend should be weighted toward these high-performing areas.

Predictive Seasonality: Analysis of the "What can sales look like" chart shows a significant projected spike in Quarter 4, allowing the supply chain team to plan for inventory increases well in advance.

## 🏁 Conclusion
The Sales Forecasting Dashboard shifts the conversation from "How did we do?" to "How will we finish?" By giving users a "remote control" for growth rates, it serves as a decision-support tool that identifies risks before they happen and quantifies the value of strategic sales pushes.

## 🛠️ Technical Documentation: DAX Measures
The following core measures drive the predictive logic of this dashboard:

The Adjusted Forecast (What-If Logic) Multiplies the baseline prediction by the user-selected growth rate to create the dynamic "Gold Bar" in the scenario chart.
```dax
Adjusted Forecast = 
VAR SelectedGrowth = [Growth Rate Value] // This is the value from your slicer
VAR Baseline = [Predicted 2019 State Sales]
RETURN
Baseline * (1 + SelectedGrowth)
```
What-if forecast used in the line chart to calculate projected sales for 2019 if there's no sales data to go off of. It's based on the user selected growth rate multiplied by the sale from last year.
```dax
What-If Forecast = 
VAR SalesLastYear = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Date'[Date]))
RETURN
IF(
    ISBLANK([Total Sales]), 
    SalesLastYear * (1 + [Growth Rate Value]), 
    [Total Sales]
)
```
The 2019 sales predictions that takes the sales from last year and multiplies by the the user-selected growth rate used in multiple visuals to predict sales for 2019. 
```dax
Predicted 2019 State Sales = 
VAR StateSalesLastYear = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Date'[Date]))
RETURN
StateSalesLastYear * (1 + [Growth Rate Value])
```
Goal Gap Status A logic-based measure that compares the dynamic forecast against the hard revenue target to drive the KPI card's messaging.
```dax
Gap Status = 
VAR Gap = [2019 Revenue Goal] - [Predicted 2019 State Sales]
RETURN
IF(Gap <= 0, "Goal Achieved!", FORMAT(Gap, "$#,##0"))
```
Dynamic Scenario Title Creates a responsive header for the clustered bar chart visual that updates based on the user's slicer selection to improve UX clarity.
```dax
Dynamic Scenario Title = 
VAR SlicerValue = SELECTEDVALUE('Growth Rate'[Growth Rate], 0)
VAR PercentageText = FORMAT(SlicerValue, "0%") 
RETURN
"Scenario Analysis: " & PercentageText & " Growth Impact on 2019 Forecast"
```

