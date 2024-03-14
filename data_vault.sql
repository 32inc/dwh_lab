CREATE TABLE IF NOT EXISTS Hub_Products (
    ProductHashKey VARCHAR(255) PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    VendorCode INT
);

CREATE TABLE IF NOT EXISTS Hub_Categories (
    CategoryHashKey VARCHAR(255) PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    CategoryName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Hub_Customers (
    CustomerHashKey VARCHAR(255) PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    INN INT
   
);

CREATE TABLE IF NOT EXISTS Hub_Orders (
    OrderHashKey VARCHAR(255) PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    OrderNumber INT,
    OrderDate DATE,
    CustomerHashKey VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Hub_Manufacturers (
    ManufacturerHashKey VARCHAR(255) PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    INN INT
);

CREATE TABLE IF NOT EXISTS Hub_Seasons (
    SeasonHashKey VARCHAR(255) PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    SeasonBegin DATE,
    SeasonEnd DATE
);

-- Link-таблицы
CREATE TABLE IF NOT EXISTS Link_Order_Product (
    OrderProductLinkKey INT AUTO_INCREMENT PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    OrderHashKey VARCHAR(255),
    ProductHashKey VARCHAR(255),
    Quantity INT
    CONSTRAINT OrderHashKey FOREIGN KEY (OrderHashKey) REFERENCES Hub_Orders(OrderHashKey),
    CONSTRAINT ProductHashKey FOREIGN KEY (ProductHashKey) REFERENCES Hub_Products(ProductHashKey)
);

CREATE TABLE IF NOT EXISTS Link_Season_Category (
    SeasonCategoryLinkKey INT AUTO_INCREMENT PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    SeasonHashKey VARCHAR(255),
    CategoryHashKey VARCHAR(255)
    CONSTRAINT CategoryHashKey FOREIGN KEY (CategoryHashKey) REFERENCES Hub_Categories(CategoryHashKey),
    CONSTRAINT SeasonHashKey FOREIGN KEY (SeasonHashKey) REFERENCES Hub_Seasons(SeasonHashKey)
);


CREATE TABLE IF NOT EXISTS Satellite_Seasons (
    SeasonHashKey VARCHAR(255),
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    PRIMARY KEY (SeasonHashKey, LoadDate)
);

CREATE TABLE IF NOT EXISTS Satellite_Products (
    ProductHashKey VARCHAR(255),
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    ProductName VARCHAR(255),
    CategoryHashKey VARCHAR(255),
    PRIMARY KEY (ProductHashKey, LoadDate),
    CONSTRAINT CategoryHashKey FOREIGN KEY (CategoryHashKey) REFERENCES Hub_Categories(CategoryHashKeyy)
);
CREATE TABLE IF NOT EXISTS Satellite_Categories (
    CategoryHashKey VARCHAR(255) PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    CategoryName VARCHAR(255),
    CustomerName VARCHAR(255),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS Satellite_Manufacturers (
    ManufacturerHashKey VARCHAR(255) PRIMARY KEY,
    LoadDate DATETIME,
    RecordSource VARCHAR(255),
    ManufacturerName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);

    
