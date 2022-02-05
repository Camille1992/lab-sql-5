# 1. Drop column picture from staff.
SELECT * 
FROM 
	STAFF;

ALTER TABLE 
	STAFF
DROP COLUMN 
	PICTURE;

# 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * 
FROM 
	CUSTOMER 
WHERE 
	FIRST_NAME = "TAMMY";

SELECT * 
FROM 
	STAFF;

INSERT INTO 
	STAFF VALUES(3, "Tammy", "Sanders", 79, "TAMMY.SANDERS@sakilacustomer.org", 2, 1, "Tammy", "", "2006-02-16 00:00:00");

#INSERT INTO staff
#(staff_id, `active`, `password`, username, store_id, first_name, last_name, address_id, email, last_update)
#SELECT ('3', '1', "", "Tammy", store_id, first_name, last_name, address_id, email, last_update)
#FROM CUSTOMER;

# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 1002
# You can use current date for the rental_date column in the rental table. 
# Hint: Check the columns in the table rental and see what information you would need to add there. 
#You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
# inventory_id: 1, customer_id: 130, return date: , staff_id: 1, last_update: 
# select customer_id from sakila.customer
# where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# Use similar method to get inventory_id, film_id, and staff_id.
# FILM_ID: 1
SELECT * 
FROM 
	RENTAL;
    
SELECT 
	MAX(RENTAL_ID) 
FROM 
	RENTAL;
    
SELECT * 
FROM 
	INVENTORY 
WHERE 
	FILM_ID =1;
    
SELECT * 
FROM 
	FILM 
WHERE 
	TITLE = "Academy Dinosaur";
    
SELECT * 
FROM 
	CUSTOMER 
WHERE 
	LAST_NAME = "Hunter";
    
SELECT * 
FROM 
	STAFF;
    
INSERT INTO 
	RENTAL VALUES(16050, "2022-01-05 22:30:00", 1, 130, "2022-02-04 22:00;00", 1, "2022-02-05 12:00;00");
    
SELECT * 
FROM 
	RENTAL 
ORDER BY 
	RENTAL_ID DESC LIMIT 5;

# 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
	# Check if there are any non-active users
	# Create a table backup table as suggested
	# Insert the non active users in the table backup table
	# Delete the non active users from the table customer
SELECT DISTINCT 
	ACTIVE 
FROM
	CUSTOMER;
    
SELECT * 
FROM 
	CUSTOMER 
LIMIT 
	5;

SELECT 
	COUNT(ACTIVE) 
FROM 
	CUSTOMER 
WHERE 
	ACTIVE =0;

CREATE TABLE Deleted_Users (
	customer_id INT(11) DEFAULT NULL,
    email TEXT,
    create_date DATETIME
);

SELECT * 
FROM 
	DELETED_USERS;
    
SELECT 
	COUNT(CUSTOMER_ID) 
FROM 
	DELETED_USERS;

INSERT INTO 
	DELETED_USERS (customer_id, email, create_date)
SELECT 
	customer_id, email, create_date
FROM 
	customer
WHERE 
	ACTIVE =0;
	
# DELETE FROM 
	# CUSTOMER 
# WHERE 
	# ACTIVE=0; 
# => NOT SUPPOSE TO RUN IT?

