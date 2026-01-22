KPI's

Total Sales, Gross Profit, Profit Margin % for Each Individual Product Category
With SalesTotals as(
select p.category as category, sum([Sales Amount]-[Total Product Cost]) as GrossProfit, sum([Sales Amount]) as totalsales from [dbo].[Sales] s
join [dbo].[Product] p 
on p.ProductKey = s.ProductKey
group by p.Category
)
select category, totalsales, grossprofit, ((grossprofit/TotalSales)*100) as ProfitMarginPercentage from salestotals


Product Count
select count(*) as ProductCount from product
where category = 'accessories' -- fill in with drill-through category


Visuals Page 2 (Drill-Through)

Top 10 Products by totalsales in each category
With salesCTE as(
select p.category as category, p.product as productname, sum([Sales Amount]) as TotalSales, sum([Sales Amount]-[Total Product Cost]) as GrossProfit,
ROW_NUMBER() OVER(                       
            PARTITION BY p.category           -- creates product category for partition so ranking starts over 
            ORDER BY SUM([Sales Amount]) DESC -- ranking totalsales by sales desc
        ) AS SalesRank from [dbo].[Sales] s
join [dbo].[Product] p
on s.ProductKey = p.ProductKey
group by p.Category, p.product
)
select  category, productname, totalsales,GrossProfit, salesrank from salescte
WHERE SalesRank <= 10  -- Filters for the top 10 in each category
ORDER BY category, SalesRank;


For subcategories under specified drill through find total sales, gross profit, gross profit %
With salesCTE as(
select p.category as Category, p.subcategory as Subcategory, sum([Sales Amount]) as TotalSales, sum([Sales Amount]-[Total Product Cost]) as GrossProfit from [dbo].[Sales] s
join [dbo].[Product] p
on s.ProductKey = p.ProductKey
where p.category = 'bikes' -- Fill in with drill-through category
group by p.category, p.subcategory
)
select Category, Subcategory, Totalsales, ((grossprofit/totalsales)*100) as ProfitMarginPercentage from Salescte


Total sales and gross profit by product in Category
-- can select top 10 if just want the top 10 in the category by sales descending
select p.category as Category, p.product as Productname, sum([Sales Amount]) as TotalSales, sum([Sales Amount]-[Total Product Cost]) as GrossProfit from [dbo].[Sales] s
join [dbo].[Product] p
on s.ProductKey = p.ProductKey
where p.category = 'bikes' -- Fill in with drill-through category
group by p.category, p.product
order by totalsales desc


Total sales and gross profit by year for one category
Select year(date) as OrderYear, sum([Sales Amount]) as TotalSales,  sum([Sales Amount]-[Total Product Cost]) as GrossProfit from [dbo].[Sales] s
join Date d
on s.OrderDateKey = d.DateKey
join product p
on p.ProductKey = s.ProductKey
where p.category = 'Bikes' -- fill in with drill-through category
group by year(date)
order by year(date) asc
