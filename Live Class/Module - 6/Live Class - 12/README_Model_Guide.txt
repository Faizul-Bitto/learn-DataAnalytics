POWER QUERY + POWER PIVOT DASHBOARD PRACTICE DATASET
==========================================================

Files:
1. 01_Sales.txt       -> Fact table source, 250 rows, TAB-delimited TXT
2. 02_Customers.csv   -> Customer dimension, 20 rows
3. 03_Products.xlsx   -> Product dimension, 15 rows
4. 04_Stores.json     -> Store dimension, 10 rows

Recommended Power Query workflow
---------------------------------
Load each file using Power Query:
- Text/CSV connector -> Sales.txt and Customers.csv
- Excel workbook connector -> Products.xlsx
- JSON connector -> Stores.json

Recommended model
-----------------
FactSales
  |-- CustomerID -> DimCustomer[CustomerID]
  |-- ProductID  -> DimProduct[ProductID]
  |-- StoreID    -> DimStore[StoreID]

Create a Calendar table in Power Pivot/Power BI and relate:
  Calendar[Date] -> FactSales[OrderDate]

Suggested measures
------------------
Total Sales = SUM(FactSales[SalesAmount])
Total Cost = SUM(FactSales[CostAmount])
Gross Profit = [Total Sales] - [Total Cost]
Profit % = DIVIDE([Gross Profit], [Total Sales])
Total Quantity = SUM(FactSales[Quantity])
Orders = DISTINCTCOUNT(FactSales[OrderID])
Average Order Value = DIVIDE([Total Sales], [Orders])

Suggested dashboard
-------------------
KPI cards: Total Sales, Gross Profit, Profit %, Orders, Quantity
Charts:
- Monthly Sales Trend
- Sales by Product Category
- Sales by Region
- Sales by Customer Segment
- Top 10 Products by Sales
- Top 10 Customers by Sales

Suggested slicers:
Year, Month, Region, Channel, Customer Segment, Category

Important:
- All keys are consistent across files.
- FactSales has 250 rows.
- Each dimension has at least 10 rows.
- The dataset is synthetic and designed for Power Query/Power Pivot training.
