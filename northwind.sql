
-- ## joins

-- @block exe23
-- @conn northwind
select o.OrderID, sum(od.UnitPrice) as price
from Orders  o
 INNER  join OrderDetails  od ON o.OrderID=od.OrderID
group by o.OrderID;

-- @block exe24
-- @conn northwind
select o.OrderID, c.CompanyName, sum(od.UnitPrice) as price
from( Orders  o
 INNER  join OrderDetails  od ON o.OrderID=od.OrderID)
 INNER join Customers c On o.CustomerID = c.CustomerID
group by o.OrderID, c.CompanyName;

-- @block exe49
-- @conn northwind

SELECT Customers.City, Count(Customers.City) AS CountOfCity
FROM Customers
GROUP BY Customers.City
Order by Count(Customers.City) desc;





-- @block exe50
-- @conn northwind
SELECT c.CategoryID, c.CategoryName, Count(p.CategoryID) AS CountOfCategoryID
FROM Categories AS c LEFT JOIN Products AS p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;



-- @block exe51
-- @conn northwind
select s.CompanyName, COUNT(p.SupplierID) as supplier_count
from Suppliers  s
LEFT join Products  p ON s.SupplierID=p.SupplierID
group by s.CompanyName;


-- @block exe57
-- @conn northwind
select o.OrderID, sum(od.UnitPrice) as price
from Orders  o
 INNER  join OrderDetails  od ON o.OrderID=od.OrderID
group by o.OrderID
having sum(od.UnitPrice)>100;


-- @block exe58
-- @conn northwind
select o.CustomerID, sum(od.UnitPrice) as price
from Orders  o
 INNER  join OrderDetails  od ON o.OrderID=od.OrderID
group by o.CustomerID
having sum(od.UnitPrice)<1000;

-- @block exe59
-- @conn northwind
SELECT Customers.City, Count(Customers.City) AS CountOfCity
FROM Customers
GROUP BY Customers.City
having Count(Customers.City)>3
Order by Count(Customers.City) desc;



-- @block exe60
-- @conn northwind

SELECT c.CategoryID, c.CategoryName, Count(p.CategoryID) AS CountOfCategoryID
FROM Categories AS c LEFT JOIN Products AS p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
HAVING Count(p.CategoryID)>5;

-- @block pdf
-- @conn northwind
--exersize from sum pdf-- creat a report that shows company name,order id,and total price of all products of witch northwind has sold mre then 10,000 worth. there is no need for GROUP BY clause in this report

SELECT Customers.CompanyName,OrderDetails.OrderID,COUNT(OrderDetails.UnitPrice) as TotalPrice
from Customers as c left join OrderDetails as od ON c.OrderID=od.OrderID;