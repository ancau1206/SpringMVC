USE master
GO
--Tạo CSDL Personal
IF EXISTS (SELECT * FROM sysdatabases WHERE name = N'Personal')
DROP DATABASE Personal
GO

CREATE DATABASE Personal
ON
(NAME = 'Personal', 
FILENAME = 'D:\Personal.mdf',
size = 5mb, 
maxsize = 10mb, 
filegrowth = 1mb)

LOG ON 
(NAME = 'Personal_LOG', 
FILENAME = 'D:\Personal.ldf',
size = 1mb, 
maxsize = 4mb, 
filegrowth = 1mb)
GO


--Chọn CSDL làm việc
USE Personal
GO
--Tạo bảng User lưu thông tin người sử dụng
CREATE TABLE Users(
	Username nvarchar(16) NOT NULL,
	Password nvarchar(16) NOT NULL,
	Role bigint NOT NULL,
	Status bit NOT NULL,
	PRIMARY KEY(Username)
)
GO
--Tạo bảng Departs lưu thông tin phòng ban
CREATE TABLE Departs(
	Id tinyint IDENTITY(1,1),
	CodeId nvarchar(8) NOT NULL,
	Name nvarchar(64) NOT NULL,
	PRIMARY KEY(Id),
	UNIQUE (CodeId)
)
GO
--Tạo bảng Staffs lưu thông tin nhân viên
CREATE TABLE Staffs(
	Id bigint IDENTITY(1,1),
	CodeId nvarchar(8) NOT NULL,
	Name nvarchar(64) NOT NULL,
	Gender bit NOT NULL,
	Birthday date NOT NULL,
	Photo nvarchar(256) NULL,
	Email nvarchar(64) NOT NULL,
	Phone nvarchar(16) NOT NULL,
	Salary float NOT NULL,
	Level tinyint NOT NULL,
	Notes nvarchar(512) NULL,
	DepartId tinyint NULL,
	PRIMARY KEY(Id),
	UNIQUE (CodeId),
	CHECK (Level <=10),
	FOREIGN KEY(DepartId) REFERENCES Departs(Id) ON DELETE SET NULL ON UPDATE CASCADE
)
GO
--Tạo bảng Records lưu thông tin thành tích và kỷ luật của nhân viên
CREATE TABLE Records(
	Id bigint IDENTITY(1,1),
	Type int NOT NULL,
	Reason nvarchar(512) NOT NULL,
	Date date NOT NULL,
	StaffId bigint NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(StaffId) REFERENCES Staffs(Id) ON DELETE NO ACTION ON UPDATE CASCADE
 )
 
 
 --Thêm dữ liệu
 
 --Bảng Users
 INSERT INTO Users VALUES ('admin','admin',1,1)
 
 --Bảng Departs 
 
 INSERT INTO Departs VALUES ('DE001',N'Phòng nhân sự')
 INSERT INTO Departs VALUES ('DE002',N'Phòng kế toán')
 INSERT INTO Departs VALUES ('DE003',N'Phòng kỹ thuật')
 INSERT INTO Departs VALUES ('DE004',N'Phòng kinh doanh')
 INSERT INTO Departs VALUES ('DE005',N'Phòng marketing')
 INSERT INTO Departs VALUES ('DE006',N'Phòng vật tư')

 --Bảng Staffs 
 

 --Bảng Records
 
  
---Truy vấn
 select * from Users
  select * from Departs
   select * from Staffs
    select * from Records