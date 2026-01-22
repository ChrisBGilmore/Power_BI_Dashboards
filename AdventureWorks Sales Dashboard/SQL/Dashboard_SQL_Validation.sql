KPI's

Total sales 
Select sum([Sales Amount]) as TotalSales from sales


Total Orders
select Count(*) as TotalOrders from sales


Average Order Value
select sum([sales amount]) as totalSales, count(*) as totalorders, (sum([sales amount])/count(*)) as Averageordervalue from sales


Gross profit
select sum([Sales Amount]-[Total Product Cost]) as GrossProfit from sales



Main Visuals Page 1

Order Count by Category
select p.category, count(*) as OrderCount from [dbo].[Sales] s
join [dbo].[Product] p 
on s.ProductKey = p.ProductKey
join [dbo].[Table] t
on t.Category = p.Category
group by p.category


Gross profit % By Category
With SalesTotals as(
select p.category as category, sum([Sales Amount]-[Total Product Cost]) as GrossProfit, sum([Sales Amount]) as totalsales from [dbo].[Sales] s
join [dbo].[Product] p 
on p.ProductKey = s.ProductKey
group by p.Category
)
select category, ((grossprofit/TotalSales)*100) as ProfitMarginPercentage from salestotals


Total Orders/Sales By year
Select year(date) as OrderYear, count(*) as totalOrders, sum([Sales Amount]) as TotalSales  from [dbo].[Sales] s
join Date d
on s.OrderDateKey = d.DateKey
group by year(date)
order by year(date) asc


Sales vs gross profit by year 
Select year(date) as OrderYear, sum([Sales Amount]) as TotalSales, sum([Total Product Cost]) as TotalProductCost, sum([Sales Amount]-[Total Product Cost]) as GrossProfit from [dbo].[Sales] s
join Date d
on s.OrderDateKey = d.DateKey
group by year(date)
order by year(date) asc


Sales vs gross profit by category
select p.category, sum([Sales Amount]) as TotalSales, sum([Sales Amount]-[Total Product Cost]) as GrossProfit  from [dbo].[Sales] s
join [dbo].[Product] p
on s.ProductKey = p.ProductKey
group by p.category

