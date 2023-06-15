CREATE DATABASE db_hunter_facture_nicolasr;
DROP DATABASE db_hunter_facture_nicolasr;
USE db_hunter_facture_nicolasr;

CREATE TABLE bill(
n_bill INT(25) NOT NULL PRIMARY KEY COMMENT 'ID FACTURA',
bill_date DATETIME NOT NULL DEFAULT NOW() UNIQUE COMMENT 'FECHA FACTURA'
);
SHOW TABLES;

CREATE TABLE client(
    identification INT(10) NOT NULL PRIMARY KEY COMMENT 'IDENTIFICACION CC',
    full_name VARCHAR(50) NOT NULL COMMENT 'nombre completo', 
    email VARCHAR(30) COMMENT'correo persona', 
    address VARCHAR(10) COMMENT 'direccion',
    phone VARCHAR(10) COMMENT'numero telefono'
);

CREATE TABLE product(
    id_product INT(25) NOT NULL PRIMARY KEY COMMENT 'NUMERO PRODUCTO',
    name_product VARCHAR(20) NOT NULL COMMENT 'NOMBRE PRODUCTO', 
    amount INT(3)COMMENT'CANTIDAD', 
    value_product INT(6) NOT NULL COMMENT 'VALOR PRODUCTO'
);
DROP TABLE seller;
CREATE TABLE seller(
    id_seller INT(25) NOT NULL PRIMARY KEY COMMENT 'id vendedor',
    seller VARCHAR(30) NOT NULL COMMENT 'NOMBRE VENDEDOR'
);

ALTER TABLE bill ADD fk_identification INT(10) COMMENT'LLAVE FORANEA ID CLIENT A FACTURA';
ALTER TABLE bill ADD fk_id_product INT(25) COMMENT'LLAVE FORANEA ID PRODUCTO A FACTURA';
ALTER TABLE bill ADD fk_id_seller INT(10) COMMENT'LLAVE FORANEA ID VENDEDOR A FACTURA';

ALTER TABLE bill ADD CONSTRAINT bill_client_fk FOREIGN KEY(fk_identification) REFERENCES client(identification);
ALTER TABLE bill ADD CONSTRAINT bill_product_fk FOREIGN KEY(fk_id_product) REFERENCES product(id_product);
ALTER TABLE bill ADD CONSTRAINT bill_seller_fk FOREIGN KEY(fk_id_seller) REFERENCES seller(id_seller);
select * from bill;