/*
 Write three SQL queries to join relevant tables and display different data. */
 USE ANM_Cupcakes;
 GO

/*1) Display each customer's full order details, including their name, order date, total amount, and 
payment status? (Joins Customer, Orders, Payment) */
SELECT Customer.CustomerID,
	Customer.CustomerName,
	Orders.OrderID,
	Orders.OrderDate,
	Payment.Amount,
	Payment.PaymentMethod,
	Payment.PaymentStatus
FROM Customer
INNER JOIN Orders ON Customer.CustomerID=Orders.CustomerID
INNER JOIN Payment ON Orders.OrderID=Payment.OrderID
ORDER BY Orders.OrderID ASC;

/*2) Which employee handled each customer order, along with their job role and the branch where the 
sale occurred? (Joins Orders, Employee, Branch)*/
SELECT Orders.OrderID,
	Employee.EmployeeName,
	Employee.JobRole,
	Branch.BranchName
FROM Employee
INNER JOIN Orders ON Employee.EmployeeID=Orders.EmployeeID
INNER JOIN Branch ON Orders.BranchID=Branch.BranchID
ORDER BY Orders.OrderID ASC;

/*3) Which branch processed each order, and what was the payment method and status for that 
transaction? (Joins Branch, Orders, Payment)*/
SELECT Branch.BranchName,
	Orders.OrderID,
	Payment.PaymentMethod,
	Payment.PaymentStatus
FROM Branch
INNER JOIN Orders ON Branch.BranchID=Orders.BranchID
INNER JOIN Payment ON Orders.OrderID=Payment.OrderID
ORDER BY Orders.OrderID ASC;