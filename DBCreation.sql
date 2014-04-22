USE Northwind
GO
DROP DATABASE TPW24
GO
CREATE DATABASE TPW24
GO

USE TPW24
GO

CREATE TABLE Users (
  UserID INT IDENTITY(1,1) PRIMARY KEY,
  Password VARCHAR(30) NOT NULL,
  FirstName NVARCHAR(60),
  LastName NVARCHAR(60),
  --DateOfBirth DATE,
  Sexe CHAR(1),
  Country VARCHAR(60),
  Province VARCHAR(60),
  City VARCHAR(60),
  CreationDate DATE,
  DateLastLogin DATE,
  IsAdmin BIT
)
GO

CREATE TABLE Boards (
  BoardID INT IDENTITY(1,1) PRIMARY KEY,
  BoardName VARCHAR(100) NOT NULL
)
GO

CREATE TABLE Topics (
  TopicID INT IDENTITY(1,1) PRIMARY KEY,
  BoardID INT FOREIGN KEY REFERENCES Boards(BoardID),
  StartedBy INT FOREIGN KEY REFERENCES Users(UserID),
  TopicTitle VARCHAR(100) NOT NULL
)
GO

CREATE TABLE [Messages] (
  MessageID INT IDENTITY(1,1) PRIMARY KEY,
  TopicID INT FOREIGN KEY REFERENCES Topics(TopicID),
  WrittenBy INT FOREIGN KEY REFERENCES Users(UserID),
  DateWritten DATE NOT NULL,
  DateLastEdited DATE,
  Content NTEXT NOT NULL,
  IsBlocked BIT -- Dans le cas où un modérateur veut effacer un message, il doit plutôt rendre ce champ à true.
)
GO

CREATE TABLE PrivateMsgs (
  PrivateMsgID INT IDENTITY(1,1) PRIMARY KEY,
  WrittenBy INT FOREIGN KEY REFERENCES Users(UserID),
  SentTo INT FOREIGN KEY REFERENCES Users(UserID),
  DateWritten DATE NOT NULL,
  Content NTEXT NOT NULL
)
GO
