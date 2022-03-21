CREATE DATABASE QuanLySinhVien2;
USE QuanLySinhVien2;
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

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);


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

SELECT * FROM Student WHERE StudentName LIKE 'h%';
SELECT * FROM Class WHERE MONTH(StartDate) = 12;
SELECT * FROM Subject WHERE Credit BETWEEN 3 and 5;

UPDATE Student SET ClassID = 2 WHERE StudentID = 1;
SELECT Student.StudentName,Subject.SubName,M.Mark FROM Student JOIN Subject JOIN Mark M on Student.StudentID = M.StudentID and Subject.SubID = M.SubID ORDER BY Mark DESC;

SELECT * FROM Student;
SELECT * FROM Student WHERE Status = true;
SELECT * FROM Subject WHERE Credit < 10;
SELECT StudentID AS "STT", ClassName AS "Tên Lớp" , StudentName AS "Tên học sinh" FROM Class JOIN Student S on Class.ClassID = S.ClassID WHERE ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';


