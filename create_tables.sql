CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    age        INT NOT NULL
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY
);

CREATE TABLE registered_courses (
    student_id INT NOT NULL,
    course_id  INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);
CREATE TABLE grades (
    student_id INT NOT NULL,
    course_id  INT NOT NULL,
    grade      INT NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);

SELECT g.student_id, g.course_id, g.grade
FROM grades g
WHERE g.grade = (
    SELECT MAX(grade)
    FROM grades
    WHERE student_id = g.student_id
)
ORDER BY g.student_id;

SELECT student_id, AVG(grade) AS average_grade
FROM grades
GROUP BY student_id
ORDER BY student_id;























SELECT student_id, AVG(grade) AS average_grade
FROM grades
GROUP BY student_id
ORDER BY student_id;