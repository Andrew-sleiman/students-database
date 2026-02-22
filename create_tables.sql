
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

CREATE TABLE registered_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);


CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES registered_courses(course_id)
);


SELECT student_id, course_id, MAX(grade)
FROM grades
GROUP BY student_id;

SELECT student_id, AVG(grade) AS average_grade
FROM grades
GROUP BY student_id;