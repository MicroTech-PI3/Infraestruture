CREATE DATABASE MICROTECH;

USE MICROTECH;

-- -----------------------------------------------------
-- Table `CATEGORY`
-- -----------------------------------------------------
CREATE TABLE CATEGORY (
  ID INT NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(45) NOT NULL,
  DESCRIPTION TEXT NOT NULL,
  PRIMARY KEY (ID)
);

-- -----------------------------------------------------
-- Table `SUPPLIER`
-- -----------------------------------------------------
CREATE TABLE SUPPLIER (
  ID INT NOT NULL,
  NAME VARCHAR(45) NOT NULL,
  LASTNAME VARCHAR(45) NOT NULL,
  PHONE BIGINT NOT NULL,
  EMAIL VARCHAR(100) NOT NULL,
  CITY VARCHAR(45) NOT NULL,
  BRAND VARCHAR(45) NOT NULL,
  PRIMARY KEY (ID)
);

-- -----------------------------------------------------
-- Table `PRODUCT`
-- -----------------------------------------------------
CREATE TABLE PRODUCT (
  ID INT NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(45) NOT NULL,
  PRICE INT NOT NULL,
  DESCRIPTION TEXT NOT NULL,
  QUANTITY INT NOT NULL,
  CATEGORY_ID INT NOT NULL,
  SUPPLIER_ID INT NOT NULL,
  PRIMARY KEY (ID),
  KEY fk_PRODUCT_CATEGORY_idx (CATEGORY_ID),
  KEY fk_PRODUCT_SUPPLIER1_idx (SUPPLIER_ID),
  CONSTRAINT fk_PRODUCT_CATEGORY FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY (ID),
  CONSTRAINT fk_PRODUCT_SUPPLIER1 FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIER (ID)
);

-- -----------------------------------------------------
-- Table `EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE EMPLOYEE (
  ID INT NOT NULL,
  NAME VARCHAR(45) NOT NULL,
  LASTNAME VARCHAR(45) NOT NULL,
  PHONE BIGINT NOT NULL,
  EMAIL VARCHAR(45) NOT NULL,
  ADDRESS VARCHAR(200) NOT NULL,
  PRIMARY KEY (ID)
);

-- -----------------------------------------------------
-- Table `CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE CUSTOMER (
  ID INT NOT NULL,
  NAME VARCHAR(45) NOT NULL,
  LASTNAME VARCHAR(45) NOT NULL,
  PHONE BIGINT NOT NULL,
  EMAIL VARCHAR(45) NOT NULL,
  BILL_VIA ENUM('W', 'E', 'WE') NOT NULL,
  PRIMARY KEY (ID)
);


-- -----------------------------------------------------
-- Table `SOLD_ITEMS`
-- -----------------------------------------------------
CREATE TABLE SOLD_ITEMS (
  ID INT NOT NULL AUTO_INCREMENT,
  DATE DATETIME NOT NULL,
  CUSTOMER_ID INT NOT NULL,
  EMPLOYEE_ID INT NOT NULL,
   PRIMARY KEY (ID),
  KEY fk_SHOPPING_CART_CUSTOMER1_idx (CUSTOMER_ID),
  KEY fk_SHOPPING_CART_EMPLOYEE1_idx (EMPLOYEE_ID),
  CONSTRAINT fk_SHOPPING_CART_CUSTOMER1 FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER (ID),
  CONSTRAINT fk_SHOPPING_CART_EMPLOYEE1 FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE (ID)
 
 
);

CREATE TABLE SOLD_ITEMS_has_PRODUCT (
  SOLD_ITEMS_ID INT NOT NULL,
  PRODUCT_ID INT NOT NULL,
  QUANTITY INT NOT NULL,
  PRIMARY KEY (SOLD_ITEMS_ID, PRODUCT_ID),
  INDEX fk_SOLD_ITEMS_has_PRODUCT_PRODUCT1_idx (PRODUCT_ID),
  INDEX fk_SOLD_ITEMS_has_PRODUCT_SOLD_ITEMS1_idx (SOLD_ITEMS_ID),
  CONSTRAINT fk_SOLD_ITEMS_has_PRODUCT_SOLD_ITEMS1
    FOREIGN KEY (SOLD_ITEMS_ID)
    REFERENCES SOLD_ITEMS (ID),
  CONSTRAINT fk_SOLD_ITEMS_has_PRODUCT_PRODUCT1
    FOREIGN KEY (PRODUCT_ID)
    REFERENCES PRODUCT (ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



CREATE TABLE ADMIN (
  ID INT NOT NULL,
  NAME VARCHAR(45) NOT NULL,
  LASTNAME VARCHAR(45) NOT NULL,
  PHONE BIGINT NOT NULL,
  EMAIL VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID));  

-- -----------------------------------------------------
-- Insert Data into CATEGORY
-- -----------------------------------------------------
INSERT INTO CATEGORY (ID, NAME, DESCRIPTION) VALUES
(1, 'Mecánica', 'Repuestos mecánicos esenciales para motocicletas'),
(2, 'Filtros', 'Filtros de aire, aceite y otros componentes relacionados'),
(3, 'Eléctrico', 'Componentes eléctricos y electrónicos para motocicletas');

-- -----------------------------------------------------
-- Insert Data into SUPPLIER
-- -----------------------------------------------------
INSERT INTO SUPPLIER (ID, NAME, LASTNAME, PHONE, EMAIL, CITY, BRAND) VALUES
(1, 'Motos Repuestos', 'S.A.', 31012345, 'contacto@motosrepuestos.com', 'Bogotá', 'Honda'),
(2, 'MotoPartes', 'Ltda.', 31123456, 'ventas@motopartes.com', 'Medellín', 'Yamaha'),
(3, 'Repuestos Express', 'S.A.S.', 3123456789, 'info@repexpress.com', 'Cali', 'Suzuki');

-- -----------------------------------------------------
-- Insert Data into PRODUCT
-- -----------------------------------------------------
INSERT INTO PRODUCT (ID, NAME, PRICE, DESCRIPTION, QUANTITY, CATEGORY_ID, SUPPLIER_ID) VALUES
(1, 'Chain Kit', 150000, 'Complete chain kit for 150cc motorcycles', 50, 1, 1),
(2, 'Brake Pads', 80000, 'High-performance brake pads for street bikes', 100, 1, 2),
(3, 'Clutch Plate', 120000, 'Durable clutch plate for smooth gear shifts', 30, 1, 3);
