CREATE DATABASE GravityBooks_DWH;
GO
------------------------------------------
-- 1. Dim_Shipping_Method
CREATE TABLE Dim_Shipping_Method (
    Shipping_Method_Key INT IDENTITY(1,1) PRIMARY KEY,
    Shipping_Method_ID_src INT,
    Method_Name NVARCHAR(100)
);

-- 2. Dim_Order_History_Status
CREATE TABLE Dim_Order_History_Status (
    Status_Key INT IDENTITY(1,1) PRIMARY KEY,
    Status_ID_src INT,
    Status_Value NVARCHAR(50)
);

-- 3. Dim_Address
CREATE TABLE Dim_Address (
    Address_Key INT IDENTITY(1,1) PRIMARY KEY,
    Address_ID_src INT,
    Street_Number NVARCHAR(50),
    Street_Name NVARCHAR(200),
    City NVARCHAR(100),
    Country NVARCHAR(100)
);

-- 4. Dim_Customer
CREATE TABLE Dim_Customer (
    Customer_Key INT IDENTITY(1,1) PRIMARY KEY,
    Customer_ID_src INT,
    First_Name NVARCHAR(200),
    Last_Name NVARCHAR(200),
    Email NVARCHAR(200)
);


-----------------------------------------------
-- 5. Dim_Customer_Address 
CREATE TABLE Dim_Customer_Address (
    Customer_Address_Key INT IDENTITY(1,1) PRIMARY KEY,
    Customer_Key INT REFERENCES Dim_Customer(Customer_Key),
    Address_Key INT REFERENCES Dim_Address(Address_Key)
);

-- 6. Dim_Author 
CREATE TABLE Dim_Author (
    Author_Key INT IDENTITY(1,1) PRIMARY KEY,
    Author_ID_src INT,
    Author_Name NVARCHAR(400)
);

-- 7. Dim_Book 
CREATE TABLE Dim_Book (
    Book_Key INT IDENTITY(1,1) PRIMARY KEY,
    Book_ID_src INT,
    Title NVARCHAR(400),
    Isbn13 NVARCHAR(13),
    Language_Name NVARCHAR(50),
    Publisher_Name NVARCHAR(400)
);

-- 8. Dim_Book_Author
CREATE TABLE Dim_Book_Author (
    Book_Author_Key INT IDENTITY(1,1) PRIMARY KEY,
    Book_Key INT REFERENCES Dim_Book(Book_Key),
    Author_Key INT REFERENCES Dim_Author(Author_Key)
);

-- 9. Dim_Order_Line 
CREATE TABLE Dim_Order_Line (
    Order_Line_Key INT IDENTITY(1,1) PRIMARY KEY,
    Order_Line_ID_src INT,
    Order_ID INT
);

-- 10. Dim_Order_History 
CREATE TABLE Dim_Order_History (
    Order_History_Key INT IDENTITY(1,1) PRIMARY KEY,
    Order_History_ID_src INT,
    Order_ID INT,
    Status_Key INT REFERENCES Dim_Order_History_Status(Status_Key),
    Status_Date DATETIME
);

-- 11.
CREATE TABLE Fact_Sales (
    Sales_Key INT IDENTITY(1,1) PRIMARY KEY,
    Book_Key INT REFERENCES Dim_Book(Book_Key),
    Customer_Key INT REFERENCES Dim_Customer(Customer_Key),
    Order_Line_Key INT REFERENCES Dim_Order_Line(Order_Line_Key),
    Shipping_Key INT REFERENCES Dim_Shipping_Method(Shipping_Method_Key),
    Order_History_Key INT REFERENCES Dim_Order_History(Order_History_Key),
    Price DECIMAL(10,2),
    Quantity INT
);

-------------------------------------------------------------

