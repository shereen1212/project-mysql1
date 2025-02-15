
CREATE DATABASE FishStore;
USE FishStore;
CREATE TABLE Users (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Address TEXT,
    Phone_Number VARCHAR(20),
    Created_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Fish (
    Fish_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_ID INT,
    Fish_Name VARCHAR(50) NOT NULL,
    Fish_Type VARCHAR(50),
    Quantity INT NOT NULL,
    Rare_Fish BOOLEAN DEFAULT 0,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID) ON DELETE SET NULL
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Order_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total_Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID) ON DELETE CASCADE
);

CREATE TABLE Order_Details (
    Order_ID INT,
    Fish_ID INT,
    Order_Quantity INT NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Order_ID, Fish_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
    FOREIGN KEY (Fish_ID) REFERENCES Fish(Fish_ID) ON DELETE CASCADE
);


CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Payment_Method VARCHAR(50) NOT NULL,
    Payment_Status VARCHAR(50) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE
);


CREATE TABLE Offers (
    Offer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Fish_ID INT,
    Discount_Percentage DECIMAL(5,2) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    FOREIGN KEY (Fish_ID) REFERENCES Fish(Fish_ID) ON DELETE CASCADE
);