CREATE DATABASE study;
USE study;
-- Таблица "Студенты"
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    ContactInfo VARCHAR(255));

-- Таблица "Преподаватели"
CREATE TABLE Teachers (
    Teacher_ID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DateOfBirth DATE,
    ContactInfo VARCHAR(255));

-- Таблица "Предметы"
CREATE TABLE Subjects (
    Subject_ID INT PRIMARY KEY,
    SubjectName VARCHAR(255));

-- Таблица "Оценки"
CREATE TABLE Grades (
    Grade_ID INT PRIMARY KEY,
    Student_ID INT,
    Teacher_ID INT,
    Subject_ID INT,
    Grade INT CHECK (Grade >= 1 AND Grade <= 5), -- Ограничение на оценку
    DateGraded DATE,
    CONSTRAINT fk_student FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    CONSTRAINT fk_teacher FOREIGN KEY (Teacher_ID) REFERENCES Teachers(Teacher_ID),
    CONSTRAINT fk_subject FOREIGN KEY (Subject_ID) REFERENCES Subjects(Subject_ID));

-- Таблица "Курсы"
CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY,
    Student_ID INT,
    Teacher_ID INT,
    Subject_ID INT,
    YearOfStudy INT, -- Год обучения
    CONSTRAINT fk_student_course FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    CONSTRAINT fk_teacher_course FOREIGN KEY (Teacher_ID) REFERENCES Teachers(Teacher_ID),
    CONSTRAINT fk_subject_course FOREIGN KEY (Subject_ID) REFERENCES Subjects(Subject_ID));
