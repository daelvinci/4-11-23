CREATE DATABASE EVENTTASK
GO
USE EVENTTASK
GO

CREATE TABLE Cities
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20)
)
INSERT INTO Cities
VALUES 
('Baku'),
('Florida'),
('Las Vegas'),
('Antalya')

CREATE TABLE Speakers
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(20),
Surname NVARCHAR(20)
)
INSERT INTO Speakers
VALUES 
('Elvin', 'Bilalov'),
('Aif','Semsi'),
('Kukla','Ayi'),
('Meqsud', 'Muslum')



CREATE TABLE [Events]
(
Id INT PRIMARY KEY IDENTITY ,
Name NVARCHAR(20),
StartDate DATE,
EndDate DATE,
Title NVARCHAR(20),
Desciription NVARCHAR(MAX),
BgImg NVARCHAR(MAX),
CityId INT FOREIGN KEY REFERENCES Cities(Id)
)
Alter TABLE Events
alter column StartDate DAtetime2
Alter TABLE Events
alter column EndDate DAtetime2
INSERT INTO Events(Name, StartDate,EndDate,CityId)
VALUES
('Panda1','11-11-2022 18:00:00','11-11-2022 20:00:00',1),
('Panda2','11-11-2022 17:00:00','11-11-2022 18:00:00',1),
('Panda3','11-11-2022 10:00:00','11-11-2022 13:00:00',2),
('Panda4','11-11-2022 09:00:00','11-11-2022 16:00:00',3)

Update Events
set StartDate='11-11-2022 18:00:00' WHERE Name='Panda1'

Update Events
set StartDate='11-11-2022 17:00:00' WHERE Name='Panda2'

Update Events
set StartDate='11-11-2022 10:00:00' WHERE Name='Panda3'

Update Events
set StartDate='11-11-2022 09:00:00' WHERE Name='Panda4'

Update Events
set EndDate='11-11-2022 20:00:00' WHERE Name='Panda1'

Update Events
set EndDate='11-11-2022 18:00:00' WHERE Name='Panda2'

Update Events
set EndDate='11-11-2022 13:00:00' WHERE Name='Panda3'

Update Events
set EndDate='11-11-2022 16:00:00' WHERE Name='Panda4'





CREATE TABLE EventDetail
(
SpeakerId INT FOREIGN KEY REFERENCES Speakers(Id),
EventId INT FOREIGN KEY REFERENCES [Events] (Id)
)	
INSERT INTO EventDetail
VALUES 
(1,1),
(1,3),
(2,1),
(2,3)

Select Events.Name, StartDate,EndDate,Cities.Name,(SELECT COUNT(SpeakerId) FROM EventDetail  WHERE SpeakerId=Events.Id) AS SpeakerCount, (SELECT datediff(MINUTE, StartDate, EndDate)) AS EventMinute FROM Events
JOIN Cities 
ON CityId=Cities.Id

CREATE PROCEDURE Select_EventByDate
@Year Datetime2, @Month Datetime2, @Day Datetime2
AS
Select * FROM Events Where @Year=(SELECT DATEPART(YEAR, StartDate)) AND @Month=(SELECT DATEPART(MONTH, StartDate))AND @Day=(SELECT DATEPART(DAY, StartDate))






