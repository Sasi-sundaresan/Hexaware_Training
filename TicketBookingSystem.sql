--Tasks 1: Database Design: 
--1. Create the database named "TicketBookingSystem"
CREATE DATABASE TicketBookingSystems
USE TicketBookingSystems


--2. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships. Venu,Event,Customers,Booking
--4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.

CREATE TABLE Venu (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(20),
    [address] VARCHAR(100)
)


CREATE TABLE Event (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(20),
    event_date DATE,
    event_time TIME,
    venue_id INT FOREIGN KEY REFERENCES Venu(venue_id),
    total_seats INT,
    available_seats INT,
    ticket_price DECIMAL(10, 2),
    event_type VARCHAR(50) CHECK (event_type IN ('Movie', 'Sports', 'Concert')),
    booking_id INT
)


CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name NVARCHAR(20),
    email VARCHAR(100),
    phone_number BIGINT,
    booking_id INT
)


CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customer(customer_id),
    event_id INT FOREIGN KEY REFERENCES Event(event_id),
    num_tickets INT,
    total_cost DECIMAL,
    booking_date DATE
)



-- Adding Foreign Key Constraints for booking_id in Event and Customer tables
ALTER TABLE Event
ADD CONSTRAINT FK_Event_Booking
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)

ALTER TABLE Customer
ADD CONSTRAINT FK_Customer_Booking 
FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)






--Tasks 2: Select, Where, Between, AND, LIKE:
--1. Write a SQL query to insert at least 10 sample records into each table.



INSERT INTO Venu VALUES (1, 'Book Fair', 'Chennai'),
						(2, 'Lunch Special', 'Chennai'),
						(3, 'National Science Cup', 'Bangalore'),
						(4, 'Theater Play', 'Bangalore'),
						(5, 'Yoga Session', 'Bangalore'),
						(6, 'Music Festival', 'Hyderabad'),
						(7, 'Cooking Workshop', 'Pune'),
						(8, 'Art Exhibition', 'Mumbai'),
						(9, 'Basketball Match', 'Kolkata'),
						(10, 'Outdoor Sports Day', 'Delhi')



INSERT INTO [Event] VALUES (1, 'Book Fair', '2024-11-10', '10:00', 1, 2000, 1800, 50.00, 'Concert', NULL),
							(2, 'Lunch Special', '2023-11-12', '12:00', 2, 500, 300, 25.00, 'Movie', NULL),
							(3, 'National Science Cup', '2024-11-15', '09:00', 3, 1500, 1500, 75.00, 'Sports', NULL),
							(4, 'Theater Play', '2024-11-17', '19:30', 4, 700, 200, 2000.00, 'Concert', NULL),
							(5, 'Basketball Match', '2024-11-18', '18:00', 9, 2000, 1700, 80.00, 'Sports', NULL),
							(6, 'Yoga Session', '2024-11-20', '07:00', 5, 100, 50, 30.00, 'Concert', NULL),
							(7, 'Music Festival', '2024-11-22', '20:00', 6, 3000, 1500, 2000.00, 'Concert', NULL),
							(8, 'Cooking Workshop', '2023-11-25', '15:00', 7, 250, 150, 40.00, 'Movie', NULL),
							(9, 'Art Exhibition', '2024-11-28', '10:30', 8, 400, 200, 65.00, 'Movie', NULL),
							(10, 'Outdoor Sports Day', '2024-12-01', '14:00', 10, 1500, 1800, 45.00, 'Sports', NULL)


INSERT INTO Customer VALUES (1, 'Sam', 'sam@example.com', 1234567890, NULL),
							(2, 'Ram', 'ram@example.com', 9876543210, NULL),
							(3, 'Ravi', 'ravi@example.com', 1122334455, NULL),
							(4, 'Anu', 'anu@example.com', 2233445566, NULL),
							(5, 'Raj', 'raj@example.com', 3344556677, NULL),
							(6, 'Kumar', 'kumar@example.com', 4455667788, NULL),
							(7, 'Sita', 'sita@example.com', 5566778899, NULL),
							(8, 'Rohan', 'rohan@example.com', 6677889900, NULL),
							(9, 'Meena', 'meena@example.com', 7788990011, NULL),
							(10, 'Vijay', 'vijay@example.com', 8899001122, NULL)


INSERT INTO Booking VALUES (1, 1, 1, 2, 100.00, '2024-11-08'),
							(2, 2, 2, 3, 75.00, '2024-11-10'),
							(3, 3, 3, 4, 300.00, '2024-11-11'),
							(4, 4, 4, 1, 55.00, '2024-11-12'),
							(5, 5, 5, 5, 400.00, '2024-11-13'),
							(6, 6, 6, 2, 60.00, '2024-11-14'),
							(7, 7, 7, 3, 270.00, '2024-11-15'),
							(8, 8, 8, 1, 40.00, '2024-11-16'),
							(9, 9, 9, 4, 260.00, '2024-11-17'),
							(10, 10, 10, 2, 90.00, '2024-11-18')

-- Update Event and Customer tables to link bookings
UPDATE Event SET booking_id = 1 WHERE event_id = 1
UPDATE Event SET booking_id = 2 WHERE event_id = 2
UPDATE Event SET booking_id = 3 WHERE event_id = 3
UPDATE Event SET booking_id = 4 WHERE event_id = 4
UPDATE Event SET booking_id = 5 WHERE event_id = 5
UPDATE Event SET booking_id = 6 WHERE event_id = 6
UPDATE Event SET booking_id = 7 WHERE event_id = 7
UPDATE Event SET booking_id = 8 WHERE event_id = 8
UPDATE Event SET booking_id = 9 WHERE event_id = 9
UPDATE Event SET booking_id = 10 WHERE event_id = 10

UPDATE Customer SET booking_id = 1 WHERE customer_id = 1
UPDATE Customer SET booking_id = 2 WHERE customer_id = 2
UPDATE Customer SET booking_id = 3 WHERE customer_id = 3
UPDATE Customer SET booking_id = 4 WHERE customer_id = 4
UPDATE Customer SET booking_id = 5 WHERE customer_id = 5
UPDATE Customer SET booking_id = 6 WHERE customer_id = 6
UPDATE Customer SET booking_id = 7 WHERE customer_id = 7
UPDATE Customer SET booking_id = 8 WHERE customer_id = 8
UPDATE Customer SET booking_id = 9 WHERE customer_id = 9
UPDATE Customer SET booking_id = 10 WHERE customer_id = 10

--2.Write a SQL query to list all Events

SELECT * FROM [Event]

--3.Write a SQL query to select events with available tickets
SELECT *FROM [Event] 
WHERE available_seats IS NOT NULL

--4.Write a SQL query to select events name partial match with ‘cup’

SELECT * FROM [Event]
WHERE event_name LIKE '%cup%' 

--5.Write a SQL query to select events with ticket price range is between 1000 to 2500.
SELECT * FROM [Event]
WHERE ticket_price>=1000 AND ticket_price<=2500

--6.Write a SQL query to retrieve events with dates falling within a specific range.

SELECT * FROM [Event]
WHERE event_date>='2024-12-1' AND event_date<='2025-2-28' 


--7.Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.
SELECT * FROM [Event]
WHERE available_seats>0 AND event_type='Concert'


--8.Write a SQL query to retrieve users in batches of 5, starting from the 6th user.

SELECT * FROM Customer
ORDER BY customer_id
OFFSET 5 ROWS 
FETCH NEXT 5 ROWS ONLY

--9.Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.

SELECT * FROM Booking
WHERE num_tickets>4

--10. Write a SQL query to retrieve customer information whose phone number end with ‘000’


SELECT * FROM Customer
WHERE phone_number LIKE '%000'

--11. Write a SQL query to retrieve the events in order whose seat capacity more than 15000

SELECT * FROM [Event]
WHERE available_seats>=1500 
ORDER BY available_seats


--12. Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’

SELECT * FROM [Event]
WHERE event_name  LIKE '[^x-z]%'


USE TicketBookingSystems

--droped the table booking_id from customer table and the event table
ALTER TABLE customer
DROP CONSTRAINT FK_Customer_Booking

ALTER TABLE Customer
DROP COLUMN booking_id


ALTER TABLE [event]
DROP CONSTRAINT FK_Event_Booking;


ALTER TABLE [event]
DROP COLUMN booking_id

--TASK3

--1. Write a SQL query to List Events and Their Average Ticket Prices

SELECT  AVG(ticket_price) AS Averageticket
FROM [Event]

--2. Write a SQL query to Calculate the Total Revenue Generated by Events.

SELECT  SUM(ticket_price) AS revenue
FROM [Event]

--3. Write a SQL query to find the event with the highest ticket sales

SELECT TOP 1 e.event_id, e.event_name, SUM(b.num_tickets) AS total_ticket_sales
FROM Event e
JOIN Booking b 
ON e.event_id = b.event_id
GROUP BY e.event_id, e.event_name
ORDER BY total_ticket_sales DESC




--4. Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event.

SELECT event_id,SUM(num_tickets) AS total_tickets_sold
FROM Booking
GROUP BY event_id


--5. Write a SQL query to Find Events with No Ticket Sales.

SELECT E.event_name
FROM Event E
LEFT JOIN Booking B
ON E.event_id = B.event_id
WHERE B.booking_id IS NULL




--6. Write a SQL query to Find the User Who Has Booked the Most Tickets.
SELECT MAX(num_tickets) FROM Booking 



--8. Write a SQL query to calculate the average Ticket Price for Events in Each Venue.
SELECT V.venue_name,AVG(E.ticket_price) AS average_ticket_price
FROM  Event E
JOIN  Venu V 
ON E.venue_id = V.venue_id
GROUP BY V.venue_name


--9. Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type.

--same question repeated in question number 4

--10. Write a SQL query to calculate the total Revenue Generated by Events in Each Year

SELECT SUM(ticket_price*num_tickets) as totalrevenue,DATENAME(year,event_date) AS year
FROM Event e
JOIN Booking b
ON e.event_id=b.event_id
GROUP BY DATENAME(year,event_date) 

--11. Write a SQL query to list users who have booked tickets for multiple events
SELECT C.customer_name,COUNT(DISTINCT B.event_id) AS event_count
FROM  Customer C
JOIN Booking B ON C.customer_id = B.customer_id
GROUP BY C.customer_name
HAVING COUNT(DISTINCT B.event_id) > 1

--12. Write a SQL query to calculate the Total Revenue Generated by Events for Each User.
SELECT C.customer_name,SUM(B.num_tickets * E.ticket_price) AS total_revenue
FROM Customer C
JOIN Booking B 
ON C.customer_id = B.customer_id
JOIN Event E 
ON B.event_id = E.event_id
GROUP BY C.customer_name

--13. Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue
SELECT event_type,AVG(ticket_price) as average
from [Event]
where event_id=venue_id
group by event_type
order by event_type

--14. Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 Days.SELECT customer_name,SUM(num_tickets) as totalticket
FROM Booking b
join Customer c
on c.customer_id=b.customer_id
group by customer_name
order by(dateAdd(day,-30,GETDATE()))	     

--task-4
--1. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery.

SELECT venue_id,
(SELECT AVG(ticket_price)FROM Event E
WHERE E.venue_id = V.venue_id) AS average_ticket_price 
FROM Venu V

--2. Find Events with More Than 50% of Tickets Sold using subquery.
SELECT event_name from Event
where (SELECT SUM(num_tickets) from Booking
WHERE Booking.booking_id=Event.event_id)>(total_seats/2)

--3. Calculate the Total Number of Tickets Sold for Each Event.

SELECT event_id,(SELECT SUM(num_tickets) FROM Booking 
WHERE Booking.event_id = E.event_id) AS total_tickets_sold
FROM Event E

--4. Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery.
SELECT customer_name
FROM Customer C WHERE 
NOT EXISTS (SELECT customer_id FROM Booking B 
WHERE B.customer_id = C.customer_id )

--5. List Events with No Ticket Sales Using a NOT IN Subquery.
SELECT event_id,event_name from Event e
where event_id not in (SELECT event_id FROM Booking b
WHERE e.event_id=b.event_id)

--6. Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause.
 SELECT E.event_type,
SUM(T.total_tickets) AS total_tickets_sold
FROM  Event E, (SELECT event_id, SUM(num_tickets) AS total_tickets
FROM Booking
GROUP BY event_id) AS T
WHERE E.event_id = T.event_id
GROUP BY E.event_type;



 --7. Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause.

 SELECT event_name,event_id,ticket_price from [Event]
 where ticket_price>(SELECT AVG(ticket_price) from Event)

 --8. Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery
SELECT customer_name,(SELECT SUM(B.num_tickets * E.ticket_price)
FROM Booking B, Event E
WHERE B.event_id = E.event_id 
AND B.customer_id = C.customer_id) AS total_revenue
FROM Customer C

--9. List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause.SELECT customer_name
FROM Customer C
WHERE C.customer_id
IN (SELECT B.customer_id
FROM Booking B
WHERE B.event_id IN (
SELECT E.event_id
FROM Event E
WHERE E.venue_id = <given_venue_id>
   )
    )



--10. Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY.
SELECT event_id,event_type,(SELECT SUM(num_tickets) FROM Booking 
WHERE Booking.event_id = E.event_id) AS total_tickets_sold
FROM Event E
GROUP BY event_type

--11. Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT.

SELECT C.customer_name
FROM Customer C
WHERE C.customer_id 
IN (SELECT B.customer_id
FROM Booking B
WHERE FORMAT(B.booking_date, 'yyyy-MM') = FORMAT(GETDATE(), 'yyyy-MM')
)



use TicketBookingSystems

--12.Repeated question no 1










