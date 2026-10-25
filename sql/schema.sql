DROP TABLE IF EXISTS enrollments CASCADE;
DROP TABLE IF EXISTS instructor_courses CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS instructors CASCADE;
DROP TABLE IF EXISTS categories CASCADE;

CREATE TABLE categories (
category_id SERIAL PRIMARY KEY,
category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE instructors (
instructor_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone VARCHAR(20) NOT NULL
);

CREATE TABLE courses (
course_id SERIAL PRIMARY KEY,
course_code VARCHAR(20) NOT NULL UNIQUE,
title VARCHAR(150) NOT NULL,
category_id INT NOT NULL,
credits INT NOT NULL DEFAULT 3,
CONSTRAINT fk_course_category FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE RESTRICT
);

CREATE TABLE instructor_courses (
instructor_id INT NOT NULL,
course_id INT NOT NULL,
assigned_date DATE NOT NULL DEFAULT CURRENT_DATE,
PRIMARY KEY (instructor_id, course_id),
CONSTRAINT fk_ic_instructor FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id) ON DELETE CASCADE,
CONSTRAINT fk_ic_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

CREATE TABLE students (
student_id SERIAL PRIMARY KEY,
student_number CHAR(10) NOT NULL UNIQUE,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE enrollments (
enrollment_id SERIAL PRIMARY KEY,
student_id INT NOT NULL,
course_id INT NOT NULL,
enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
CONSTRAINT fk_enrollment_student FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
CONSTRAINT fk_enrollment_course FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE RESTRICT
);