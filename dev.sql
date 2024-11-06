-- define a select statement to get all students enrolled in a course

SELECT 
    students.student_id,
    students.first_name,
    students.last_name,
    courses.course_name
FROM 
    students
JOIN 
    enrollments ON students.student_id = enrollments.student_id
JOIN 
    courses ON enrollments.course_id = courses.course_id;
    CREATE INDEX idx_students_student_id ON students(student_id);
    CREATE INDEX idx_enrollments_student_id ON enrollments(student_id);
    CREATE INDEX idx_enrollments_course_id ON enrollments(course_id);
    CREATE INDEX idx_courses_course_id ON courses(course_id);

-- define a table for student attendance to capture attendance by class

    CREATE TABLE student_attendance (
        attendance_id SERIAL PRIMARY KEY,
        student_id INT NOT NULL,
        course_id INT NOT NULL,
        attendance_date DATE NOT NULL,
        status VARCHAR(10) NOT NULL,
        FOREIGN KEY (student_id) REFERENCES students(student_id),
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
    );

    -- define a stored procedure to get instructor details associated with a location
    -- include instructor details, location details, and courses associated with the instructor
    -- use instructor_id as the input parameter

    CREATE OR REPLACE PROCEDURE get_instructor_details(instructor_id INT)
    LANGUAGE plpgsql
    AS $$
    BEGIN
        SELECT 
            instructors.instructor_id,
            instructors.first_name,
            instructors.last_name,
            locations.location_name,
            courses.course_name
        FROM 
            instructors
        JOIN 
            locations ON instructors.location_id = locations.location_id
        JOIN 
            courses ON instructors.instructor_id = courses.instructor_id
        WHERE 
            instructors.instructor_id = instructor_id;
    END;
    $$;

SELECT * 
FROM courses.registrations 
WHERE registration_date >= '2023-09-01' 
AND registration_date < '2023-10-01';
