
CREATE TABLE Category (
    CategoryID int PRIMARY KEY,
    CategoryName varchar(50) NOT NULL
);

CREATE TABLE Book (
    BookReferenceNo as 'BOOKNO' + RIGHT(REPLICATE('0',3) + CONVERT(VARCHAR, BookID),3),
	BookID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(50) NOT NULL,
    NumberOfPages int NOT NULL,
    NumberOfVolume int NOT NULL,
	PublishDate date NOT NULL,
	CategoryID int FOREIGN KEY REFERENCES Category(CategoryID)
);


CREATE TABLE SubCategory (
	SubCategoryID int PRIMARY KEY,
	SubCategoryName varchar(50) NOT NULL,
	CategoryID int FOREIGN KEY REFERENCES Category(CategoryID) 
);		

CREATE TABLE Author (
    AuthorID int PRIMARY KEY,
    AuthorName varchar(100) NOT NULL,
    Experience int NOT NULL,
	BookID int FOREIGN KEY REFERENCES Book(BookID)
);


CREATE TABLE Role (
	RoleID int PRIMARY KEY,
	RoleName varchar(50) NOT NULL
);


CREATE TABLE Users 
(
	UserID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(50) NOT NULL,
    MobileNo char(10) NOT NULL
		constraint CK_Users_MobileNo check (MobileNo like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Email varchar(50) NOT NULL,
    Gender varchar(20) NOT NULL,
	DateOfBirth date NOT NULL,
	Hobbies varchar(500),
    ProfilePic varchar(300),
	Password varchar(50) NOT NULL,
	RoleID int FOREIGN KEY REFERENCES Role(RoleID)
);


INSERT INTO Role VALUES ('1','Admin');

INSERT INTO Role VALUES ('2','User')

SELECT * From Role

ALTER TABLE Users
ADD ProfilePicPath nvarchar(200);


DBCC CHECKIDENT ('Users', RESEED, 0)


DBCC CHECKIDENT ('Book', RESEED, 3)

SET IDENTITY_INSERT Book OFF;


INSERT INTO Book(Title,NumberOfPages,NumberOfVolume,PublishDate,CategoryID) VALUES('Concepts of Physics',800,2,'01-01-2022',1)
INSERT INTO Book(Title,NumberOfPages,NumberOfVolume,PublishDate,CategoryID) VALUES('Mathematics for Class 12',600,2,'01-01-2022',1)
INSERT INTO Book(Title,NumberOfPages,NumberOfVolume,PublishDate,CategoryID) VALUES('New Course Chemistry',700,2,'01-04-2022',1)
INSERT INTO Book(Title,NumberOfPages,NumberOfVolume,PublishDate,CategoryID) VALUES('Harry Potter',4200,7,'06-26-1997',2)
INSERT INTO Book(Title,NumberOfPages,NumberOfVolume,PublishDate,CategoryID) VALUES('Dune',2400,6,'08-08-1965',2)
INSERT INTO Book(Title,NumberOfPages,NumberOfVolume,PublishDate,CategoryID) VALUES('Wings of Freedom',180,1,'01-01-1999',3)
INSERT INTO Book(Title,NumberOfPages,NumberOfVolume,PublishDate,CategoryID) VALUES('The Diary of a Young Girl',714,1,'06-25-1947',3)


INSERT INTO Category(CategoryID,CategoryName) VALUES(1,'Education')
INSERT INTO Category(CategoryID,CategoryName) VALUES(2,'Fiction')
INSERT INTO Category(CategoryID,CategoryName) VALUES(3,'Non-Fiction')


INSERT INTO SubCategory(SubCategoryID,SubCategoryName,CategoryID) VALUES(1,'Physics',1)
INSERT INTO SubCategory(SubCategoryID,SubCategoryName,CategoryID) VALUES(2,'Mathematics',1)
INSERT INTO SubCategory(SubCategoryID,SubCategoryName,CategoryID) VALUES(3,'Chemistry',1)
INSERT INTO SubCategory(SubCategoryID,SubCategoryName,CategoryID) VALUES(4,'Fantasy',2)
INSERT INTO SubCategory(SubCategoryID,SubCategoryName,CategoryID) VALUES(5,'Science',2)
INSERT INTO SubCategory(SubCategoryID,SubCategoryName,CategoryID) VALUES(6,'Autobiography',3)
INSERT INTO SubCategory(SubCategoryID,SubCategoryName,CategoryID) VALUES(7,'Memoir',3)


INSERT INTO Author VALUES(1,'H.C. Verma',50,1)
INSERT INTO Author VALUES(2,'R.D. Sharma',40,2)
INSERT INTO Author VALUES(3,'S.N. Dhawan',30,3)
INSERT INTO Author VALUES(4,'S.C. Kheterpal',30,3)
INSERT INTO Author VALUES(5,'J.K. Rowling',25,4)
INSERT INTO Author VALUES(6,'Frank Herbert',45,5)
INSERT INTO Author VALUES(7,'A.P.J. Abdul Kalam',40,6)
INSERT INTO Author VALUES(8,'Arun Tiwari',40,6)
INSERT INTO Author VALUES(9,'Anne Frank',3,7)




DELETE FROM Category WHERE CategoryName='Education';

DELETE FROM Book WHERE Title='Concepts of Physics';
DELETE FROM Book WHERE Title='Harry Potter';
DELETE FROM Book WHERE Title='Dune';

SELECT COUNT(BookID) FROM Book
SELECT * FROM Book



DBCC CHECKIDENT ('Book', RESEED, 0)