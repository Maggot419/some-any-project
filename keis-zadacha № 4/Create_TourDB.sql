CREATE DATABASE TourDB;
GO
USE TourDB;
GO

CREATE TABLE Tours (
    TourID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Price DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE Requests (
    RequestID INT IDENTITY(1,1) PRIMARY KEY,
    TourID INT NOT NULL,
    ClientName NVARCHAR(200) NOT NULL,
    ClientEmail NVARCHAR(200) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Requests_Tours FOREIGN KEY (TourID)
        REFERENCES Tours(TourID)
        ON DELETE CASCADE
);
GO

INSERT INTO Tours (Title, Description, Price)
VALUES
(N'Париж на выходные'),
(N'Сочи — море и горы'),
(N'Золотое кольцо России');
GO
