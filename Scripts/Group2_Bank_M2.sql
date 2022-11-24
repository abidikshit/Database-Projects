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
CREATE DATABASE bank_ca
GO
USE bank_ca;
GO
CREATE TABLE bank(
    ba_code INT NOT NULL,
    ba_name NVARCHAR(50) NOT NULL,
    ba_address NVARCHAR(100) NOT NULL,
    ba_type NVARCHAR(50) NOT NULL,
    CONSTRAINT pk_bank_ba_code PRIMARY KEY (ba_code)
    );
GO
CREATE TABLE customer
   (
    c_id INT NOT NULL,
    c_name NVARCHAR(40) NOT NULL,
    c_dob DATE NOT NULL,
    c_contact BIGINT NOT NULL,
    c_address NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_customer_cid PRIMARY KEY (c_id)
   );
GO
CREATE TABLE employee
   (
    e_id INT NOT NULL,
    e_name NVARCHAR(40) NOT NULL,
    e_dob DATE NOT NULL,
    e_dept NVARCHAR(30) NOT NULL,
    e_contact BIGINT NOT NULL,
    e_address NVARCHAR(100) NOT NULL,
    e_age INT NOT NULL
    CONSTRAINT pk_employee_eid PRIMARY KEY (e_id)
   );
GO
CREATE TABLE branch
   (
    b_id VARCHAR(6) NOT NULL,
    b_name NVARCHAR(100) NOT NULL,
    b_address NVARCHAR(100) NOT NULL,
    ba_code INT NOT NULL,
    CONSTRAINT pk_branch_b_id PRIMARY KEY (b_id),
    CONSTRAINT fk_branch_ba_code FOREIGN KEY(ba_code) REFERENCES bank(ba_code)
   );
GO
CREATE TABLE account
   (
    acc_no INT NOT NULL,
    acc_balance NUMERIC,
    acc_type VARCHAR(100) NOT NULL,
    c_id INT NOT NULL,
    e_id INT NOT NULL,
    b_id VARCHAR(6) NOT NULL,
    CONSTRAINT pk_account_acc_no PRIMARY KEY (acc_no),
    CONSTRAINT fk_account_c_id FOREIGN KEY(c_id) REFERENCES customer(c_id),
    CONSTRAINT fk_account_eid FOREIGN KEY(e_id) REFERENCES employee(e_id),
    CONSTRAINT fk_account_b_id FOREIGN KEY(b_id) REFERENCES branch(b_id)
    );
GO
CREATE TABLE loan
   ( 
    loan_type VARCHAR(20) NOT NULL,  
    loan_id INT NOT NULL, 
    loan_amount NUMERIC NOT NULL, 
    loan_duration INT NOT NULL, 
    loan_interest DECIMAL(5,2) NOT NULL,
    c_id INT,
    b_id VARCHAR(6),
    CONSTRAINT pk_loan_customer_c_id_branch_b_id PRIMARY KEY(c_id,b_id),
    CONSTRAINT fk_loan_c_id FOREIGN KEY(c_id) REFERENCES customer(c_id),
    CONSTRAINT fk_loan_b_id FOREIGN KEY(b_id) REFERENCES branch(b_id)
   );
GO
--Insert Values to bank table
INSERT INTO bank VALUES
    (001, 'Royal National Bank', '1350 Georgia Street','Public'),
    (002, 'CIBC', '555 Robson Street', 'Public'),
    (003, 'Canadian Western Bank', '436 Duismuir Street','Private'),
    (004, 'National Bank of Canada', '324 Homer Street','Private'),
    (005, 'Exchange Bank of Canada', '245 Georgia Street','Public'),
    (006, 'BMO Financial Group', '177 West Cordova Street','Private'),
    (007, 'B2B Bank', '777 Richards Street','Public'),
    (008, 'The Bank of Nova Scotia', '458 Granville Street','Private'),
    (009, 'Fairstone Bank of Canada', '131 Burrard Street','Private'),
    (010, 'RFA Bank of Canada', '439 Robson Street','Public');
GO
--Insert Values to customer table
INSERT INTO customer VALUES
    (2130, 'Smit Parmar', '2000-07-20', 21846570194, '177 Robson Street'),
    (7658, 'Abhilash Dikshit', '1993-05-10', 2365744375, 'W 23 Cordova Street'),
    (5348, 'Shamim Sherafati', '1997-10-28', 687213456, '768 Richards Street'),
    (7891, 'Nastaran Zamanian', '1992-01-16', 1879578123, 'West Vancouver'),
    (4200, 'Sarah Nadi', '1989-11-06', 8971256891, '781 Duismuir Street'),
    (2345, 'John Smith', '1999-03-01', 4658962931, 'West Vancouver'),
    (0983, 'Jack Brown', '2002-05-17', 9081451073, '52nd Avenue Surrey'),
    (6721, 'Jacquile Fernandez', '1989-01-12', 7420638906, '555 Seymour Street'),
    (4702, 'Dave Park', '1970-04-10', 9608512278, '256 Metrotown'),
    (6018, 'Justin Bieber', '1994-08-29', 6354387654, '2nd Avenue Surrey');
GO
--Insert Values to employee table
INSERT INTO employee VALUES
    (2131, 'Smit Parmar', '2000-07-20','Investment Planning', 21846570194, '177 Robson Street',21),
    (7659, 'Abhilash Dikshit', '1993-05-10','Marketing', 2365744375, 'W 23 Cordova Street',29),
    (5349, 'Shamim Sherafati', '1997-10-28', 'HR', 687213456, '768 Richards Street', 25),
    (7892, 'Nastaran Zamanian', '1992-01-16', 'Corporate Services', 1879578123, 'West Vancouver', 30),
    (4201, 'Sarah Nadi', '1989-11-06','Investment Planning', 8971256891, '781 Duismuir Street',48),
    (2346, 'John Smith', '1999-03-01', 'Marketing', 4658962931, 'West Vancouver', 39),
    (0984, 'Jack Brown', '2002-05-17', 'HR', 9081451073, '52nd Avenue Surrey',23),
    (6722, 'Jacquile Fernandez', '1989-01-12', 'Investment Planning', 7420638906, '555 Seymour Street', 33),
    (4703, 'Dave Park', '1970-04-10', 'Corporate Services', 9608512278, '256 Metrotown', 52),
    (6019, 'Justin Bieber', '1994-08-29', 'Marketing', 6354387654, '2nd Avenue Surrey',22);
GO
--Insert Values to branch table
INSERT INTO branch VALUES
    ('RN235', 'Royal National Bank Branch ATM ONLY', '1350 Georgia Street',001),
    ('C6778', 'CIBC Branch ATM', '787 Richards Street',002),
    ('CW275', 'Canadian Western Bank Branch', '436 Duismuir Street',003),
    ('NB870', 'National Bank of Canada Branch ATM ONLY ', '324 Homer Street',004),
    ('EB783', 'Exchange Bank of Canada Branch ATM ONLY', '245 Georgia Street',005),
    ('BM378', 'BMO Financial Group Branch', '177 West Cordova Street',006),
    ('B2739', 'B2B Bank Branch', '787 Richards Street',007),
    ('NSC34', 'The Bank of Nova Scotia Branch ATM', '458 Granville Street',008),
    ('F6793', 'Fairstone Bank of Canada', '131 Burrard Street',009),
    ('A4D67', 'RFA Bank of Canada Branch', '439 Robson Street',010);
GO
--Insert Values to account table
INSERT INTO account VALUES
    (22045811, 5000,'Chequing',2130,2131,'RN235'),
    (22045812, 50000,'Savings',7658,7659,'C6778'),
    (22045813, 10000,'Money Market',5348, 5349,'CW275'),
    (22045814, 2000,'Investment',7891, 7892,'NB870'),
    (22045815, 2000000,'Retirement',4200,4201,'EB783'),
    (22045816, 10000,'Certificates of Deposit',2345,2346,'BM378'),
    (22045817, 50000,'Tax Free savings',0983,0984,'B2739'),
    (22045818, 90000,'Disability',6721,6722,'NSC34'),
    (22045819, 80000,'Savings',4702,4703,'F6793'),
    (22045820, 82000,'Chequing',6018,6019,'A4D67');
GO
--Insert Values to loan table
INSERT INTO loan VALUES
    ('Personal', 426436789, 50000,12,3.4,2130,'RN235'), 
    ('Auto', 426436790, 55000,24,5.28,7658,'C6778'), 
    ('Student', 426436791, 40000,24,12.99,5348,'CW275'), 
    ('Mortgage', 426436792, 90000,56,3.01,7891,'NB870'),
    ('Home Equity', 426436793, 54000,36,9.35,4200,'EB783'), 
    ('Credit-Builder', 426436794, 100000,6,5.3,2345,'BM378'), 
    ('Debt Consolidation', 426436795, 140000,3,10.6,0983,'B2739'), 
    ('Payday', 426436796, 15000,1,8.4,6721,'NSC34'), 
    ('Student', 426436797, 20000,12,12.99,4702,'F6793'), 
    ('Mortgage', 426436798, 900000,68,3.01,6018,'A4D67');
GO
--Relationships in tabular Format
SELECT
    fk.name 'FK Name',
    tp.name 'Parent table',
    cp.name, cp.column_id,
    tr.name 'Refrenced table',
    cr.name, cr.column_id
FROM 
    sys.foreign_keys fk
INNER JOIN 
    sys.tables tp ON fk.parent_object_id = tp.object_id
INNER JOIN 
    sys.tables tr ON fk.referenced_object_id = tr.object_id
INNER JOIN 
    sys.foreign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
INNER JOIN 
    sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
INNER JOIN 
    sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
ORDER BY
    tp.name, cp.column_id;
GO
-- Inner Join
SELECT branch.b_id, branch.b_name, bank.ba_code
FROM branch
INNER JOIN bank 
ON branch.ba_code= bank.ba_code;
-- Left Join
SELECT ba_name, ba_address, ba_type
FROM bank
LEFT JOIN branch
ON bank.ba_name = branch.b_id;
-- Right Join
SELECT c_name, loan_type, loan_amount, loan_duration, loan_interest
FROM customer
RIGHT JOIN loan
ON customer.c_id = loan.c_id;