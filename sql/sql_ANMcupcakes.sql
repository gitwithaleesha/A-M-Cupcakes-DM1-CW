CREATE DATABASE ANM_Cupcakes;
GO

USE ANM_Cupcakes;
GO

--creating all the tables with their attributes
CREATE TABLE Customer(
	CustomerID INT PRIMARY KEY,
	CustomerName VARCHAR(100) NOT NULL,
	PhoneNumber VARCHAR(10),
	Email VARCHAR(50)
);

CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY,
	EmployeeName VARCHAR(100) NOT NULL,
	PhoneNumber VARCHAR(10),
	Salary DECIMAL (10,2),
	JobRole VARCHAR(35)
);

CREATE TABLE Branch(
	BranchID INT PRIMARY KEY,
	BranchName VARCHAR(100) NOT NULL,
	BranchLocation VARCHAR(100) NOT NULL
);

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	OrderDate DATE NOT NULL,
	CustomerID INT NOT NULL,
	EmployeeID INT NOT NULL,
	BranchID INT NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Payment(
	PaymentID INT PRIMARY KEY,
	Amount DECIMAL(7,2) NOT NULL,
	PaymentMethod VARCHAR(20) NOT NULL, 
	PaymentStatus VARCHAR(20) NOT NULL,
	OrderID INT NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT check_paymentStatus CHECK(PaymentStatus IN ('Completed','Pending','Failed','Refunded'))
);

CREATE TABLE Category(
	CategoryID INT PRIMARY KEY,
	CategoryName VARCHAR(30) NOT NULL
);

CREATE TABLE Cake(
	CakeID INT PRIMARY KEY,
	CakeName VARCHAR(40) NOT NULL,
	CakeSize DECIMAL(4,2), --size in kg
	Price DECIMAL(7,2) NOT NULL,
	CategoryID INT NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE OrderItems(
	OrderID INT NOT NULL,
	CakeID INT NOT NULL,
	Quantity INT NOT NULL,
	UnitPrice DECIMAL(7,2) NOT NULL,
	SubTotal DECIMAL(7,2) NOT NULL,
	PRIMARY KEY (OrderID,CakeID),
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (CakeID) REFERENCES Cake(CakeID)
);

