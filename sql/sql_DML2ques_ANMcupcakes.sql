/*query questions;
standard queries*/

USE ANM_Cupcakes;
GO

--1) Which bakery items generate the highest total sales revenue?
/*category name, total sales revenue (totalprice) and total units sold(qty)
for filtering price the payment status should be completed
*/
SELECT Cake.CakeID,
	Cake.CakeName,
	Category.CategoryName,
	SUM(OrderItems.SubTotal) AS TotalSalesRevenue,
	SUM(OrderItems.Quantity) AS TotalUnitsSold
FROM Cake
INNER JOIN OrderItems ON Cake.CakeID=OrderItems.CakeID
INNER JOIN Category ON Cake.CategoryID=Category.CategoryID
INNER JOIN Orders ON OrderItems.OrderID=Orders.OrderID
INNER JOIN Payment ON Orders.OrderID=Payment.PaymentID
WHERE PaymentStatus='Completed'
GROUP BY Cake.CakeID,Cake.CakeName,Category.CategoryName
ORDER BY TotalSalesRevenue DESC;

--2) What is the complete purchase history for each customer, including order dates and total spent?
/*output custname, orderid, orderdate, totalspent where paymentstatus=completed*/
SELECT Customer.CustomerName,
	Orders.OrderDate,
	Orders.OrderID,
	SUM(OrderItems.SubTotal) AS TotalSpent,
	Payment.PaymentStatus
From Orders
INNER JOIN Customer ON Orders.CustomerID=Customer.CustomerID
INNER JOIN OrderItems ON Orders.OrderID=OrderItems.OrderID
INNER JOIN Payment ON Orders.OrderID=Payment.OrderID
WHERE PaymentStatus='Completed'
GROUP BY Customer.CustomerName,Orders.OrderID,Orders.OrderDate,PaymentStatus
ORDER BY Orders.OrderDate DESC, Customer.CustomerName ASC;

--3) Which employees handled orders that currently have pending or failed payments?
/* output empname, orderid in orders where orders.empid=emp.empid
and payment where paymentstatus=pending/failed joining orderid with order table
*/
SELECT Employee.EmployeeName,
	Orders.OrderID,
	Payment.PaymentStatus
FROM Orders
INNER JOIN Employee ON Orders.EmployeeID=Employee.EmployeeID
INNER JOIN Payment ON Orders.OrderID=Payment.OrderID
WHERE PaymentStatus='Pending' OR PaymentStatus='Failed'
ORDER BY Employee.EmployeeName ASC;

--4) What are the contact details and job roles of all employees working across the business?
/*display empname, empphonenum,jobrole of all employees*/
SELECT Employee.EmployeeName,
	Employee.JobRole,
	STRING_AGG(EmployeePhoneNo.EmployeePhoneNum, ',') AS ContactNumbers --string_agg takes multiple text values across rows and joins into a single string with ','
FROM Employee
LEFT JOIN EmployeePhoneNo ON Employee.EmployeeID=EmployeePhoneNo.EmployeeID
GROUP BY Employee.EmployeeName, Employee.JobRole
ORDER BY Employee.EmployeeName ASC;

--5) Which payment method is the most popular among customers?
/*count payment method from payment table*/
SELECT PaymentMethod,
	COUNT(*) AS UsageCount
FROM Payment
GROUP BY PaymentMethod
ORDER BY UsageCount DESC;