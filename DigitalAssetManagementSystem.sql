
--Creating database
create database DigitalAssetManagementSystem

use DigitalAssetManagementSystem
-- 1. Creating employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    [password] VARCHAR(255) NOT NULL
)

-- 2. Creating assets table
CREATE TABLE assets (
    asset_id INT PRIMARY KEY,
    asset_name VARCHAR(100) NOT NULL,
    asset_type VARCHAR(50) NOT NULL,
    serial_number VARCHAR(100) UNIQUE NOT NULL,
    purchase_date DATE,
    [location] VARCHAR(100),
    asset_status VARCHAR(50) CHECK (asset_status IN ('in use', 'decommissioned', 'under maintenance')),
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES employees(employee_id)
)

-- 3. Creating maintenance_records table
CREATE TABLE maintenance_records (
    maintenance_id INT PRIMARY KEY,
    asset_id INT NOT NULL,
    maintenance_date DATE NOT NULL,
    [description] TEXT,
    cost DECIMAL(10, 2),
    FOREIGN KEY (asset_id) REFERENCES assets(asset_id)
)

-- 4. Creating asset_allocations table
CREATE TABLE asset_allocations (
    allocation_id INT PRIMARY KEY,
    asset_id INT NOT NULL,
    employee_id INT NOT NULL,
    allocation_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (asset_id) REFERENCES assets(asset_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
)

-- 5. Creating reservations table
CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY,
    asset_id INT NOT NULL,
    employee_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    [start_date] DATE NOT NULL,
    end_date DATE NOT NULL,
    reser_status VARCHAR(50) CHECK (reser_status IN ('pending', 'approved', 'canceled')),
    FOREIGN KEY (asset_id) REFERENCES assets(asset_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
)

INSERT INTO employees VALUES (1, 'Ram', 'IT', 'ram@example.com', 'password123'),
							(2, 'Vignesh', 'Finance', 'vignesh@example.com', 'password456'),
							(3, 'Shruthi', 'HR', 'shruthi@example.com', 'password789')


INSERT INTO assets VALUES(1, 'Dell Laptop', 'laptop', 'SN12345', '2022-01-15', 'Head Office', 'in use', 1),
								(2, 'Projector', 'equipment', 'SN67890', '2021-05-10', 'Conference Room', 'under maintenance', 2),
								(3, 'Ford Car', 'vehicle', 'SN54321', '2020-11-20', 'Parking Lot', 'decommissioned', 3)

INSERT INTO maintenance_records VALUES(1, 1, '2023-01-10', 'Battery replacement', 150.00),
										(2, 2, '2023-02-15', 'Projector bulb replacement', 200.00),
										(3, 3, '2023-03-20', 'Engine repair', 500.00)


INSERT INTO asset_allocations VALUES(1, 1, 1, '2023-04-01', '2023-05-01'),
									(2, 2, 2, '2023-05-10', NULL),
									(3, 3, 3, '2023-06-15', NULL)


INSERT INTO reservations VALUES(1, 1, 1, '2023-07-01', '2023-07-05', '2023-07-10', 'approved'),
								(2, 2, 2, '2023-08-01', '2023-08-05', '2023-08-10', 'pending'),
								(3, 3, 3, '2023-09-01', '2023-09-05', '2023-09-10', 'canceled')
