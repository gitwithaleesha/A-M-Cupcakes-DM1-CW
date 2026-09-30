CREATE DATABASE ANM_Cupcakes;
GO

USE ANM_Cupcakes;
GO

--creating all the tables with their attributes
CREATE TABLE Customer(
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerName VARCHAR(100) NOT NULL,
	PhoneNumber VARCHAR(10),
	Email VARCHAR(50)
);

CREATE TABLE Employee(
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeName VARCHAR(100) NOT NULL,
	Salary DECIMAL (10,2),
	JobRole VARCHAR(35)
);

CREATE TABLE EmployeePhoneNo( --emp phone no is a multivalued attribute so we create a new table for normalized form
	EmployeeID INT NOT NULL,
	EmployeePhoneNum VARCHAR(10) NOT NULL,
	PRIMARY KEY (EmployeeID,EmployeePhoneNum),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE --deletes any records from all connected tables
);

CREATE TABLE Branch(
	BranchID INT IDENTITY(1,1) PRIMARY KEY,
	BranchName VARCHAR(100) NOT NULL,
	BranchLocation VARCHAR(100) NOT NULL
);

CREATE TABLE Orders(
	OrderID INT IDENTITY(1,1) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	CustomerID INT NOT NULL,
	EmployeeID INT NOT NULL,
	BranchID INT NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Payment(
	PaymentID INT IDENTITY(1,1) PRIMARY KEY,
	Amount DECIMAL(7,2) NOT NULL,
	PaymentMethod VARCHAR(20) NOT NULL, 
	PaymentStatus VARCHAR(20) NOT NULL,
	OrderID INT NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	CONSTRAINT check_paymentStatus CHECK(PaymentStatus IN ('Completed','Pending','Failed','Refunded'))
);

CREATE TABLE Category(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName VARCHAR(30) NOT NULL
);

CREATE TABLE Cake(
	CakeID INT IDENTITY(1,1) PRIMARY KEY,
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

