CREATE DATABASE ecomdb ;
CREATE USER 'ecomdb'@'localhost' IDENTIFIED BY 'ecompassword' ;
GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
FLUSH PRIVILEGES;
