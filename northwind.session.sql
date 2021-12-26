-- @block exe23 show the customer name and the orders that he has done
-- @conn northwind
select c.company, o.id from customers as c inner join orders as o ON(c.id=o.customer_id);


-- @block exe 25 print every product with his supplier.
-- @conn northwind
select p.product_name, s.company from products as p inner join suppliers as s ON(s.id=p.supplier_id)
-- @block describe the customers table
-- @conn northwind
DESCRIBE customers;

-- @block describe the orders  table
-- @conn northwind
describe orders;
-- @block describe the products  table
-- @conn northwind
describe products;
-- @block describe the suppliers  table
-- @conn northwind
describe suppliers;