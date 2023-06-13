CREATE DATABASE facturacionn;
USE facturacionn;

CREATE TABLE user(
    n_bill INT PRIMARY KEY AUTO_INCREMENT,
    date_bill VARCHAR(5), 
    seller VARCHAR (30) NOT NULL, 
    id_client VARCHAR(10) NOT NULL, 
    name_client VARCHAR(30) NOT NULL, 
    email_client VARCHAR (20), 
    address VARCHAR (10), 
    phone_number VARCHAR(10)
);