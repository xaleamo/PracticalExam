DROP TABLE Tasks
DROP TABLE Developers
DROP TABLE Projects
DROP TABLE TaskTypes
DROP TABLE TaskPriorities
DROP TABLE TaskStatus

GO

CREATE TABLE TaskStatus(
	TSId INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(20)
)

CREATE TABLE TaskPriorities(
	TPId INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(20),
	Descr VARCHAR(500)
)

CREATE TABLE TaskTypes(
	TTId INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(20),
	Descr VARCHAR(500)
)

CREATE TABLE Projects(
	ProjectId INT PRIMARY KEY IDENTITY(1,1),
	[Name] VARCHAR(30),
	StartDate DATE,
	EndDate DATE
)
CREATE TABLE Developers(
	DevId INT PRIMARY KEY IDENTITY(1,1),
	FName VARCHAR(30),
	LName VARCHAR(30)
)

CREATE TABLE Tasks(
	TaskId INT PRIMARY KEY IDENTITY(1,1),
	ProjectId INT REFERENCES Projects(ProjectId),
	DevId  INT REFERENCES Developers(DevId),

	Title VARCHAR(40),
	Descr VARCHAR(500),

	TTId  INT REFERENCES TaskTypes(TTId),
	TSId  INT REFERENCES TaskStatus(TSId),
	TPId INT REFERENCES TaskPriorities(TPId)
)

--inserts

INSERT INTO TaskTypes VALUES
('tehnical',''),
('bug',''),
('improvement','')

INSERT INTO TaskPriorities VALUES
('critical',''),
('show-stopper',''),
('minor',''),
('trivial','')
INSERT INTO TaskStatus VALUES
('started'),('in progress'),('closed')

INSERT INTO Projects VALUES
('project1','2024-04-14','2028-10-23'),
('project2','2025-05-01','2026-06-18')

INSERT INTO Developers VALUES
('Maria','A'),('N','B')