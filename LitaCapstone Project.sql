create database Litasqlproject

Select * from salesrecord

Alter table salesrecord
Alter column Totalsales
float

Alter table salesrecord
add TotalSales int

update salesrecord
set totalsales = quantity * Unitprice


-------- NUMBER ONE-------------------
-------total sales for each product category=======

select product, SUM(TotalSales) as salesperproduct from salesrecord
group by product 


-------------NUMBER 2---------------
------------Number of sales transactions in each region=========

select region, SUM(quantity)as quantityperregion from salesrecord
group by region


-------------NUMBER 3---------------
---------Highest-selling product by total sales value.========

select product, SUM(TotalSales) as HighestSold from salesrecord
group by Product
order by HighestSold desc offset 0 row fetch next 1 rows only


-------------NUMBER 4---------------
========total revenue per product=======

select product, SUM(TotalSales) as revperproduct from salesrecord
group by product


-------------NUMBER 5---------------
=========monthly sales totals for the current year.===========

select month(orderdate) as month, sum(quantity*unitprice) as monthlysales
from salesrecord
where year (orderdate)=year(getdate())
group by month(orderdate);


-------------NUMBER 6---------------
=====Top 5 customers by total purchase amount.=======

select [Customer id], SUM(TotalSales) as totalspent
from salesrecord
group by [Customer id] 
order by totalspent desc offset 0 row fetch next 5 rows only

-------------NUMBER 7---------------
==========percentage of total sales contributed by each region.=======

select region, sum(totalsales) as TotalRevenue, (sum(totalsales) * 100.0/(select sum(totalsales) from Salesrecord)) as salesper
from Salesrecord
group by Region
order by TotalRevenue


-------------NUMBER 8---------------
========identify products with no sales in the last quarter.==========

select distinct product
from salesrecord
where product Not IN
(select distinct product from salesrecord
where orderdate between '2024-07-01' and '2024-09-30')








