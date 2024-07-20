create database Banking;
use Banking;
CREATE TABLE Bank (
    bank_code INT PRIMARY KEY,
    bank_name VARCHAR(100),
    branch_name VARCHAR(100),
    address VARCHAR(255)
);
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    branch_code INT,
    bank_code INT,
    branch_name VARCHAR(100),
    address VARCHAR(255),
    state VARCHAR(50),
    city VARCHAR(50),
    street VARCHAR(100),
    assets DECIMAL(15, 2),
    FOREIGN KEY (bank_code) REFERENCES Bank(bank_code)
);
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    surname VARCHAR(50),
    address VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE Account (
    account_number INT PRIMARY KEY,
    account_type VARCHAR(20),
    balance DECIMAL(15, 2),
    customer_id INT,
    date_of_opened DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Card (
    card_number INT PRIMARY KEY,
    card_type VARCHAR(20),
    cvv INT,
    expiry_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    loan_type VARCHAR(50),
    amount DECIMAL(15, 2),
    interest_rate DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
   ALTER TABLE Account ADD INDEX idx_account_number (account_number);
   ALTER TABLE Branch ADD INDEX idx_branch_code (branch_code);
   CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    transaction_type VARCHAR(50),
    amount DECIMAL(15, 2),
    account_number INT,
    branch_code INT,
    FOREIGN KEY (account_number) REFERENCES Account(account_number),
    FOREIGN KEY (branch_code) REFERENCES Branch(branch_code)
);
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10, 2),
    branch_code INT,
    FOREIGN KEY (branch_code) REFERENCES Branch(branch_code)
);