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

--UC3 Ability to insert new Contacts to Address Book
INSERT INTO Address_Book(First_Name,Last_Name,Person_Address,City,State,Zip_Code,Phone_Number,Email)
VALUES('Apoorva','Rasal','ChandanNagar','Pune','Maharashtra',411001,9876543212,'Appu12@gmail.com'),
	  ('Swara','Shinde','Kalwa','Thane','Maharashtra',400601,8076543444,'Swara22@gmail.com'),
	  ('Yash','Rasal','Kharadi','Pune','Maharashtra',411201,8976543212,'Yash17@gmail.com'),
	  ('Manaswi','Nalawade','Bandra','Mumbai','Maharashtra',401721,9776543423,'Manu26@gmail.com'),
	  ('Aayush','Kadam','Panvel','NaviMumbai','Maharashtra',420601,8071243444,'AayushK212@gmail.com');
	  
SELECT * FROM Address_Book;

--UC4 Ability to edit existing contact person using their name
UPDATE Address_Book SET Person_Address='Vashi',City='NaviMumbai',State='Maharashtra' 
WHERE First_Name='Aayush' AND Last_Name='Kadam';

--UC5 Ability to delete a person using person's name
DELETE FROM Address_Book
WHERE First_Name='Aayush' AND Last_Name='Kadam';

--UC6 Ability to Retrieve Person belonging to a City or State from the Address Book
SELECT * 
FROM Address_Book
WHERE City='Thane';

SELECT * 
FROM Address_Book
WHERE State='Maharashtra';

--UC7 Ability to understand the size of address book by City and State
SELECT COUNT(City),City 
FROM Address_Book 
WHERE City='Pune' 
GROUP BY City;

SELECT COUNT(State),State 
FROM Address_Book 
WHERE State='Maharashtra' 
GROUP BY State;

--UC8 Ability to retrieve entries sorted alphabetically by Person’s name for a given city
SELECT *  
FROM Address_Book
WHERE City='Pune'
ORDER BY First_Name ASC;