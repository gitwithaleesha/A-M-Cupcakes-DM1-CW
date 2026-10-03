--Create different levels of users as per the requirement and grant different permissions. [DCL statements]
USE ANM_Cupcakes;
GO

--creating the logins
CREATE LOGIN OwnerUser WITH PASSWORD='OwnerPass@123';
CREATE LOGIN ManagerUser WITH PASSWORD='ManagerPass@123';
CREATE LOGIN CashierUser WITH PASSWORD='CashierPass@123';
CREATE LOGIN SalesAssistantUser WITH PASSWORD='SalesAssistPass@123';
GO

--creating the users
CREATE USER OwnerUser FOR LOGIN OwnerUser;
CREATE USER ManagerUser FOR LOGIN ManagerUser;
CREATE USER CashierUser FOR LOGIN CashierUser;
CREATE USER SalesAssistantUser FOR LOGIN SalesAssistantUser;
GO

--creating the roles
CREATE ROLE OwnerRole;
CREATE ROLE ManagerRole;
CREATE ROLE CashierRole;
CREATE ROLE SalesAssistantRole;
GO

--GRANTING PERMISSIONS
--owner permissions (access to everything)
GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON OrderItems TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cake TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Branch TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Category TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Employee TO OwnerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON EmployeePhoneNo TO OwnerRole;
GO

--manager permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON OrderItems TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Cake TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment TO ManagerRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Category TO ManagerRole;
GRANT SELECT ON Branch TO ManagerRole;
GRANT SELECT ON Employee TO ManagerRole;
GRANT SELECT ON EmployeePhoneNo TO ManagerRole;
GO

--cashier permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO CashierRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Orders TO CashierRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON OrderItems TO CashierRole;
GRANT SELECT, INSERT, UPDATE, DELETE ON Payment TO CashierRole;
GRANT SELECT ON Category TO CashierRole;
GRANT SELECT ON Cake TO CashierRole;
GO

--salesAssistant permissions
GRANT SELECT, INSERT, UPDATE, DELETE ON Customer TO SalesAssistantRole;
GRANT SELECT ON Cake TO SalesAssistantRole;
GRANT SELECT ON Category TO SalesAssistantRole;
GO

--assigning users to the roles
ALTER ROLE OwnerRole ADD Member OwnerUser;
ALTER ROLE ManagerRole ADD Member ManagerUser;
ALTER ROLE CashierRole ADD Member CashierUser;
ALTER ROLE SalesAssistantRole ADD Member SalesAssistantUser;
GO
