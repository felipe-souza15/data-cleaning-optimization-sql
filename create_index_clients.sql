-- Creates an index to improve query performance when searching for active customers
CREATE INDEX idx_active_clients ON Customers (Status, RegistrationDate);