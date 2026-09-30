USE ANM_Cupcakes2;
GO

/*inserting records into the tables
pks are automatically added and incremented from 'IDENTITY(1,1)' so we dont hv to insert into table separately*/
INSERT INTO Customer (CustomerName, PhoneNumber, Email) VALUES
('Saman Fernando', '0771234567', 'saman.f@gmail.com'),
('Dilini Gunawardena', '0729876543', 'dilini43.g@yahoo.com'),
('Kavindu Perera', '0713456789', 'kavindu.p@outlook.com'),
('Emily Watson', '0758765432', 'emily.watson67@gmail.com'),
('Tharindu Jayasinghe', '0782345678', 'tharindu.j@gmail.com'),
('Nimmi De Silva', '0769876543', 'nimmi.desilva0@hotmail.com'),
('Thavinsa Perera', '0741403228', 'thavi.perera@gmail.com'),
('Mubashira Akram', '0771607465', 'mubaAk@yahoo.com'),
('Durangi Gomes', '0742982600', 'durangi.g@hotmail.com'),
('Aleesha Ismail', '0743365119', 'aleesha7@gmail.com');
GO

INSERT INTO Employee (EmployeeName, Salary, JobRole) VALUES
('Kamal Perera', 85000.00, 'Head Baker'),
('Nimali Silva', 55000.00, 'Cashier'),
('Kasun Jayawardena', 65000.00, 'Assistant Baker'),
('Fatima Rizvi', 58000.00, 'Cashier'),
('Ruwan Fernando', 70000.00, 'Pastry Chef'),
('Sanduni Cooray', 50000.00, 'Sales Assistant'),
('Mahesh Pathirana', 60000.00, 'Inventory Specialist'),
('Tania De Cruz', 55000.00, 'Cashier'),
('Dinesh Wickramaratne', 72000.00, 'Cake Decorator'),
('Apsara Gunasekara', 52000.00, 'Sales Assistant');
GO

INSERT INTO EmployeePhoneNo (EmployeeID, EmployeePhoneNum) VALUES
(1, '0771112223'),
(1, '0719998887'),
(2, '0714445556'),
(3, '0753334445'),
(4, '0786667778'),
(5, '0709990001'),
(6, '0761239876'),
(7, '0724561234'),
(8, '0778901234'),
(9, '0712348765'),
(10, '0756784321');
GO

INSERT INTO Branch (BranchName, BranchLocation) VALUES
('Colpetty Branch', 'Colombo 03'),
('Havelock Town Branch', 'Colombo 05'),
('Pelawatte Outlet', 'Battaramulla'),
('Colombo City Centre', 'Colombo 02'),
('One Galle Face Mall', 'Colombo 02'),
('Kandy KCC Branch', 'Kandy'),
('Galle Fort Outlet', 'Galle'),
('Negombo Beach Road', 'Negombo'),
('Nugegoda Corner', 'Nugegoda'),
('Rajagiriya Hub', 'Rajagiriya');
GO

INSERT INTO Orders (OrderDate, CustomerID, EmployeeID, BranchID) VALUES
('2026-09-15', 1, 2, 1),
('2026-09-15', 2, 4, 2),
('2026-09-15', 3, 2, 3),
('2026-09-18', 4, 8, 4),
('2026-09-18', 5, 6, 5),
('2026-09-20', 6, 4, 6),
('2026-09-20', 7, 8, 7),
('2026-09-20', 8, 2, 8),
('2026-09-25', 9, 10, 9),
('2026-09-25', 10, 8, 10);
GO

INSERT INTO Category (CategoryName) VALUES
('Cupcakes'),
('Cakes'),
('Cheesecakes'),
('Desserts'),
('Celebration Cake'),
('Cookies'),
('Brownies'),
('Biscuits'),
('Beverages'),
('Gift Boxes');
GO

INSERT INTO Cake (CakeName, CakeSize, Price, CategoryID) VALUES
('Vanilla Cupcake', NULL, 400.00, 1),
('Chocolate Fudge Cake', 1.00, 4500.00, 2),
('Classic Red Velvet Cupcake', NULL, 500.00, 1),
('Butter Cake', 0.50, 1800.00, 2),
('Oreo Crunch Cupcake', NULL, 550.00, 1),
('Brownie Cake', 1.00, 3800.00, 7),
('Chocolate Biscuit Pudding', 0.50, 650.00, 4),
('Caramel Delight Cupcake', NULL, 500.00, 1),
('Double Chocolate Layered Cake', 1.50, 5200.00, 2),
('Assorted Gift Box (6pcs)', NULL, 3200.00, 10);
GO

INSERT INTO OrderItems (OrderID, CakeID, Quantity, UnitPrice, SubTotal) VALUES
(1, 1, 3, 400.00, 1200.00),
(2, 2, 1, 4500.00, 4500.00),
(3, 3, 2, 500.00, 1000.00),
(4, 10, 1, 3200.00, 3200.00),
(5, 9, 1, 5200.00, 5200.00),
(6, 7, 2, 650.00, 1300.00),
(7, 6, 1, 3800.00, 3800.00),
(8, 5, 2, 550.00, 1100.00),
(9, 4, 1, 1800.00, 1800.00),
(10, 8, 3, 500.00, 1500.00);
GO

INSERT INTO Payment (Amount, PaymentMethod, PaymentStatus, OrderID) VALUES
(1200.00, 'Card', 'Completed', 1),
(4500.00, 'Cash', 'Completed', 2),
(1000.00, 'Card', 'Pending', 3),
(3200.00, 'Online Transfer', 'Completed', 4),
(5200.00, 'Card', 'Completed', 5),
(1300.00, 'Cash', 'Failed', 6),
(3800.00, 'Card', 'Completed', 7),
(1100.00, 'Cash', 'Refunded', 8),
(1800.00, 'Card', 'Completed', 9),
(1500.00, 'Online Transfer', 'Pending', 10);
GO