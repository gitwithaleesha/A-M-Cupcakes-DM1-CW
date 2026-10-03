--advanced query questions

USE ANM_Cupcakes;
GO

--1) Which repeat customers have placed more than 1 order?
/*the count of the orderid for each customer should be >1*/
SELECT Customer.CustomerID,
	Customer.CustomerName,
	COUNT(Orders.OrderID) AS TotalOrdersPlaced
FROM Customer
INNER JOIN Orders ON Customer.CustomerID=Orders.CustomerID
GROUP BY Customer.CustomerID,Customer.CustomerName
HAVING COUNT(Orders.OrderID)>1
ORDER BY TotalOrdersPlaced DESC, Customer.CustomerName ASC;

--2) Which product categories have generated a total sales revenue exceeding LKR 3,000?
/*total of subtotal>3000 for each display category name with inner join oncategory,cake, orderitems table*/
SELECT Category.CategoryName,
	SUM(OrderItems.SubTotal) AS TotalRevenue
FROM Category
INNER JOIN Cake ON Category.CategoryID=Cake.CategoryID
INNER JOIN OrderItems ON Cake.CakeID=OrderItems.CakeID
GROUP BY Category.CategoryName
HAVING SUM(OrderItems.SubTotal)>3000
ORDER BY TotalRevenue DESC, CategoryName ASC;

--3) Which branches have processed 2 or more orders?
/*count of branchid>=2 in each order*/
SELECT Branch.BranchID,
	Branch.BranchName,
	COUNT(Orders.OrderID) AS TotalOrders
FROM Branch
INNER JOIN Orders ON Branch.BranchID=Orders.BranchID
GROUP BY Branch.BranchID,Branch.BranchName
HAVING COUNT(Orders.OrderID)>=2
ORDER BY TotalOrders DESC, BranchName ASC;

--4) Which job roles pay an average salary higher than LKR 60,000?
/*avg of salary for each job role>60k*/
SELECT Employee.JobRole,
	AVG(Employee.Salary) AS AverageSalary
FROM Employee
GROUP BY Employee.JobRole
HAVING AVG(Employee.Salary)>60000
ORDER BY AverageSalary DESC, Employee.JobRole ASC;

--5) Which bakery items have sold a total quantity of 2 or more units across all orders?
/*sum qty>=2 for every categoryid*/
SELECT Category.CategoryID,
	Category.CategoryName,
	SUM(OrderItems.Quantity) AS TotalQuantity
FROM Category
INNER JOIN Cake ON Category.CategoryID=Cake.CategoryID
INNER JOIN OrderItems ON Cake.CakeID=OrderItems.CakeID
GROUP BY Category.CategoryID, Category.CategoryName
HAVING SUM(OrderItems.Quantity)>=2
ORDER BY TotalQuantity DESC, Category.CategoryName ASC;