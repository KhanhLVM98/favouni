DROP DATABASE SocialNetwork
CREATE DATABASE SocialNetwork
GO
USE SocialNetwork
GO
CREATE TABLE UserTB(
	username NVARCHAR(30) PRIMARY KEY,
	fullname NVARCHAR(30) not null,
	userpass NVARCHAR(30) not null,
	dob NVARCHAR(30),
	gender CHAR(1),
	email NVARCHAR(30),
	phone NVARCHAR(30),
	userLocation NVARCHAR(30),
	bio NVARCHAR(50),
)
GO
INSERT INTO UserTB(username,fullname,userpass,dob,gender) VALUES('khanhlvm98','Le Viet Minh Khanh','khanh123456','1998-02-26','M')
INSERT INTO UserTB(username,fullname,userpass,dob,gender) VALUES('hieupt123','Pham Trung Hieu','hieu123456','198-02-05','M')
INSERT INTO UserTB(username,fullname,userpass,dob,gender) VALUES('trangttm456','Tran Thi Minh Trang','trang123456','1999-02-02','F')
INSERT INTO UserTB(username,fullname,userpass,dob,gender) VALUES('longpk789','Pham Khanh Long','long123456','1999-04-26','M')
GO
CREATE TABLE FriendTB (
	username_1 NVARCHAR(30) FOREIGN KEY REFERENCES UserTB(username),
	username_2 NVARCHAR(30) FOREIGN KEY REFERENCES UserTB(username),
	statusFriend INT,
	addDate NVARCHAR(30),
)
GO
CREATE TABLE ActivityTB (
	actID INT PRIMARY KEY,
	username NVARCHAR(30) FOREIGN KEY REFERENCES UserTB(username),
	actName NVARCHAR(50) not null,
	actLocation NVARCHAR(30),
	actTime NVARCHAR(30),
	actDate NVARCHAR(30),
	actCategory NVARCHAR(30),
	actDescription NVARCHAR(100),
)
GO
INSERT INTO ActivityTB(actID, username, actName, actLocation, actTime, actDate, actCategory, actDescription) VALUES(1,'khanhlvm98','Project Presentation PRJ321','Room 203','7:45','2019-11-12','Learn','Lecturer: Thay Nguyen Van Lanh')
INSERT INTO ActivityTB(actID, username, actName, actLocation, actTime, actDate, actCategory, actDescription) VALUES(2,'longpk789','Error Detect Presentation NWC202','203room','10:15','2019-11-12','Learn','Lecturer: Thay Le Tran Duc')
INSERT INTO ActivityTB(actID, username, actName, actLocation, actTime, actDate, actCategory, actDescription) VALUES(3,'trangttm456','Sleep with me','My home','22:00','2020-01-01','Fitness', 'Handsome ,Strongman')
INSERT INTO ActivityTB(actID, username, actName, actLocation, actTime, actDate, actCategory, actDescription) VALUES(4,'hieupt123','Try hit to me','Front of University','12:00','2019-11-12','Sport','What do you mean?')
GO
CREATE TABLE JoinTB (
	actID INT FOREIGN KEY REFERENCES ActivityTB(actID), 
	username NVARCHAR(30) FOREIGN KEY REFERENCES UserTB(username),
	joinDate NVARCHAR(30) not null,
	PRIMARY KEY (actID,username)
)
INSERT INTO JoinTB(actID, username, joinDate) VALUES(1,'khanhlvm98','2019-11-12')
INSERT INTO JoinTB(actID, username, joinDate) VALUES(2,'longpk789','2019-10-12')
INSERT INTO JoinTB(actID, username, joinDate) VALUES(3,'trangttm456','2019-08-12')
INSERT INTO JoinTB(actID, username, joinDate) VALUES(4,'hieupt123','2019-11-09')
GO
CREATE TABLE LikeTB (
	actID INT FOREIGN KEY REFERENCES ActivityTB(actID), 
	username NVARCHAR(30) FOREIGN KEY REFERENCES UserTB(username),
	PRIMARY KEY (actID,username)
)
GO
CREATE TABLE CommentTB (
	actID INT FOREIGN KEY REFERENCES ActivityTB(actID), 
	username NVARCHAR(30) FOREIGN KEY REFERENCES UserTB(username),
	content NVARCHAR(200) not null,
	dateComment NVARCHAR(30),
)





