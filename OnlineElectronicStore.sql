-- Create a database
CREATE DATABASE OnlineElectronicStore;

-- Use the created database
USE OnlineElectronicStore;

-- Create a table for users
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- Create a table for products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

-- Create a table for orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create a table for order items (products in an order)
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create a table for payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into the Users table
INSERT INTO Users (Username, Password, Email) VALUES
    ('JohnDoe', 'password123', 'john.doe@example.com'),
    ('JaneSmith', 'securepwd456', 'jane.smith@example.com');

-- Insert data into the Products table
INSERT INTO Products (ProductName, Description, Price) VALUES
    ('Smartphone', 'High-end smartphone with advanced features', 599.99),
    ('Laptop', 'Powerful laptop for productivity and gaming', 1299.99);

-- Insert data into the Orders table
INSERT INTO Orders (UserID) VALUES
    (1),
    (2);

-- Insert data into the OrderItems table
-- Assuming OrderID = 1 corresponds to the order for User with UserID = 1
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
    (1, 1, 2, 1199.98),
    (1, 2, 1, 1299.99);

-- Assuming OrderID = 2 corresponds to the order for User with UserID = 2
INSERT INTO OrderItems (OrderID, ProductID, Quantity, Price) VALUES
    (2, 2, 1, 1299.99);

-- Insert data into the Payments table
-- Assuming OrderID = 1 and OrderID = 2 have been created
INSERT INTO Payments (OrderID, Amount, PaymentStatus) VALUES
    (1, 2499.97, 'Paid'),
    (2, 1299.99, 'Pending');
    
    select * from users;
      select * from products;
       select * from orders;
        select * from OrderItems;
         select * from Payments;
-- ......................................................................
create table register(name varchar(100), email varchar(100), password varchar(100),address varchar(100));
-- Inserting sample data into the 'register' table
INSERT INTO register (name, email, password, address)
VALUES 
    ('John Doe', 'john.doe@example.com', 'password123','New York'),
    ('Jane Smith', 'jane.smith@example.com', 'securepass','Los Angeles'),
    ('Chris Johnson', 'chris.johnson@example.com', 'pass123','Chicago');
select * from register;