select * from Subrecords

Alter table Subrecords
Alter column Duration
float


-------------total number of customers from each region.

Select region, count(region) as customerperregion from subrecords
Group by region


-------------number 2 -------------
------------- the most popular subscription type by the number of customers.

select subscriptiontype, count(customerid) as mostpopular from subrecords
group by subscriptiontype
order by mostpopular desc offset 0 row fetch next 1 rows only


-------------number 3 -------------
-----------customers who canceled their subscription within 6 months.

select customername, canceled from subrecords where canceled = 0


-------------number 4 -------------
-------------calculate the average subscription duration for all customers.

select AVG(duration) as AVGSUBDUR from subrecords


-------------number 5 -------------
------------- customers with subscriptions longer than 12 months.


select customername, duration from subrecords where duration > 365


-------------number 6 -------------
-------------calculate total revenue by subscription type.
select subscriptiontype, SUM(revenue) as revpersubscriptiontype from subrecords
group by subscriptiontype

-------------number 7 -------------
------------- the top 3 regions by subscription cancellations.

select region from subrecords  
where canceled = 0
Group by region
order by region asc offset 0 row fetch next 3 rows only

-------------number 8 -------------
---------find the total number of active and canceled subscriptions


select canceled as substatus, count(canceled) as total from subrecords where canceled = 1
group by canceled
union 
select canceled, count(canceled) from subrecords where canceled = 0
group by canceled



