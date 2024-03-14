CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255),
    VendorCode INT,
    CategoryID INT,
    ManufatorID INT
    CONSTRAINT CategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    CONSTRAINT ManufatorID FOREIGN KEY (ManufatorID) REFERENCES Manufators(ManufatorID)
);

CREATE TABLE IF NOT EXISTS Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderNumber INT,
    OrderDate DATE,
    CONSTRAINT CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE IF NOT EXISTS OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT OrderID FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT ProductID FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE IF NOT EXISTS Seasons (
	SeasonID INT AUTO_INCREMENT PRIMARY KEY,
	SeasonBegin DATE
	SeasonEnd DATE
);

CREATE TABLE IF NOT EXISTS Season (
	SeasonID INT AUTO_INCREMENT PRIMARY KEY,
	SeasonBegin DATE
	SeasonEnd DATE
);
CREATE TABLE IF NOT EXISTS SeasonCategory (
	SeasonCategoryID INT AUTO_INCREMENT PRIMARY KEY,
	SeasonID INT
	CategoryID INT
    CONSTRAINT SeasonID FOREIGN KEY (SeasonID) REFERENCES Seasons(SeasonID),
    CONSTRAINT CategoryID FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE IF NOT EXISTS Manufators (
	ManufatorID INT AUTO_INCREMENT PRIMARY KEY,
	ManufatorName VARCHAR(255),
	Email VARCHAR(255),
	PhoneNumber VARCHAR(255),
	Address VARCHAR(255),
);

