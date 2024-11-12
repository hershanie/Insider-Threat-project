DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Geolocation;
DROP TABLE IF EXISTS ExchangeRates;
DROP TABLE IF EXISTS Devices;
DROP TABLE IF EXISTS Merchants;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    user_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    signup_date DATE,
    country TEXT,
    date_of_birth DATE
);

CREATE TABLE Merchants (
    merchant_id TEXT PRIMARY KEY,
    merchant_name TEXT NOT NULL,
    category TEXT,
    location TEXT
);

CREATE TABLE Devices (
    device_id TEXT PRIMARY KEY,
    device_type TEXT,
    os TEXT,
    ip_address TEXT NOT NULL
);

CREATE TABLE Transactions (
    transaction_id TEXT PRIMARY KEY,
    user_id TEXT NOT NULL,
    merchant_id TEXT,
    device_id TEXT,
    amount REAL NOT NULL,
    currency TEXT NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    transaction_type TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (merchant_id) REFERENCES Merchants(merchant_id),
    FOREIGN KEY (device_id) REFERENCES Devices(device_id)
);

CREATE TABLE ExchangeRates (
    currency TEXT PRIMARY KEY,
    rate_to_usd REAL,
    date DATE NOT NULL
);

CREATE TABLE Geolocation (
    ip_address TEXT PRIMARY KEY,
    country TEXT NOT NULL,
    region TEXT,
    city TEXT,
    latitude REAL NOT NULL,
    longitude REAL NOT NULL
);

INSERT INTO Users (user_id, name, email, signup_date, country, date_of_birth) VALUES
    ('uuid-1', 'John Doe', 'john.doe@example.com', '2020-01-15', 'USA', '1990-06-15'),
    ('uuid-2', 'Jane Smith', 'jane.smith@example.com', '2019-03-22', 'Canada', '1985-11-30'),
    ('uuid-3', 'Mike Johnson', 'mike.johnson@example.com', '2021-02-12', 'UK', '1992-07-20'),
    ('uuid-4', 'Sara Connor', 'sara.connor@example.com', '2022-05-25', 'Germany', '1988-09-10'),
    ('uuid-5', 'Alice Wonderland', NULL, '2020-07-10', 'UK', NULL),
    ('uuid-6', 'Bob Marley', 'bob.marley@example.com', NULL, NULL, '1970-02-06');

INSERT INTO Merchants (merchant_id, merchant_name, category, location) VALUES
    ('merchant-1', 'Amazon', 'E-commerce', 'Seattle'),
    ('merchant-2', 'Walmart', 'Retail', 'Arkansas'),
    ('merchant-3', 'Apple', 'Technology', 'California'),
    ('merchant-4', 'BestBuy', NULL, NULL);

INSERT INTO Devices (device_id, device_type, os, ip_address) VALUES
    ('device-1', 'Mobile', 'Android', '192.168.1.10'),
    ('device-2', 'Laptop', 'Windows', '192.168.1.11'),
    ('device-3', 'Tablet', 'iOS', '192.168.1.12'),
    ('device-4', NULL, NULL, '192.168.1.13');

INSERT INTO Transactions (transaction_id, user_id, merchant_id, device_id, amount, currency, transaction_date, transaction_type) VALUES
    ('trans-1', 'uuid-1', 'merchant-1', 'device-1', 100.00, 'USD', '2023-01-15 10:00:00', 'purchase'),
    ('trans-2', 'uuid-2', 'merchant-2', 'device-2', 50.00, 'USD', '2023-02-01 12:00:00', 'refund'),
    ('trans-3', 'uuid-1', NULL, 'device-1', 200.00, 'USD', '2023-03-10 09:30:00', 'purchase'),
    ('trans-4', 'uuid-2', 'merchant-1', NULL, 150.00, 'USD', '2023-04-05 15:45:00', 'purchase'),
    ('trans-5', 'uuid-1', 'merchant-2', 'device-2', 75.00, 'USD', '2023-05-20 14:20:00', 'purchase'),
    ('trans-6', 'uuid-5', NULL, 'device-1', 250.00, 'USD', '2023-06-01 11:00:00', 'purchase'),
    ('trans-7', 'uuid-6', 'merchant-2', NULL, 300.00, 'USD', '2023-07-15 13:30:00', 'refund'),
    ('trans-8', 'uuid-1', NULL, NULL, 125.00, 'USD', '2023-08-20 10:10:00', 'purchase');

INSERT INTO ExchangeRates (currency, rate_to_usd, date) VALUES
    ('USD', 1.0000, '2023-01-01'),
    ('EUR', 1.1300, '2023-01-01'),
    ('GBP', 1.3800, '2023-01-01'),
    ('CAD', NULL, '2023-01-01');

INSERT INTO Geolocation (ip_address, country, region, city, latitude, longitude) VALUES
    ('192.168.1.10', 'USA', 'Washington', 'Seattle', 47.6062, -122.3321),
    ('192.168.1.11', 'USA', 'Arkansas', 'Bentonville', 36.3729, -94.2088),
    ('192.168.1.12', 'Canada', 'Ontario', 'Toronto', 43.65107, -79.347015),
    ('192.168.1.13', 'France', NULL, NULL, 48.8566, 2.3522);