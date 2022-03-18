CREATE DATABASE QuanLySinhVien2;
USE QuanLySinhVien2;
CREATE TABLE Class(
    ClassID     INT         NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    ClassName   VARCHAR(60) NOT NULL ,
    StartDate   DATETIME    NOT NULL ,
    Status      BIT
);

CREATE TABLE Student(
    StudentID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    StudentName VARCHAR(30) NOT NULL ,
    Address     VARCHAR(50) ,
    Phone       VARCHAR(20),
    Status      BIT ,
    ClassID     INT         NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

CREATE TABLE Subject(
    SubID      INT         NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    SubName    VARCHAR(30) NOT NULL ,
    Credit     TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit>=1 ),
    Status     Bit                  DEFAULT 1
);

CREATE TABLE Mark(
    MarkID INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    SubID INT NOT NULL ,
    StudentID INT NOT NULL ,
    UNIQUE (SubID, StudentID),
    Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND  100),
    ExamTimes TINYINT DEFAULT 1,
    FOREIGN KEY (SubID) REFERENCES Subject(SubID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

SELECT * FROM Student;
INSERT INTO Class(ClassID, ClassName, StartDate, Status) VALUES (2,'C1221H1',24/12/2021,1);
INSERT INTO Student(StudentID, StudentName, Address, Phone, ClassID) VALUES (1,'Khanh','Hanoi','0349582375',2);