USE Master
GO

IF EXISTS(SELECT * FROM sysdatabases WHERE [name] = 'LibraryManagementSystem')
DROP DATABASE LibraryManagementSystem
GO

CREATE DATABASE LibraryManagementSystem
GO

USE LibraryManagementSystem
GO
--for book info like author, publisher, title
CREATE SCHEMA BOOK_INFO
GO

--for info related to books and the library, like number of copies, number of loans out
CREATE SCHEMA LIBRARY_AND_BOOK
GO

--for info related to the library, like branch names or addresses
CREATE SCHEMA LIBRARY_INFO
GO

--for info related to people, like the borrower
CREATE SCHEMA PERSON
GO

SET NOCOUNT ON

--Create tables related to book info, like author, publisher, title
CREATE TABLE BOOK_INFO.Book
(BookID int PRIMARY KEY NOT NULL
,Title varchar(50) NOT NULL
,PublisherName varchar(50) NOT NULL)

INSERT INTO BOOK_INFO.Book
VALUES (1,'The Lost Tribe','Penguin Publishers')
	,(2,'The Cat Who Stole Christmas','Bill''s Publishing')
	,(3,'Something Else','Jim''s Publishing')
	,(4,'Book 4','Penguin Publishers')
	,(5,'This Book','Jim''s Publishing')
	,(6,'That Book','Jim''s Publishing')
	,(7,'Something Else II','Jim''s Publishing')
	,(8,'Time Warp','Bill''s Publishing')
	,(9,'Time Warp II','Bill''s Publishing')
	,(10,'Time Warp III','Bill''s Publishing')
	,(11,'Car Stuff','Penguin Publishers')
	,(12,'Car Stuff II','Penguin Publishers')
	,(13,'Some Other Book Name','Some Guy Publishers')
	,(14,'Running Out of Book Names','Running Out of Publisher Names')
	,(15,'Something Else III','Jim''s Publishing')
	,(16,'This Book II','Jim''s Publishing')
	,(17,'That Book II','Jim''s Publishing')
	,(18,'Another Book','Bill''s Publishing')
	,(19,'Almost Finished','Penguin Publishers')
	,(20,'Finally Done','Penguin Publishers')

CREATE TABLE BOOK_INFO.Book_Authors
(BookID int PRIMARY KEY NOT NULL
,AuthorName varchar(50) NOT NULL)

INSERT INTO BOOK_INFO.Book_Authors
VALUES (1,'Bill Smith')
	,(2,'Bill Smith')
	,(3,'Jim Jackson')
	,(4,'Jim Jackson')
	,(5,'Sally Carson')
	,(6,'Sally Carson')
	,(7,'Harry Smith')
	,(8,'Jackie Williams')
	,(9,'Carrie Wilson')
	,(10,'Carrie Wilson')
	,(11,'Carrie Wilson')
	,(12,'Jill Johnson')
	,(13,'Jill Johnson')
	,(14,'Jill Johnson')
	,(15,'Kelly Jackson')
	,(16,'Kelly Jackson')
	,(17,'Sally Anderson')
	,(18,'Stephen King')
	,(19,'Stephen King')
	,(20,'Stephen King')

CREATE TABLE BOOK_INFO.Publisher
(Name varchar(50) PRIMARY KEY NOT NULL
,[Address] varchar(50) NULL
,Phone varchar(25) NULL)

INSERT INTO BOOK_INFO.Publisher
VALUES ('Penguin Publishers','15 First St','781-555-9087')
	,('Jim''s Publishing','123 Fake St','986-555-4567')
	,('Bill''s Publishing','27 Something Ave','564-555-3576')
	,('Some Guy Publishers','11 Sparkle St','567-555-4379')
	,('Running Out of Publisher Names','8 Park Blvd','978-555-3679')

--Create tables for info related to both the library and the books, like loans and number of copies
CREATE TABLE LIBRARY_AND_BOOK.Book_Copies
(CopiesID int PRIMARY KEY NOT NULL
,BookID int NOT NULL
,BranchID int NOT NULL
,No_of_Copies int)

INSERT INTO LIBRARY_AND_BOOK.Book_Copies
VALUES (1,1,1,2)
	,(2,2,1,3)
	,(3,3,1,3)
	,(4,5,1,2)
	,(5,6,1,4)
	,(6,8,1,2)
	,(7,9,1,3)
	,(8,13,1,2)
	,(9,15,1,5)
	,(10,18,1,3)
	,(11,3,2,2)
	,(12,5,2,3)
	,(13,6,2,3)
	,(14,9,2,2)
	,(15,12,2,4)
	,(16,14,2,2)
	,(17,16,2,3)
	,(18,17,2,2)
	,(19,18,2,5)
	,(20,20,2,3)
	,(21,2,3,2)
	,(22,3,3,3)
	,(23,7,3,3)
	,(24,8,3,2)
	,(25,11,3,4)
	,(26,13,3,2)
	,(27,15,3,3)
	,(28,16,3,2)
	,(29,17,3,5)
	,(30,19,3,3)
	,(31,1,4,2)
	,(32,3,4,3)
	,(33,4,4,3)
	,(34,5,4,2)
	,(35,7,4,4)
	,(36,8,4,2)
	,(37,13,4,3)
	,(38,14,4,2)
	,(39,16,4,5)
	,(40,20,4,3)

CREATE TABLE LIBRARY_AND_BOOK.Book_Loans
(BookLoanID int PRIMARY KEY NOT NULL
,BookID int NOT NULL
,BranchID int NOT NULL
,CardNo varchar(25) NOT NULL
,DateOut varchar(15)
,DueDate varchar(15))

INSERT INTO LIBRARY_AND_BOOK.Book_Loans
	VALUES (1,20,1,'111-111-111-111','2016-12-10','2016-12-15')
	,(2,10,1,'111-111-111-112','2016-12-10','2016-12-15')
	,(3,11,1,'111-111-111-113','2016-12-12','2016-12-17')
	,(4,7,1,'111-111-111-114','2016-12-12','2016-12-17')
	,(5,18,1,'111-111-111-115','2016-12-10','2016-12-15')
	,(6,17,1,'111-111-111-113','2016-12-14','2016-12-19')
	,(7,16,1,'111-111-111-116','2016-12-14','2016-12-19')
	,(8,1,1,'111-111-111-112','2016-12-12','2016-12-17')
	,(9,20,1,'111-111-111-116','2016-12-14','2016-12-19')
	,(10,18,1,'111-111-111-114','2016-12-10','2016-12-15')
	,(11,6,2,'111-111-111-112','2016-12-14','2016-12-19')
	,(12,12,2,'111-111-111-113','2016-12-14','2016-12-19')
	,(13,16,2,'111-111-111-116','2016-12-12','2016-12-17')
	,(14,3,2,'111-111-111-112','2016-12-14','2016-12-19')
	,(15,12,2,'111-111-111-113','2016-12-10','2016-12-15')
	,(16,14,2,'111-111-111-115','2016-12-12','2016-12-17')
	,(17,1,2,'111-111-111-112','2016-12-12','2016-12-17')
	,(18,11,2,'111-111-111-113','2016-12-10','2016-12-15')
	,(19,16,2,'111-111-111-114','2016-12-14','2016-12-19')
	,(20,1,2,'111-111-111-112','2016-12-12','2016-12-17')
	,(21,15,2,'111-111-111-113','2016-12-10','2016-12-15')
	,(22,11,2,'111-111-111-114','2016-12-12','2016-12-17')
	,(23,18,2,'111-111-111-113','2016-12-10','2016-12-15')
	,(24,2,2,'111-111-111-113','2016-12-14','2016-12-19')
	,(25,6,3,'111-111-111-114','2016-12-12','2016-12-17')
	,(26,3,3,'111-111-111-111','2016-12-10','2016-12-15')
	,(27,5,3,'111-111-111-113','2016-12-14','2016-12-19')
	,(28,2,3,'111-111-111-114','2016-12-12','2016-12-17')
	,(29,10,3,'111-111-111-112','2016-12-12','2016-12-17')
	,(30,13,3,'111-111-111-113','2016-12-12','2016-12-17')
	,(31,3,3,'111-111-111-114','2016-12-14','2016-12-19')
	,(32,4,3,'111-111-111-113','2016-12-14','2016-12-19')
	,(33,4,3,'111-111-111-114','2016-12-10','2016-12-15')
	,(34,12,3,'111-111-111-112','2016-12-14','2016-12-19')
	,(35,9,3,'111-111-111-113','2016-12-14','2016-12-19')
	,(36,9,3,'111-111-111-114','2016-12-12','2016-12-17')
	,(37,18,4,'111-111-111-112','2016-12-10','2016-12-15')
	,(38,8,4,'111-111-111-113','2016-12-14','2016-12-19')
	,(39,19,4,'111-111-111-112','2016-12-10','2016-12-15')
	,(40,19,4,'111-111-111-112','2016-12-12','2016-12-17')
	,(41,15,4,'111-111-111-113','2016-12-14','2016-12-19')
	,(42,7,4,'111-111-111-114','2016-12-10','2016-12-15')
	,(43,16,4,'111-111-111-112','2016-12-12','2016-12-17')
	,(44,6,4,'111-111-111-113','2016-12-14','2016-12-19')
	,(45,17,4,'111-111-111-114','2016-12-14','2016-12-19')
	,(46,12,4,'111-111-111-112','2016-12-14','2016-12-19')
	,(47,7,4,'111-111-111-113','2016-12-12','2016-12-17')
	,(48,5,4,'111-111-111-114','2016-12-10','2016-12-15')
	,(49,8,4,'111-111-111-112','2016-12-12','2016-12-17')
	,(50,14,4,'111-111-111-113','2016-12-12','2016-12-17')

--Create tables for info related to the library, like a branch name or address
CREATE TABLE LIBRARY_INFO.Library_Branch
(BranchID int PRIMARY KEY NOT NULL
,BranchName varchar(30)
,[Address] varchar(50))

INSERT INTO LIBRARY_INFO.Library_Branch
VALUES (1,'Sharpstown','123 Something Cir')
	,(2,'Central','22 XYZ Ave')
	,(3,'Northern','3 ABC Ln')
	,(4,'Southern','19 Cats St')

--Create tables for info related to people, like the borrower
CREATE TABLE PERSON.Borrower
(CardNo varchar(25) PRIMARY KEY NOT NULL
,Name varchar(50)
,[Address] varchar(50)
,Phone varchar(25) NOT NULL)

INSERT INTO PERSON.Borrower
VALUES ('111-111-111-111','Jack','8 Dog St','456-555-3575')
	,('111-111-111-112','Sam','529 Secont Ave','287-555-2684')
	,('111-111-111-113','Tyler','2 Pine Ln','685-555-6227')
	,('111-111-111-114','Jared','5 Fifth Ave','426-555-8679')
	,('111-111-111-115','Cal','9 King Ln','578-555-4568')
	,('111-111-111-116','Rick','17 Pug Cir','566-555-1685')
	,('111-111-111-117','Carol','98 Spring St','894-555-4687')
	,('111-111-111-118','Sue','73 Snack Ln','877-555-9986')