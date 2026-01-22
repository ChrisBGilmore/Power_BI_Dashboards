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
