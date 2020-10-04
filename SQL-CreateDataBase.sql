GO
CREATE DATABASE SandwEJ

GO
USE SandwEJ

GO
USE master

GO 
DROP DATABASE SandwEJ


CREATE TABLE Sandwichs(
	SandwichID CHAR(5) CONSTRAINT SandID CHECK(SandwichID LIKE 'SW[0-9][0-9][0-9]') PRIMARY KEY NOT NULL,
	SandwichName VARCHAR(50) NOT NULL,
	SandwichSauce VARCHAR(50) NOT NULL,
	SandwichPrice INT CONSTRAINT SandPrice CHECK(SandwichPrice BETWEEN 5000 AND 500000) NOT NULL
)


CREATE TABLE Ingredients(
	IngredientID CHAR(5) CONSTRAINT IngreID CHECK(IngredientID LIKE 'IG[0-9][0-9][0-9]') PRIMARY KEY NOT NULL,
	IngredientName CHAR(50) NOT NULL,
	IngredientPrice INT NOT NULL
)


CREATE TABLE Chefs(
	ChefID CHAR(5) CHECK(ChefID LIKE 'CH[0-9][0-9][0-9]') PRIMARY KEY NOT NULL,
	ChefName VARCHAR(50) NOT NULL,
	ChefExperience VARCHAR(50) NOT NULL
)


CREATE TABLE Vendors(
	VendorID CHAR(5) CONSTRAINT VenID CHECK(VendorID LIKE 'VE[0-9][0-9][0-9]') PRIMARY KEY NOT NULL,
	VendorName VARCHAR(50) NOT NULL,
	VendorAddress VARCHAR(50) NOT NULL,
	VendorPhone VARCHAR(12) CONSTRAINT VenPhone CHECK(LEN(VendorPhone)=12) NOT NULL,
	VendorEmail VARCHAR(30) CONSTRAINT VenEmail CHECK(VendorEmail LIKE '%@%' 
	AND VendorEmail LIKE '%.com' AND CHARINDEX('@',VendorEmail) != 0 AND
	VendorEmail NOT LIKE '%@.com%') NOT NULL
)


CREATE TABLE Staffs(
	StaffID CHAR(5) CONSTRAINT StaID CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]') PRIMARY KEY NOT NULL,
	StaffName VARCHAR(50) NOT NULL,
	StaffGender VARCHAR(8) CONSTRAINT StaGender CHECK(StaffGender LIKE 'Male' OR StaffGender LIKE 'Female') NOT NULL,
	StaffSalary NUMERIC(10,2) NOT NULL,
	StaffPhone VARCHAR(12) CONSTRAINT StaPhone CHECK(LEN(StaffPhone)=12) NOT NULL
)


CREATE TABLE Customers(
	CustomerID CHAR(5) CONSTRAINT CustID CHECK(CustomerID LIKE 'CS[0-9][0-9][0-9]') PRIMARY KEY NOT NULL,
	CustomerName VARCHAR(50) NOT NULL,
	CustomerGender VARCHAR(8) CONSTRAINT CustGender CHECK(CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female') NOT NULL,
	CustomerDateOfBirth DATE NOT NULL,
	CustomerPhone VARCHAR(12) CONSTRAINT CustPhone CHECK(LEN(CustomerPhone)=12) NOT NULL
)


CREATE TABLE PurchaseTransactions(
	PurchaseID CHAR(5) CONSTRAINT PurchID CHECK(PurchaseID LIKE 'PH[0-9][0-9][0-9]') PRIMARY KEY NOT NULL,
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staffs(StaffID),
	VendorID CHAR(5) FOREIGN KEY REFERENCES Vendors(VendorID),
	PurchaseTransactionDate DATE NOT NULL CONSTRAINT CekPTD CHECK(PurchaseTransactionDate <= GETDATE()),
	IngredientPurchase VARCHAR(100) NOT NULL
)



CREATE TABLE SalesTransactions(
	SalesID CHAR(5) CONSTRAINT SalID CHECK(SalesID LIKE 'SH[0-9][0-9][0-9]') PRIMARY KEY NOT NULL,
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staffs(StaffID),
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customers(CustomerID),
	ChefID CHAR(5) FOREIGN KEY REFERENCES Chefs(ChefID),
	SalesTransactionDate DATE NOT NULL CONSTRAINT CekSTD CHECK(SalesTransactionDate <= GETDATE()),
	SandwichSold VARCHAR(100) NOT NULL
)


CREATE TABLE DetailPurchaseTransaction(
	PurchaseID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransactions(PurchaseID),
	IngredientID CHAR(5) FOREIGN KEY REFERENCES Ingredients(IngredientID),
	PRIMARY KEY(PurchaseID, IngredientID),
	QuantityIngredient INT NOT NULL
)


CREATE TABLE DetailSalesTransaction(
	SalesID CHAR(5) FOREIGN KEY REFERENCES SalesTransactions(SalesID),
	SandwichID CHAR(5) FOREIGN KEY REFERENCES Sandwichs(SandwichID),
	QuantitySandwich INT NOT NULL
)