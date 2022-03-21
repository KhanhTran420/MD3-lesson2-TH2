CREATE DATABASE QuanLySinhVien1;
USE QuanLySinhVien1;
CREATE TABLE Class(
    ClassID     INT         NOT NULL  PRIMARY KEY ,
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

INSERT INTO Class(ClassID, ClassName, StartDate, Status) VALUES
                                                             (1,'A1',20/12/2008,1),
                                                             (2,'A2',22/12/2008,1),
                                                             (3,'B3',CURRENT_DATE,0);
INSERT INTO Student(studentid, studentname, address, phone, status, classid) VALUES
(1,'Hung','Ha Noi',0912113113,1,1),
(2,'Hoa','Hai Phong','',1,1),
(3,'Manh','HCM',0123123123,0,2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);

