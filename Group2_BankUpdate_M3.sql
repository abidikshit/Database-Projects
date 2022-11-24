/*
Northeastern University- Vancouver, Canada
Course: ITC 6000
Domain: Finance (Banking Sector)
Group: 2

Coordinators:
Abhilash Dikshit 
Nastaran Zamanian 
Shamim Sherafati 
Smit Parmar

Database Details:
Db Name: bank_ca
Attributes: bank, customer, employee, branch, account, loan
 */
--USE DATABASE bank_ca
USE bank_ca;
GO
--VIEW ALL TABLES IN THE DATABASE
SELECT *
FROM
  bank_ca.INFORMATION_SCHEMA.TABLES
WHERE
  TABLE_TYPE = 'BASE TABLE';
GO
--VIEW ALL ROWS AND COLUMNS IN THE TABLE
SELECT * FROM bank;
GO
SELECT * FROM customer;
GO
SELECT * FROM employee;
GO
SELECT * FROM branch;
GO
SELECT * FROM account;
GO
SELECT * FROM loan;
GO
--LIST ALL PRIMARY KEYS IN DB
SELECT OBJECT_NAME(parent_object_id), * FROM sys.key_constraints WHERE TYPE = 'PK'
GO
--LIST ALL FOREIGN KEYS IN DB
SELECT
   OBJECT_NAME(constraint_object_id) AS 'Foreign Key',
   OBJECT_NAME(parent_object_id) AS 'Table',
   OBJECT_NAME(referenced_object_id) AS 'Referenced Table'
FROM sys.foreign_key_columns
GO
-- VIEW DEFINATION OF TABLE BANK
sp_help bank
GO
--DELETE ROW WITH NULL VALUE
DELETE FROM loan WHERE[loan_id] IS NULL
GO
--DELETE SINGLE RECORD
DELETE FROM loan WHERE LOAN_ID=426436789;
GO
--INSERT SINGLE RECORD (ADDED WRONG DATA INTENTIONALLY)
INSERT INTO loan VALUES('Savings_Acc', 426436789, 50000,24,3.4);
GO
--UPDATE SINGLE RECORD
UPDATE loan SET LOAN_TYPE='Student_Gen' WHERE LOAN_ID=426436789;
GO
--UPDATE RECORD IN SPECIFIC COLUMN
UPDATE loan SET LOAN_DURATION=12 WHERE LOAN_ID=426436797;
GO
--ALTER TABLE BY ADDING A COLUMN
ALTER TABLE customer ADD address char(50)
GO 
--MAX AND MIN FUNCTION
SELECT MAX(e_age) FROM employee;
GO
SELECT MIN(e_age) FROM employee;
GO
SELECT MAX(c_dob) FROM customer;
GO
SELECT MIN(c_dob) FROM customer;
GO
SELECT MAX(loan_amount) FROM loan;
GO
SELECT MIN(loan_amount) FROM loan;
GO
--SUM FUNCTION
SELECT SUM(loan_amount) AS 'SUM' FROM loan;
GO
SELECT SUM(e_id) AS 'SUM' FROM employee;
GO
SELECT SUM(c_id) AS 'SUM' FROM customer;
GO
--COUNT FUNCTION WITH DISTINCT VALUES
SELECT COUNT(DISTINCT ba_type) FROM bank;
GO
SELECT COUNT(DISTINCT acc_type) FROM account;
GO
SELECT COUNT(DISTINCT e_id) FROM employee;
GO
--AVERAGE FUNCTION
SELECT AVG(acc_balance) AS 'AVERAGE' FROM account;
GO
SELECT AVG(loan_amount) AS 'AVERAGE' FROM loan;
GO
SELECT AVG(e_id) AS 'AVERAGE' FROM employee;
GO