--UC1 Ability to create a Address Book Service DB
CREATE DATABASE Address_Book_Service;
USE Address_Book_Service;

--UC2 Ability to create a Address Book Table with first and last names, address, city, state, zip, phone number and email as its attributes
CREATE TABLE Address_Book(
First_Name varchar(20) not null,
Last_Name varchar(20) not null,
Person_Address varchar(50) not null,
City varchar(15) not null,
State varchar(20) not null,
Zip_Code numeric(6) not null, 
Phone_Number numeric(10) unique not null,
Email VARCHAR(50), CHECK(Email LIKE '%_@__%.__%' AND PATINDEX('%[^a-z,^A-Z,0-9,@,.,_,\-]%', Email)=0)
);