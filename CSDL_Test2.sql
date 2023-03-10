create database CSDL_Test2;
use CSDL_Test2;
create table Subjects (
                          SubjectID int(4) not null auto_increment primary key,
                          SubjectName varchar(50) not null
);
create table Classes (
                         ClassID int(4) not null auto_increment primary key,
                         ClassName varchar(50) not null
);
create table Students (
                          StudentID int(4) not null auto_increment primary key,
                          StudentName varchar(50) not null,
                          Age int(4) not null,
                          Email varchar(100) not null
);
create table ClassStudent (
                              StudentID int(4) not null,
                              ClassID int(4) not null,
                              foreign key (ClassID) references Classes(ClassID),
                              foreign key (StudentID) references Students(StudentID)
);
create table Marks (
                       Mark int(4) not null,
                       SubjectID int not null,
                       StudentID int not null,
                       foreign key (SubjectID) references Subjects(SubjectID),
                       foreign key (StudentID) references Students(StudentID)
);
INSERT INTO Students (StudentName, Age, Email)
VALUES ('Nguyen Quang An','18','an@yahoo.com'),
       ('Nguyen Cong Vinh','20','vinh@gmail.com'),
       ('Nguyen Van Quyen','19','quyen'),
       ('Pham Thanh Binh','25','binh@com'),
       ('Nguyen Van Tai Em','30','taiem@sport.vn');
INSERT INTO Classes ( ClassName)
VALUES ('C0706L'),
       ('C0708G');
INSERT INTO ClassStudent (StudentID,ClassID)
VALUES ('1','1'),
       ('2', '1'),
       ('3', '2'),
       ('4', '2'),
       ('5', '2');
INSERT INTO Subjects (SubjectName)
VALUES ('SQL'),
       ('Java'),
       ('C'),
       ('Visual Basic');
INSERT INTO Marks (Mark, SubjectID, StudentID)
VALUES ('8', '1', '1'),
       ('4', '2', '1'),
       ('9', '1', '1'),
       ('7', '1', '3'),
       ('3', '1', '4'),
       ('5', '2', '5'),
       ('8', '3', '3'),
       ('1', '3', '5'),
       ('3', '2', '4');
-- Hi???n th??? danh s??ch t???t c??? c??c h???c vi??n--
select StudentID,StudentName from Students;
-- Hi???n th??? danh s??ch t???t c??? c??c m??n h???c --
select * from Subjects;
-- T??nh ??i???m trung b??nh
select avg(Marks.Mark) Trung_Binh from Marks;
-- Hi???n th??? m??n h???c n??o c?? h???c sinh thi ???????c ??i???m cao nh???t
select Subjects.SubjectName from Subjects join Marks where Subjects.SubjectID = Marks.SubjectID order by Marks.Mark desc limit 1;
-- ????nh s??? th??? t??? c???a ??i???m theo chi???u gi???m d???n.
select * from Marks order by Mark desc;
-- Thay ?????i ki???u d??? li???u c???a c???t SubjectName th??nh varchar(max)
alter table Subjects modify column SubjectName varchar(255);
-- C???p nh???p th??m d??ng ch??? <<????y l?? m??n h???c>> v??o tr?????c c??c b???ng ghi tr??n c???t SubjectName trong b???ng Subjects
UPDATE `CSDL_Test2`.`Subjects` SET `SubjectName` = '????y l?? m??n h???c SQL' WHERE (`SubjectID` = '1');
UPDATE `CSDL_Test2`.`Subjects` SET `SubjectName` = '????y l?? m??n h???c Java' WHERE (`SubjectID` = '2');
UPDATE `CSDL_Test2`.`Subjects` SET `SubjectName` = '????y l?? m??n h???c C' WHERE (`SubjectID` = '3');
UPDATE `CSDL_Test2`.`Subjects` SET `SubjectName` = '????y l?? m??n h???c Visual Basic' WHERE (`SubjectID` = '4');
-- Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table Students add check (Age > 15 and Age < 50 );
-- Lo???i b??? t???t c??? quan h??? gi???a c??c b???ng.
ALTER TABLE `CSDL_Test2`.`Marks`
DROP FOREIGN KEY `Marks_ibfk_2`,
DROP FOREIGN KEY `Marks_ibfk_1`;
ALTER TABLE `CSDL_Test2`.`Marks`
DROP INDEX `StudentID` ,
DROP INDEX `SubjectID` ;
;
ALTER TABLE `CSDL_Test2`.`ClassStudent`
DROP FOREIGN KEY `ClassStudent_ibfk_2`,
DROP FOREIGN KEY `ClassStudent_ibfk_1`;
ALTER TABLE `CSDL_Test2`.`ClassStudent`
DROP INDEX `StudentID` ,
DROP INDEX `ClassID` ;
;
ALTER TABLE `CSDL_Test2`.`ClassStudent`
DROP FOREIGN KEY `ClassStudent_ibfk_2`,
DROP FOREIGN KEY `ClassStudent_ibfk_1`;
ALTER TABLE `CSDL_Test2`.`ClassStudent`
DROP INDEX `StudentID` ,
DROP INDEX `ClassID` ;
;
-- X??a h???c vi??n c?? StudentID = 1;
DELETE FROM `CSDL_Test2`.`Students` WHERE (`StudentID` = '1');
-- Trong b???ng student th??m m???t column Status c?? ki???u d??? li???u l?? Bit v?? c?? gi?? tr??? Default l?? 1.
alter table `CSDL_Test2`.`Students`
    add column `Status` BIT(1);
-- C???p nh???p gi?? tr??? Status trong b???ng Student th??nh 0;
update Students set `Status` = `0` where StudentID = 1;




