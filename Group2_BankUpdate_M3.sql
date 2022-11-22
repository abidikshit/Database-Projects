/*
University: Northeastern University- Vancouver, Canada
Course: ITC 6000
Group: 2
Domain: Finance (Banking Sector)

REPRESENTATIVES:
Abhilash Dikshit 
Nastaran Zamanian 
Shamim Sherafati 
Smit Parmar
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
-- VIEW DEFINATION OF TABLE BANK
sp_help bank
GO
--INSERT MULTIPLE RECORDS (ADDED WRONG DATA INTENTIONALLY)
INSERT INTO bank VALUES
  (11, 'Sciotia Bank', 'West Georgia Street','Public'),
  (12, 'CIBC Bank', 'West Georgia Street','Private'),
  (13, 'TD Bank', 'West Georgia Street','Public');
GO
--UPDATE SINGLE RECORD
UPDATE bank SET ba_name='Scotia Bank' WHERE ba_code=11;
GO
--UPDATE RECORD IN SPECIFIC COLUMN
UPDATE loan SET loan_interest=15 WHERE loan_type='Mortgage';
UPDATE loan SET loan_interest=10 WHERE loan_type='Credit-Builder';
UPDATE loan SET loan_interest=8 WHERE loan_type='Home Equity';
GO
--UPDATE E_AGE IN TABLE EMPLOYEE
UPDATE employee SET e_age = DATEDIFF(MONTH,e_dob,GETDATE())/12;
GO
--DELETE ROW WITH NULL VALUE
DELETE FROM loan WHERE[loan_id] IS NULL
GO
--DELETE MULTIPLE RECORDS BETWEEN CERTAIN RANGE
DELETE FROM bank WHERE ba_code BETWEEN 11 AND 13;
GO
--ALTER TABLE BY ADDING A COLUMN
ALTER TABLE customer ADD c_age INT
GO
--UPDATE COLUMN C_AGE USING C_DOB
UPDATE customer SET c_age = DATEDIFF(MONTH,c_dob,GETDATE())/12;
GO
--ALTER TABLE BY DROPPING A COLUMN
ALTER TABLE customer DROP COLUMN c_age
GO
--ALTER TABLE BY CHANGING DATATYPE OF A COLUMN (Change N* datatypes as takes up 2 times the space of their "normal" pendants)
ALTER TABLE customer ALTER COLUMN c_name VARCHAR(30)
ALTER TABLE employee ALTER COLUMN e_name VARCHAR(30)
GO
--MAX AND MIN FUNCTION
SELECT MAX(e_age) FROM employee;
GO
SELECT MIN(e_age) FROM employee;
GO
SELECT MAX(acc_balance) FROM account;
GO
SELECT MIN(acc_balance) FROM account;
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